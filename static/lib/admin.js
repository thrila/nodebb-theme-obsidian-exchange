
'use strict';

define('admin/plugins/obsidian-exchange', ['settings', 'alerts'], function (Settings, alerts) {
	const ACP = {};
	const SAVE_NAMESPACE = '.obsidianExchange';

	function cleanupSaveHandler() {
		$('#save').off('click' + SAVE_NAMESPACE);
	}

	ACP.init = function () {
		const $saveButton = $('#save');
		const $form = $('.obsidian-exchange-settings');

		if (!$form.length || !$saveButton.length) {
			cleanupSaveHandler();
			return;
		}

		Settings.load('obsidian-exchange', $form);
		$saveButton
			.addClass('btn-primary rounded-pill px-4')
			.removeClass('btn-outline-secondary');

		cleanupSaveHandler();
		$saveButton.on('click' + SAVE_NAMESPACE, function (ev) {
			if (!$('.obsidian-exchange-settings').length) {
				return;
			}

			ev.preventDefault();
			ev.stopPropagation();
			$saveButton.prop('disabled', true);

			Settings.save('obsidian-exchange', $form, function (err) {
				$saveButton.prop('disabled', false);
				if (err) {
					alerts.error(err.message || '[[admin/admin:changes-not-saved]]');
					return;
				}

				alerts.success('[[success:settings-saved]]');
			});
		});

		$(window).off('action:ajaxify.start' + SAVE_NAMESPACE).one('action:ajaxify.start' + SAVE_NAMESPACE, function () {
			cleanupSaveHandler();
		});
	};

	return ACP;
});
