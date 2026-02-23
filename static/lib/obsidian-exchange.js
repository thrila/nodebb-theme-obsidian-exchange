$('document').ready(function () {
	var iconMarkupMap = {
		'fa-comments': '<path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>',
		'fa-comment': '<path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>',
		'fa-users': '<path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path><circle cx="8.5" cy="7" r="4" stroke="currentColor" stroke-width="1.75"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>',
		'fa-user': '<path d="M20 21a8 8 0 1 0-16 0" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path><circle cx="12" cy="7" r="4" stroke="currentColor" stroke-width="1.75"></circle>',
		'fa-bullhorn': '<path d="M3 11v2a1 1 0 0 0 1 1h2l3 5h2l-2.5-5H13l6 4V6l-6 4H4a1 1 0 0 0-1 1Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>',
		'fa-newspaper': '<rect x="3" y="4" width="18" height="16" rx="2" stroke="currentColor" stroke-width="1.75"></rect><path d="M7 8h6M7 12h10M7 16h10" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>',
		'fa-shopping-bag': '<path d="M6 7h12l1 13H5L6 7Z" stroke="currentColor" stroke-width="1.75" stroke-linejoin="round"></path><path d="M9 7a3 3 0 1 1 6 0" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>',
		'fa-shield': '<path d="M12 3 5 6v5c0 5 3.5 8.5 7 10 3.5-1.5 7-5 7-10V6l-7-3Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>',
		'fa-lock': '<rect x="5" y="11" width="14" height="10" rx="2" stroke="currentColor" stroke-width="1.75"></rect><path d="M8 11V8a4 4 0 1 1 8 0v3" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>',
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
			token.indexOf('fa-spin') === 0 ||
			token.indexOf('fa-pulse') === 0 ||
			token.indexOf('fa-rotate-') === 0 ||
			token.indexOf('fa-flip-') === 0 ||
			token.indexOf('fa-stack-') === 0 ||
			token.indexOf('fa-pull-') === 0
		);
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
		svg.setAttribute('aria-hidden', 'true');
		svg.setAttribute('class', 'oe-icon oe-icon-lg oe-category-lucide');
		svg.innerHTML = markup;

		return svg;
	}

	function renderCategoryLucideIcons() {
		document.querySelectorAll('.forum-category-banner i.fa').forEach(function (icon) {
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

	renderCategoryLucideIcons();
	syncTopicSelectControls();
	applyTopbarTooltipTheme();

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
				syncTopicSelectControls();
				applyTopbarTooltipTheme();
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
			syncTopicSelectControls();
			applyTopbarTooltipTheme();
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
		if ($('.navbar .navbar-collapse').hasClass('in')) {
			$('.navbar-header button').trigger('click');
		}
	});
});
