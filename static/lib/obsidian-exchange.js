$('document').ready(function () {
	var iconMarkupMap = {
		'fa-bars': '<path d="M4 7h16M4 12h16M4 17h16" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>',
		'fa-search': '<circle cx="11" cy="11" r="7" stroke="currentColor" stroke-width="1.75"></circle><path d="m20 20-3.5-3.5" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>',
		'fa-bell': '<path d="M10 21h4M5.5 16.5h13l-1.5-2.5V10a5 5 0 1 0-10 0v4l-1.5 2.5Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>',
		'fa-bell-o': '<path d="M10 21h4M5.5 16.5h13l-1.5-2.5V10a5 5 0 1 0-10 0v4l-1.5 2.5Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>',
		'fa-bell-slash-o': '<path d="M10.268 21a2 2 0 0 0 3.464 0"></path><path d="M17 17H4a1 1 0 0 1-.74-1.673C4.59 13.956 6 12.499 6 8a6 6 0 0 1 .258-1.742"></path><path d="m2 2 20 20"></path><path d="M8.668 3.01A6 6 0 0 1 18 8c0 2.687.77 4.653 1.707 6.05"></path>',
		'fa-home': '<path d="M15 21v-8a1 1 0 0 0-1-1h-4a1 1 0 0 0-1 1v8"></path><path d="M3 10a2 2 0 0 1 .709-1.528l7-6a2 2 0 0 1 2.582 0l7 6A2 2 0 0 1 21 10v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>',
		'fa-globe': '<circle cx="12" cy="12" r="10"></circle><path d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20"></path><path d="M2 12h20"></path>',
		'fa-caret-down': '<path d="m7 10 5 5 5-5" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>',
		'fa-chevron-left': '<path d="m15 18-6-6 6-6"></path>',
		'fa-chevron-right': '<path d="m9 18 6-6-6-6"></path>',
		'fa-chevron-up': '<path d="m18 15-6-6-6 6"></path>',
		'fa-chevron-down': '<path d="m6 9 6 6 6-6"></path>',
		'fa-fast-backward': '<path d="m11 17-5-5 5-5"></path><path d="m18 17-5-5 5-5"></path>',
		'fa-fast-forward': '<path d="m6 17 5-5-5-5"></path><path d="m13 17 5-5-5-5"></path>',
		'fa-ellipsis-h': '<circle cx="12" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle>',
		'fa-ellipsis-v': '<circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="19" r="1"></circle>',
		'fa-arrow-down-wide-short': '<path d="m3 16 4 4 4-4"></path><path d="M7 20V4"></path><path d="M11 4h10"></path><path d="M11 8h7"></path><path d="M11 12h4"></path>',
		'fa-check': '<path d="m5 12 4 4 10-10" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>',
		'fa-times': '<path d="M18 6 6 18M6 6l12 12" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>',
		'fa-pencil': '<path d="M12 20h9M16.5 3.5a2.1 2.1 0 0 1 3 3L7 19l-4 1 1-4 12.5-12.5Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>',
		'fa-sign-in': '<path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4M10 17l5-5-5-5M15 12H3" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>',
		'fa-sign-in-alt': '<path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4M10 17l5-5-5-5M15 12H3" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>',
		'fa-reply': '<path d="M20 18v-2a4 4 0 0 0-4-4H4"></path><path d="m9 17-5-5 5-5"></path>',
		'fa-comments': '<path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>',
		'fa-comment': '<path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>',
		'fa-inbox': '<polyline points="22 12 16 12 14 15 10 15 8 12 2 12"></polyline><path d="M5.45 5.11 2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z"></path>',
		'fa-clock-o': '<path d="M12 6v6l4 2"></path><circle cx="12" cy="12" r="10"></circle>',
		'fa-eye': '<path d="M2.062 12.348a1 1 0 0 1 0-.696 10.75 10.75 0 0 1 19.876 0 1 1 0 0 1 0 .696 10.75 10.75 0 0 1-19.876 0"></path><circle cx="12" cy="12" r="3"></circle>',
		'fa-eye-slash': '<path d="M10.733 5.076a10.744 10.744 0 0 1 11.205 6.575 1 1 0 0 1 0 .696 10.747 10.747 0 0 1-1.444 2.49"></path><path d="M14.084 14.158a3 3 0 0 1-4.242-4.242"></path><path d="M17.479 17.499a10.75 10.75 0 0 1-15.417-5.151 1 1 0 0 1 0-.696 10.75 10.75 0 0 1 4.446-5.143"></path><path d="m2 2 20 20"></path>',
		'fa-users': '<path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path><circle cx="8.5" cy="7" r="4" stroke="currentColor" stroke-width="1.75"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>',
		'fa-user': '<path d="M20 21a8 8 0 1 0-16 0" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path><circle cx="12" cy="7" r="4" stroke="currentColor" stroke-width="1.75"></circle>',
		'fa-bullhorn': '<path d="M3 11v2a1 1 0 0 0 1 1h2l3 5h2l-2.5-5H13l6 4V6l-6 4H4a1 1 0 0 0-1 1Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>',
		'fa-newspaper': '<rect x="3" y="4" width="18" height="16" rx="2" stroke="currentColor" stroke-width="1.75"></rect><path d="M7 8h6M7 12h10M7 16h10" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>',
		'fa-shopping-bag': '<path d="M6 7h12l1 13H5L6 7Z" stroke="currentColor" stroke-width="1.75" stroke-linejoin="round"></path><path d="M9 7a3 3 0 1 1 6 0" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>',
		'fa-shield': '<path d="M12 3 5 6v5c0 5 3.5 8.5 7 10 3.5-1.5 7-5 7-10V6l-7-3Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>',
		'fa-lock': '<rect x="5" y="11" width="14" height="10" rx="2" stroke="currentColor" stroke-width="1.75"></rect><path d="M8 11V8a4 4 0 1 1 8 0v3" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>',
		'fa-unlock': '<rect width="18" height="11" x="3" y="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 9.9-1"></path>',
		'fa-gear': '<path d="M9.671 4.136a2.34 2.34 0 0 1 4.659 0 2.34 2.34 0 0 0 3.319 1.915 2.34 2.34 0 0 1 2.33 4.033 2.34 2.34 0 0 0 0 3.831 2.34 2.34 0 0 1-2.33 4.033 2.34 2.34 0 0 0-3.319 1.915 2.34 2.34 0 0 1-4.659 0 2.34 2.34 0 0 0-3.32-1.915 2.34 2.34 0 0 1-2.33-4.033 2.34 2.34 0 0 0 0-3.831A2.34 2.34 0 0 1 6.35 6.051a2.34 2.34 0 0 0 3.319-1.915"></path><circle cx="12" cy="12" r="3"></circle>',
		'fa-thumb-tack': '<path d="M12 17v5"></path><path d="M9 10.76a2 2 0 0 1-1.11 1.79l-1.78.9A2 2 0 0 0 5 15.24V16a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-.76a2 2 0 0 0-1.11-1.79l-1.78-.9A2 2 0 0 1 15 10.76V7a1 1 0 0 1 1-1 2 2 0 0 0 0-4H8a2 2 0 0 0 0 4 1 1 0 0 1 1 1z"></path>',
		'fa-arrows': '<path d="M12 2v20"></path><path d="m15 19-3 3-3-3"></path><path d="m19 9 3 3-3 3"></path><path d="M2 12h20"></path><path d="m5 9-3 3 3 3"></path><path d="m9 5 3-3 3 3"></path>',
		'fa-code-fork': '<line x1="6" x2="6" y1="3" y2="15"></line><circle cx="18" cy="6" r="3"></circle><circle cx="6" cy="18" r="3"></circle><path d="M18 9a9 9 0 0 1-9 9"></path>',
		'fa-tag': '<path d="M12.586 2.586A2 2 0 0 0 11.172 2H4a2 2 0 0 0-2 2v7.172a2 2 0 0 0 .586 1.414l8.704 8.704a2.426 2.426 0 0 0 3.42 0l6.58-6.58a2.426 2.426 0 0 0 0-3.42z"></path><circle cx="7.5" cy="7.5" r=".5" fill="currentColor"></circle>',
		'fa-trash-o': '<path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6"></path><path d="M3 6h18"></path><path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>',
		'fa-history': '<path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8"></path><path d="M3 3v5h5"></path><path d="M12 7v5l4 2"></path>',
		'fa-eraser': '<path d="M21 21H8a2 2 0 0 1-1.42-.587l-3.994-3.999a2 2 0 0 1 0-2.828l10-10a2 2 0 0 1 2.829 0l5.999 6a2 2 0 0 1 0 2.828L12.834 21"></path><path d="m5.082 11.09 8.828 8.828"></path>',
		'fa-list': '<path d="M3 5h.01"></path><path d="M3 12h.01"></path><path d="M3 19h.01"></path><path d="M8 5h13"></path><path d="M8 12h13"></path><path d="M8 19h13"></path>',
		'fa-rss': '<path d="M4 11a9 9 0 0 1 9 9"></path><path d="M4 4a16 16 0 0 1 16 16"></path><circle cx="5" cy="19" r="1"></circle>',
		'fa-square-arrow-up-right': '<rect width="18" height="18" x="3" y="3" rx="2"></rect><path d="M8 8h8v8"></path><path d="m8 16 8-8"></path>',
		'fa-square-o': '<rect width="18" height="18" x="3" y="3" rx="2"></rect>',
		'fa-square': '<rect width="18" height="18" x="3" y="3" rx="2"></rect>',
		'fa-upload': '<path d="M12 3v12"></path><path d="m17 8-5-5-5 5"></path><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>',
		'fa-floppy-o': '<path d="M4 4h13l3 3v13H4z" stroke="currentColor" stroke-width="1.75" stroke-linejoin="round"></path><path d="M8 4v6h8V4" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path><rect x="8" y="14" width="8" height="6" rx="1" stroke="currentColor" stroke-width="1.75"></rect>',
		'fa-refresh': '<path d="M21 12a9 9 0 1 1-3.2-6.9" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path><path d="M21 3v6h-6" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>',
		'fa-expand': '<path d="m15 15 6 6"></path><path d="m15 9 6-6"></path><path d="M21 16v5h-5"></path><path d="M21 8V3h-5"></path><path d="M3 16v5h5"></path><path d="m3 21 6-6"></path><path d="M3 8V3h5"></path><path d="M9 9 3 3"></path>',
		'fa-paint-brush': '<path d="m14.622 17.897-10.68-2.913"></path><path d="M18.376 2.622a1 1 0 1 1 3.002 3.002L17.36 9.643a.5.5 0 0 0 0 .707l.944.944a2.41 2.41 0 0 1 0 3.408l-.944.944a.5.5 0 0 1-.707 0L8.354 7.348a.5.5 0 0 1 0-.707l.944-.944a2.41 2.41 0 0 1 3.408 0l.944.944a.5.5 0 0 0 .707 0z"></path><path d="M9 8c-1.804 2.71-3.97 3.46-6.583 3.948a.507.507 0 0 0-.302.819l7.32 8.883a1 1 0 0 0 1.185.204C12.735 20.405 16 16.792 16 15"></path>',
		'fa-calendar': '<path d="M8 2v4"></path><path d="M16 2v4"></path><rect width="18" height="18" x="3" y="4" rx="2"></rect><path d="M3 10h18"></path>',
		'fa-calendar-o': '<path d="M8 2v4"></path><path d="M16 2v4"></path><rect width="18" height="18" x="3" y="4" rx="2"></rect><path d="M3 10h18"></path>',
		'fa-code': '<path d="m8 9-5 3 5 3M16 9l5 3-5 3M14 4l-4 16" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>',
		'fa-gamepad': '<rect x="3" y="9" width="18" height="9" rx="4.5" stroke="currentColor" stroke-width="1.75"></rect><path d="M8 12v4M6 14h4M15.5 13h.01M18.5 15h.01" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>',
		'fa-book': '<path d="M4 6a3 3 0 0 1 3-3h13v17H7a3 3 0 0 0-3 3V6Z" stroke="currentColor" stroke-width="1.75" stroke-linejoin="round"></path><path d="M7 3v17" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>',
		'fa-star': '<path d="m12 3 2.8 5.6L21 9.4l-4.5 4.4 1 6.2L12 17.1 6.5 20l1-6.2L3 9.4l6.2-.8L12 3Z" stroke="currentColor" stroke-width="1.75" stroke-linejoin="round"></path>',
		'fa-heart': '<path d="M12 20.5s-7-4.5-9-9c-1.5-3.3.6-7 4.3-7 2 0 3.8 1.1 4.7 2.8.9-1.7 2.7-2.8 4.7-2.8 3.7 0 5.8 3.7 4.3 7-2 4.5-9 9-9 9Z" stroke="currentColor" stroke-width="1.75" stroke-linejoin="round"></path>',
		'fa-cog': '<circle cx="12" cy="12" r="3.5" stroke="currentColor" stroke-width="1.75"></circle><path d="M19.4 15a1.7 1.7 0 0 0 .3 1.8l.1.1a2 2 0 1 1-2.8 2.8l-.1-.1a1.7 1.7 0 0 0-1.8-.3 1.7 1.7 0 0 0-1 1.5V21a2 2 0 1 1-4 0v-.2a1.7 1.7 0 0 0-1-1.5 1.7 1.7 0 0 0-1.8.3l-.1.1a2 2 0 1 1-2.8-2.8l.1-.1a1.7 1.7 0 0 0 .3-1.8 1.7 1.7 0 0 0-1.5-1H3a2 2 0 1 1 0-4h.2a1.7 1.7 0 0 0 1.5-1 1.7 1.7 0 0 0-.3-1.8l-.1-.1a2 2 0 1 1 2.8-2.8l.1.1a1.7 1.7 0 0 0 1.8.3h0a1.7 1.7 0 0 0 1-1.5V3a2 2 0 1 1 4 0v.2a1.7 1.7 0 0 0 1 1.5h0a1.7 1.7 0 0 0 1.8-.3l.1-.1a2 2 0 1 1 2.8 2.8l-.1.1a1.7 1.7 0 0 0-.3 1.8v0a1.7 1.7 0 0 0 1.5 1H21a2 2 0 1 1 0 4h-.2a1.7 1.7 0 0 0-1.5 1Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>',
		'fa-briefcase': '<rect x="3" y="7" width="18" height="13" rx="2" stroke="currentColor" stroke-width="1.75"></rect><path d="M9 7V5a2 2 0 0 1 2-2h2a2 2 0 0 1 2 2v2M3 12h18" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>',
		'fa-gavel': '<path d="m14 4 6 6M8 10l6 6M3 21l6-6M9 15l5-5" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path><rect x="11.5" y="2.5" width="4" height="8" rx="1" transform="rotate(45 11.5 2.5)" stroke="currentColor" stroke-width="1.75"></rect>',
		'fa-life-ring': '<circle cx="12" cy="12" r="9" stroke="currentColor" stroke-width="1.75"></circle><circle cx="12" cy="12" r="3.5" stroke="currentColor" stroke-width="1.75"></circle><path d="m5.6 5.6 3 3M15.4 15.4l3 3M18.4 5.6l-3 3M8.6 15.4l-3 3" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>',
	};

	function isIgnorableFaClass(token) {
		return (
			token === 'fa' ||
			token === 'fa-fw' ||
			token === 'fa-lg' ||
			token === 'fa-2x' ||
			token === 'fa-3x' ||
			token === 'fa-4x' ||
			token === 'fa-5x' ||
			token === 'fa-border' ||
			token === 'fa-li' ||
			token === 'fa-inverse' ||
			token === 'fa-regular' ||
			token === 'fa-solid' ||
			token === 'fa-light' ||
			token === 'fa-thin' ||
			token === 'fa-duotone' ||
			token === 'fa-brands' ||
			token === 'fas' ||
			token === 'far' ||
			token === 'fal' ||
			token === 'fad' ||
			token === 'fab' ||
			token.indexOf('fa-spin') === 0 ||
			token.indexOf('fa-pulse') === 0 ||
			token.indexOf('fa-rotate-') === 0 ||
			token.indexOf('fa-flip-') === 0 ||
			token.indexOf('fa-stack-') === 0 ||
			token.indexOf('fa-pull-') === 0
		);
	}

	function tokenLooksLikeImagePath(token) {
		if (!token) {
			return false;
		}

		return (
			/^https?:\/\//i.test(token) ||
			token.indexOf('//') === 0 ||
			token.indexOf('/') !== -1 ||
			/\.(png|gif|jpe?g|webp|svg)(\?|#|$)/i.test(token)
		);
	}

	function extractImageSrcFromToken(token) {
		if (!token || isIgnorableFaClass(token)) {
			return null;
		}

		var decoded = token;
		try {
			decoded = decodeURIComponent(token);
		} catch (err) {
			decoded = token;
		}

		var candidates = [decoded, token];
		for (var i = 0; i < candidates.length; i += 1) {
			var candidate = candidates[i];
			if (!candidate) {
				continue;
			}

			if (tokenLooksLikeImagePath(candidate) && candidate.indexOf('fa-') !== 0) {
				return candidate;
			}

			if (candidate.indexOf('fa-') === 0) {
				var stripped = candidate.slice(3);
				if (tokenLooksLikeImagePath(stripped)) {
					return stripped;
				}
			}
		}

		return null;
	}

	function getBadgeImageSrcFromIcon(icon) {
		var dataIconSrc = icon.getAttribute('data-icon-src') || icon.dataset.iconSrc;
		if (dataIconSrc) {
			return dataIconSrc;
		}

		var src = null;
		Array.from(icon.classList).some(function (token) {
			var extractedSrc = extractImageSrcFromToken(token);
			if (!extractedSrc) {
				return false;
			}

			src = extractedSrc;
			return true;
		});

		return src;
	}

	function isGroupBadgeIcon(icon) {
		return Boolean(icon.closest('.group-label, [component="user/group-label"], a.badge[href*="/groups/"]'));
	}

	function normalizeFaIconClass(classList) {
		var iconClass = null;

		classList.forEach(function (token) {
			if (iconClass || token.indexOf('fa-') !== 0 || isIgnorableFaClass(token)) {
				return;
			}
			iconClass = token;
		});

		if (!iconClass) {
			return null;
		}

		if (iconMarkupMap[iconClass]) {
			return iconClass;
		}

		if (iconClass.endsWith('-o')) {
			var withoutOutline = iconClass.slice(0, -2);
			if (iconMarkupMap[withoutOutline]) {
				return withoutOutline;
			}
		}

		return iconClass;
	}

	function createCategoryLucideSvg(iconClass) {
		var svgNamespace = 'http://www.w3.org/2000/svg';
		var svg = document.createElementNS(svgNamespace, 'svg');
		var markup = iconMarkupMap[iconClass] || iconMarkupMap['fa-comments'];

		svg.setAttribute('viewBox', '0 0 24 24');
		svg.setAttribute('fill', 'none');
		svg.setAttribute('stroke', 'currentColor');
		svg.setAttribute('stroke-width', '1.75');
		svg.setAttribute('stroke-linecap', 'round');
		svg.setAttribute('stroke-linejoin', 'round');
		svg.setAttribute('aria-hidden', 'true');
		svg.setAttribute('class', 'oe-icon oe-icon-lg oe-category-lucide');
		svg.innerHTML = markup;

		return svg;
	}

	function renderCategoryLucideIcons() {
		document.querySelectorAll('.forum-category-banner i.fa, .forum-category-child i.fa, .thread-meta-line i.fa, .category-dropdown-container i.fa').forEach(function (icon) {
			if (icon.dataset.oeLucideBound === '1') {
				return;
			}

			var iconClass = normalizeFaIconClass(icon.classList);
			var lucideIcon = createCategoryLucideSvg(iconClass);

			icon.classList.add('oe-fa-fallback');
			icon.dataset.oeLucideBound = '1';
			icon.insertAdjacentElement('afterend', lucideIcon);
		});
	}

	function renderGenericLucideIcons(root) {
		var scope = root || document;

		scope.querySelectorAll('.forum-app i.fa, .forum-app i.fa-regular, .forum-app i.fa-solid, #menu i.fa, #chats-menu i.fa').forEach(function (icon) {
			if (icon.dataset.oeLucideBound === '1') {
				return;
			}

			if (icon.hasAttribute('component')) {
				return;
			}

			if (icon.closest('.forum-topbar')) {
				return;
			}

			if (isGroupBadgeIcon(icon) && getBadgeImageSrcFromIcon(icon)) {
				return;
			}

			var iconClass = normalizeFaIconClass(icon.classList);
			if (!iconClass || !iconMarkupMap[iconClass]) {
				return;
			}

			var lucideIcon = createCategoryLucideSvg(iconClass);
			lucideIcon.classList.remove('oe-icon-lg', 'oe-category-lucide');
			lucideIcon.classList.add('oe-icon');

			if (icon.classList.contains('fa-2x') || icon.classList.contains('fa-lg')) {
				lucideIcon.classList.add('oe-icon-lg');
			}

			Array.from(icon.classList).forEach(function (token) {
				if (token === 'fa' || token.indexOf('fa-') === 0) {
					return;
				}
				lucideIcon.classList.add(token);
			});

			Array.from(icon.attributes).forEach(function (attr) {
				if (attr.name === 'class') {
					return;
				}
				lucideIcon.setAttribute(attr.name, attr.value);
			});

			if (!lucideIcon.hasAttribute('aria-hidden')) {
				lucideIcon.setAttribute('aria-hidden', 'true');
			}

			icon.dataset.oeLucideBound = '1';
			icon.replaceWith(lucideIcon);
		});
	}

	function renderGroupBadgeImages(root) {
		var scope = root || document;

		scope.querySelectorAll('.group-label i, [component="user/group-label"] i, a.badge[href*="/groups/"] i').forEach(function (icon) {
			if (icon.dataset.oeBadgeImageBound === '1') {
				return;
			}

			var src = getBadgeImageSrcFromIcon(icon);
			if (!src) {
				return;
			}

			try {
				src = decodeURIComponent(src);
			} catch (err) {
				// Keep original src when token isn't URI-encoded.
			}

			if (!/^https?:\/\//i.test(src) && src.indexOf('//') !== 0 && src.indexOf('/') !== 0) {
				if (typeof config !== 'undefined' && config.relative_path) {
					src = config.relative_path.replace(/\/$/, '') + '/' + src;
				} else {
					src = '/' + src;
				}
			}

			var img = document.createElement('img');
			img.src = src;
			img.alt = '';
			img.setAttribute('aria-hidden', 'true');
			img.className = 'oe-badge-icon';

			icon.dataset.oeBadgeImageBound = '1';
			icon.replaceWith(img);
		});
	}

	function renderTopbarLucideIcons(root) {
		var scope = root || document;

		scope.querySelectorAll('.forum-topbar i.fa, .forum-topbar i.fa-regular, .forum-topbar i.fa-solid').forEach(function (icon) {
			if (icon.dataset.oeLucideBound === '1') {
				return;
			}

			// Keep component-driven icons in FA form so NodeBB runtime class updates stay stable.
			if (icon.hasAttribute('component')) {
				return;
			}

			var iconClass = normalizeFaIconClass(icon.classList);
			if (!iconClass || !iconMarkupMap[iconClass]) {
				return;
			}

			var lucideIcon = createCategoryLucideSvg(iconClass);
			lucideIcon.classList.remove('oe-icon-lg', 'oe-category-lucide');
			lucideIcon.classList.add('oe-topbar-icon');

			Array.from(icon.classList).forEach(function (token) {
				if (token === 'fa' || token.indexOf('fa-') === 0) {
					return;
				}
				lucideIcon.classList.add(token);
			});

			Array.from(icon.attributes).forEach(function (attr) {
				if (attr.name === 'class') {
					return;
				}
				lucideIcon.setAttribute(attr.name, attr.value);
			});

			if (!lucideIcon.hasAttribute('aria-hidden')) {
				lucideIcon.setAttribute('aria-hidden', 'true');
			}

			icon.dataset.oeLucideBound = '1';
			icon.replaceWith(lucideIcon);
		});
	}

	function isTopicSelectChecked(selectControl) {
		var classNames = Array.from(selectControl.classList);
		var hasCheckedClass = classNames.some(function (token) {
			return (
				/check.*square/.test(token) ||
				/square.*check/.test(token)
			);
		});

		return (
			hasCheckedClass ||
			selectControl.classList.contains('selected') ||
			selectControl.classList.contains('checked') ||
			selectControl.getAttribute('aria-checked') === 'true'
		);
	}

	function syncTopicSelectControls(root) {
		var scope = root || document;

		scope.querySelectorAll('.oe-select-control [component="topic/select"]').forEach(function (selectControl) {
			var wrapper = selectControl.closest('.oe-select-control');
			if (!wrapper) {
				return;
			}

			wrapper.classList.toggle('is-checked', isTopicSelectChecked(selectControl));

			if (selectControl.dataset.oeSelectObserved === '1') {
				return;
			}

			var observer = new MutationObserver(function () {
				wrapper.classList.toggle('is-checked', isTopicSelectChecked(selectControl));
			});

			observer.observe(selectControl, {
				attributes: true,
				attributeFilter: ['class', 'aria-checked'],
			});
			selectControl.dataset.oeSelectObserved = '1';
		});
	}

	function applyTopbarTooltipTheme(root) {
		var scope = root || document;
		var selector = '.forum-topbar [data-bs-toggle="tooltip"], .forum-topbar [data-toggle="tooltip"], .forum-topbar [title], .forum-topbar [data-original-title], .forum-topbar [data-bs-original-title]';

		scope.querySelectorAll(selector).forEach(function (target) {
			target.setAttribute('data-bs-custom-class', 'oe-topbar-tooltip');

			if (!window.bootstrap || !window.bootstrap.Tooltip || typeof window.bootstrap.Tooltip.getInstance !== 'function') {
				return;
			}

			var existingInstance = window.bootstrap.Tooltip.getInstance(target);
			if (!existingInstance) {
				return;
			}

			existingInstance.dispose();
			window.bootstrap.Tooltip.getOrCreateInstance(target, {
				customClass: 'oe-topbar-tooltip',
				container: 'body',
			});
		});
	}

	function syncPanelOffset() {
		if (typeof window.__oeSetPanelOffset !== 'function') {
			return;
		}

		window.__oeSetPanelOffset();
		window.requestAnimationFrame(window.__oeSetPanelOffset);
	}

	renderCategoryLucideIcons();
	renderTopbarLucideIcons();
	renderGenericLucideIcons();
	renderGroupBadgeImages();
	syncTopicSelectControls();
	applyTopbarTooltipTheme();
	syncPanelOffset();

	$(document).on('click', '#mobile-menu, #mobile-chats, .navbar .navbar-search button[type="button"]', function () {
		window.setTimeout(syncPanelOffset, 0);
	});

	$(document).on('focus blur', '.navbar .navbar-search input[name="term"]', function () {
		window.setTimeout(syncPanelOffset, 16);
	});

	require([
		'masonry-layout',
		'imagesloaded',
	], function (Masonry) {
		var fixed = localStorage.getItem('fixed') || 1;
		var masonry;
		var masonryCalled = false;

		function doMasonry() {
			masonryCalled = true;
			if ($('.masonry').length) {
				masonry = new Masonry('.masonry', {
					itemSelector: '.category-item',
					columnWidth: '.category-item:not(.col-lg-12):not(.category-section)',
					transitionDuration: 0,
					isInitLayout: false,
					isOriginLeft: $('html').attr('data-dir') === 'ltr',
				});

				$('.row.categories > div p img').imagesLoaded(function () {
					masonry.layout();
				});

				var saved = JSON.parse(localStorage.getItem('masonry:layout'));
				if (saved) {
					for (const [cid, category] of Object.entries(saved)) {
						$('.category-item[data-cid="' + cid + '"]').css({
							left: category.left,
							top: category.top,
							position: 'absolute',
						});
					}
				}

				masonry.on('layoutComplete', function () {
					var layoutCache = {};

					$('.category-item').each(function () {
						var $this = $(this);

						layoutCache[$this.attr('data-cid')] = {
							left: $this.css('left'),
							top: $this.css('top'),
						};
					});

					localStorage.setItem('masonry:layout', JSON.stringify(layoutCache));
				});
			}
		}

		function resize(fixedValue) {
			fixedValue = parseInt(fixedValue, 10);

			var container = fixedValue ? $('.container-fluid') : $('.container');
			container.toggleClass('container-fluid', fixedValue !== 1).toggleClass('container', fixedValue === 1);
			localStorage.setItem('fixed', fixedValue);
		}

		resize(fixed);
		renderCategoryLucideIcons();
		syncTopicSelectControls();

		$(window).on('action:ajaxify.end', function (ev, data) {
			if (!/^admin\//.test(data.url)) {
				renderCategoryLucideIcons();
				renderTopbarLucideIcons();
				renderGenericLucideIcons();
				renderGroupBadgeImages();
				syncTopicSelectControls();
				applyTopbarTooltipTheme();
				syncPanelOffset();
			}

			if (!/^admin\//.test(data.url) && !/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
				doMasonry();
			}
		});

		if (!$('.admin').length) {
			setupResizer();
		}

		$(window).on('action:posts.loaded', function () {
			doMasonry();
			renderCategoryLucideIcons();
			renderTopbarLucideIcons();
			renderGenericLucideIcons();
			renderGroupBadgeImages();
			syncTopicSelectControls();
			applyTopbarTooltipTheme();
			syncPanelOffset();
		});

		if ($('.masonry').length && !masonryCalled) {
			doMasonry();
		}

		function setupResizer() {
			var resizerIcon = '<svg class="oe-icon oe-icon-lg" viewBox="0 0 24 24" fill="none" aria-hidden="true"><path d="M4 12h16M12 4v16" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path></svg>';
			var div = $('<div class="overlay-container"><div class="card resizer pointer"><div class="card-body">' + resizerIcon + '</div></div></div>');

			div.css({
				position: 'fixed',
				bottom: '20px',
				right: '20px',
			}).hide().appendTo(document.body);

			$(window).on('mousemove', function (ev) {
				if (ev.clientX > $(window).width() - 150 && ev.clientY > $(window).height() - 150) {
					div.fadeIn();
				} else {
					div.stop(true, true).fadeOut();
				}
			});

			div.find('.resizer').on('click', function () {
				fixed = parseInt(fixed, 10) === 1 ? 0 : 1;
				resize(fixed);
				doMasonry();
			});
		}
	});

	$(window).on('action:ajaxify.start', function () {
		var collapse = $('.navbar .navbar-collapse');
		if (collapse.hasClass('show') || collapse.hasClass('in')) {
			var toggle = $('.navbar .navbar-toggler, .navbar-header button').first();
			if (toggle.length) {
				toggle.trigger('click');
			}
		}
		syncPanelOffset();
	});
});
