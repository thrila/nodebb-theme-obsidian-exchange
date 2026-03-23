<!DOCTYPE html>
<html lang="{function.localeToHTML, userLang, defaultLang}" {{{if languageDirection}}}data-dir="{languageDirection}" style="direction: {languageDirection};"{{{end}}}>
<head>
	<title>{browserTitle}</title>
	{{{each metaTags}}}{function.buildMetaTag}{{{end}}}
	<link rel="stylesheet" type="text/css" href="{relative_path}/assets/client{{{if bootswatchSkin}}}-{bootswatchSkin}{{{end}}}{{{ if (languageDirection=="rtl") }}}-rtl{{{ end }}}.css?{config.cache-buster}" />
	{{{each linkTags}}}{function.buildLinkTag}{{{end}}}

	<script>
		var config = JSON.parse('{{configJSON}}');
		var app = {
			user: JSON.parse('{{userJSON}}')
		};

		(() => {
			let storedOffset = 0;
			try {
				storedOffset = parseInt(localStorage.getItem('panelOffset') || '0', 10) || 0;
			} catch (err) {
				storedOffset = 0;
			}

			// Keep content below the fixed topbar even before runtime measurements finish.
			const initialOffset = storedOffset > 0 ? storedOffset : 0;
			document.documentElement.style.setProperty('--panel-offset', String(initialOffset) + 'px');
		})();
	</script>

	{{{if useCustomHTML}}}
	{{customHTML}}
	{{{end}}}
	{{{if useCustomCSS}}}
	<style>{{customCSS}}</style>
	{{{end}}}
</head>

<body class="{bodyClass} skin-{{{if bootswatchSkin}}}{bootswatchSkin}{{{else}}}noskin{{{end}}}">
	<nav id="menu" class="slideout-menu hidden">
		<!-- IMPORT partials/slideout-menu.tpl -->
	</nav>
	<nav id="chats-menu" class="slideout-menu hidden">
		<!-- IMPORT partials/chats-menu.tpl -->
	</nav>

	<main id="panel" class="slideout-panel forum-app">
		<nav class="navbar navbar-expand-lg forum-topbar header" id="header-menu" component="navbar">
			<div class="forum-topbar-inner justify-content-start">
				<!-- IMPORT partials/menu.tpl -->
			</div>
		</nav>
		<script>
			(() => {
				const readPanelOffsetExtra = () => {
					const value = getComputedStyle(document.documentElement).getPropertyValue('--panel-offset-extra');
					const parsed = parseInt(value, 10);
					return Number.isFinite(parsed) ? parsed : 80;
				};

				const setPanelOffset = () => {
					const header = document.getElementById('header-menu');
					if (!header) {
						return;
					}

					const extraOffset = readPanelOffsetExtra();
					const offset = Math.ceil(header.getBoundingClientRect().height) + extraOffset;
					document.documentElement.style.setProperty('--panel-offset', String(offset) + 'px');
					try {
						localStorage.setItem('panelOffset', String(offset));
					} catch (err) {
						// Ignore storage failures (private mode/restrictions).
					}
				};

				window.__oeSetPanelOffset = setPanelOffset;
				setPanelOffset();
				window.requestAnimationFrame(setPanelOffset);
				window.addEventListener('load', setPanelOffset, { once: true });

				if (document.fonts && !window.__oePanelOffsetFontsBound) {
					window.__oePanelOffsetFontsBound = true;
					document.fonts.ready.then(() => {
						if (typeof window.__oeSetPanelOffset === 'function') {
							window.__oeSetPanelOffset();
						}
					}).catch(() => {
						// Ignore font loading errors and keep current spacing.
					});
				}

				if ('ResizeObserver' in window) {
					if (window.__oeHeaderResizeObserver) {
						window.__oeHeaderResizeObserver.disconnect();
					}

					const header = document.getElementById('header-menu');
					if (header) {
						const resizeObserver = new ResizeObserver(() => {
							if (typeof window.__oeSetPanelOffset === 'function') {
								window.__oeSetPanelOffset();
							}
						});
						resizeObserver.observe(header);
						window.__oeHeaderResizeObserver = resizeObserver;
					}
				}

				if (!window.__oePanelOffsetEventsBound) {
					window.__oePanelOffsetEventsBound = true;

					window.addEventListener('resize', () => {
						if (typeof window.__oeSetPanelOffset === 'function') {
							window.__oeSetPanelOffset();
						}
					}, { passive: true });

					document.addEventListener('shown.bs.collapse', (event) => {
						const header = document.getElementById('header-menu');
						if (header && event.target && header.contains(event.target)) {
							window.__oeSetPanelOffset();
						}
					});

					document.addEventListener('hidden.bs.collapse', (event) => {
						const header = document.getElementById('header-menu');
						if (header && event.target && header.contains(event.target)) {
							window.__oeSetPanelOffset();
						}
					});
				}
			})();
		</script>
		<div class="forum-content-shell" id="content">
		<!-- IMPORT partials/noscript/warning.tpl -->
		<!-- IMPORT partials/noscript/message.tpl -->
