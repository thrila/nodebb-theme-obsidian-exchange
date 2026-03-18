'use strict';

const path = require('path');

const meta = require.main.require('./src/meta');
const nconf = require.main.require('nconf');
const groups = require.main.require('./src/groups');

const theme = module.exports;
const THEME_SETTINGS_KEY = 'obsidian-exchange';
const THEME_PLUGIN_ID = 'nodebb-theme-obsidian-exchange';
const THEME_ICON_PREFIX = `/plugins/${THEME_PLUGIN_ID}/icons/`;
const IMAGE_EXTENSION_PATTERN = /\.(png|gif|jpe?g|webp|svg)(\?|#|$)/i;

function normalizeGroupKey(value) {
	return String(value || '').trim().toLowerCase();
}

function sanitizeMappingKey(value) {
	const normalized = normalizeGroupKey(value);
	return normalized || null;
}

function encodeIconSrc(value) {
	return encodeURI(value).replace(/#/g, '%23');
}

function resolveMappedIconSrc(rawValue) {
	if (typeof rawValue !== 'string') {
		return null;
	}

	let value = rawValue.trim();
	if (!value) {
		return null;
	}

	if (/^https?:\/\//i.test(value) || value.startsWith('//') || value.startsWith('/')) {
		return encodeIconSrc(value);
	}

	value = value.replace(/\\/g, '/').replace(/^\.\//, '');
	if (!value || value.includes('..')) {
		return null;
	}

	if (value.startsWith('icons/')) {
		return encodeIconSrc(`${THEME_ICON_PREFIX}${value.slice('icons/'.length)}`);
	}

	if (value.startsWith('plugins/') || value.startsWith('assets/') || value.startsWith('uploads/') || value.startsWith('api/')) {
		return encodeIconSrc(`/${value}`);
	}

	if (value.indexOf('/') === -1) {
		return encodeIconSrc(`${THEME_ICON_PREFIX}${value}`);
	}

	return encodeIconSrc(`/${value}`);
}

function parseObjectMappings(parsedValue) {
	const mappings = new Map();

	if (!parsedValue || typeof parsedValue !== 'object' || Array.isArray(parsedValue)) {
		return mappings;
	}

	Object.entries(parsedValue).forEach(([groupName, iconPath]) => {
		const key = sanitizeMappingKey(groupName);
		const src = resolveMappedIconSrc(iconPath);
		if (!key || !src) {
			return;
		}

		mappings.set(key, src);
	});

	return mappings;
}

function parseLineMappings(rawValue) {
	const mappings = new Map();

	rawValue.split(/\r?\n/).forEach((line) => {
		const trimmed = line.trim();
		if (!trimmed || trimmed.startsWith('#') || trimmed.startsWith('//')) {
			return;
		}

		const separatorMatch = trimmed.match(/^([^:=]+?)\s*(?:=|:)\s*(.+)$/);
		if (!separatorMatch) {
			return;
		}

		const key = sanitizeMappingKey(separatorMatch[1]);
		const src = resolveMappedIconSrc(separatorMatch[2]);
		if (!key || !src) {
			return;
		}

		mappings.set(key, src);
	});

	return mappings;
}

async function getGroupIconMappings() {
	const settings = await meta.settings.get(THEME_SETTINGS_KEY);
	const rawMappings = typeof settings.groupIconMappings === 'string' ? settings.groupIconMappings.trim() : '';

	if (!rawMappings) {
		return new Map();
	}

	try {
		const parsed = JSON.parse(rawMappings);
		const objectMappings = parseObjectMappings(parsed);
		if (objectMappings.size) {
			return objectMappings;
		}
	} catch (err) {
		// Fall through to simple line-based parsing for ACP convenience.
	}

	return parseLineMappings(rawMappings);
}

function extractGroupMapping(group, mappings) {
	const lookupKeys = [
		group && group.name,
		group && group.displayName,
		group && group.slug,
		group && group.systemName,
	];

	for (const key of lookupKeys) {
		const normalized = sanitizeMappingKey(key);
		if (!normalized) {
			continue;
		}

		const mappedSrc = mappings.get(normalized);
		if (mappedSrc) {
			return mappedSrc;
		}
	}

	return null;
}

function isImageToken(token) {
	return (
		/^https?:\/\//i.test(token) ||
		token.startsWith('//') ||
		token.startsWith('/') ||
		IMAGE_EXTENSION_PATTERN.test(token)
	);
}

function mergeGroupIconTokens(iconValue, mappedSrc) {
	const tokens = String(iconValue || '')
		.split(/\s+/)
		.filter(Boolean)
		.filter(token => !isImageToken(token));

	const hasFallbackIcon = tokens.some(token => token === 'fa' || token.startsWith('fa-') || /^fa[srlbd]$/.test(token));
	if (!hasFallbackIcon) {
		tokens.unshift('fa-shield');
	}

	tokens.push(mappedSrc);
	return tokens.join(' ');
}

function isGroupLike(value) {
	return Boolean(
		value &&
		typeof value === 'object' &&
		typeof value.name === 'string' &&
		(
			typeof value.slug === 'string' ||
			typeof value.displayName === 'string' ||
			typeof value.icon === 'string' ||
			typeof value.userTitleEnabled !== 'undefined'
		)
	);
}

function applyGroupIconMappings(value, mappings) {
	if (Array.isArray(value)) {
		value.forEach(item => applyGroupIconMappings(item, mappings));
		return value;
	}

	if (!value || typeof value !== 'object') {
		return value;
	}

	if (isGroupLike(value)) {
		const mappedSrc = extractGroupMapping(value, mappings);
		if (mappedSrc) {
			value.icon = mergeGroupIconTokens(value.icon, mappedSrc);
			value.imageIcon = mappedSrc;
		}
	}

	if (Array.isArray(value.groups)) {
		value.groups.forEach(group => applyGroupIconMappings(group, mappings));
	}

	if (value.group && typeof value.group === 'object') {
		applyGroupIconMappings(value.group, mappings);
	}

	return value;
}

function humanizeGroupName(value) {
	return String(value || '')
		.trim()
		.split(/\s+/)
		.filter(Boolean)
		.map(word => word.charAt(0).toUpperCase() + word.slice(1))
		.join(' ');
}

theme.defineWidgetAreas = async function (areas) {
	const locations = ['header', 'sidebar', 'footer'];
	const templates = [
		'categories.tpl', 'category.tpl', 'topic.tpl', 'users.tpl',
		'unread.tpl', 'recent.tpl', 'popular.tpl', 'top.tpl', 'tags.tpl', 'tag.tpl',
		'login.tpl', 'register.tpl',
	];
	function capitalizeFirst(str) {
		return str.charAt(0).toUpperCase() + str.slice(1);
	}
	templates.forEach((template) => {
		locations.forEach((location) => {
			areas.push({
				name: `${capitalizeFirst(template.split('.')[0])} ${capitalizeFirst(location)}`,
				template: template,
				location: location,
			});
		});
	});

	areas = areas.concat([
		{
			name: 'Account Header',
			template: 'account/profile.tpl',
			location: 'header',
		},
	]);
	return areas;
};

theme.preinit = function (params, callback) {
	nconf.set('base_templates_path', path.join(nconf.get('themes_path'), 'nodebb-theme-persona/templates'));

	callback();
};

theme.init = function (params, callback) {
	const routeHelpers = require.main.require('./src/routes/helpers');
	routeHelpers.setupAdminPageRoute(params.router, '/admin/plugins/obsidian-exchange', function (req, res) {
		res.render('admin/plugins/obsidian-exchange', {
			title: 'Obsidian Exchange Theme',
		});
	});

	callback();
};

theme.addAdminNavigation = function (header, callback) {
	header.plugins.push({
		route: '/plugins/obsidian-exchange',
		icon: 'fa-paint-brush',
		name: 'Obsidian Exchange Theme',
	});

	callback(null, header);
};

theme.getConfig = async function (config) {
	const settings = await meta.settings.get(THEME_SETTINGS_KEY);
	config.disableMasonry = settings.disableMasonry === 'on';
	config.enableQuickReply = settings.enableQuickReply === 'on';
	return config;
};

theme.addUserListFields = async function (hookData) {
	if (!Array.isArray(hookData.fields)) {
		hookData.fields = [];
	}

	if (!hookData.fields.includes('groupTitle')) {
		hookData.fields.push('groupTitle');
	}

	return hookData;
};

theme.decorateUserList = async function (hookData) {
	if (!hookData || !Array.isArray(hookData.users) || !hookData.users.length) {
		return hookData;
	}

	const users = hookData.users.filter(Boolean);
	const uids = users
		.map(user => parseInt(user && user.uid, 10))
		.filter(uid => Number.isInteger(uid) && uid > 0);
	const isAdminFlags = uids.length ? await groups.isMembers(uids, 'administrators') : [];
	const uidToAdmin = new Map();

	uids.forEach((uid, index) => {
		uidToAdmin.set(String(uid), Boolean(isAdminFlags[index]));
	});

	users.forEach((userData) => {
		const isAdministrator = uidToAdmin.get(String(userData.uid)) || false;
		const titleArray = Array.isArray(userData.groupTitleArray) ? userData.groupTitleArray.filter(Boolean) : [];
		const primaryGroupTitle = titleArray[0] || (isAdministrator ? 'administrators' : '');

		userData.isAdministrator = isAdministrator;
		userData.primaryGroupTitle = primaryGroupTitle;
		userData.primaryRoleLabel = primaryGroupTitle ? humanizeGroupName(primaryGroupTitle) : '';
	});

	return hookData;
};

theme.injectGroupIcons = async function (hookData) {
	const mappings = await getGroupIconMappings();
	if (!mappings.size) {
		return hookData;
	}

	return applyGroupIconMappings(hookData, mappings);
};
