
'use strict';

define('admin/plugins/obsidian-exchange', ['settings'], function (Settings) {
	const ACP = {};

	ACP.init = function () {
		Settings.load('obsidian-exchange', $('.obsidian-exchange-settings'));

		$('#save').on('click', function () {
			Settings.save('obsidian-exchange', $('.obsidian-exchange-settings'));
		});
	};

	return ACP;
});
