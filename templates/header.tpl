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

		document.documentElement.style.setProperty('--panel-offset', `${localStorage.getItem('panelOffset') || 0}px`);
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
				const setPanelOffset = () => {
					const header = document.getElementById('header-menu');
					if (!header) {
						return;
					}

					const rect = header.getBoundingClientRect();
					const offset = Math.max(0, Math.ceil(rect.bottom));
					document.documentElement.style.setProperty('--panel-offset', `${offset}px`);
				};

				window.__oeSetPanelOffset = setPanelOffset;
				setPanelOffset();
				window.requestAnimationFrame(setPanelOffset);

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
