
'use strict';

define('admin/plugins/obsidian-exchange', ['settings', 'alerts'], function (Settings, alerts) {
	const ACP = {};

	ACP.init = function () {
		Settings.load('obsidian-exchange', $('.obsidian-exchange-settings'));

		$('#save').on('click', function (ev) {
			ev.preventDefault();
			ev.stopPropagation();

			Settings.save('obsidian-exchange', $('.obsidian-exchange-settings'), function () {
				alerts.success('[[success:settings-saved]]');
			});
		});
	};

	return ACP;
});
