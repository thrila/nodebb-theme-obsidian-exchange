			<div class="oe-topbar-primary me-auto">
				<button type="button" class="navbar-toggler border-0 oe-mobile-toggle" id="mobile-menu">
					<svg class="oe-topbar-icon unread-count" viewBox="0 0 24 24" fill="none" aria-hidden="true">
						<path d="M4 7h16M4 12h16M4 17h16" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
					</svg>
					<span component="unread/icon" class="notification-icon fa fa-fw oe-topbar-fa fa-book unread-count" data-content="{unreadCount.mobileUnread}" data-unread-url="{unreadCount.unreadUrl}"></span>
				</button>
				<div class="oe-brand-wrap">
					{{{ if brand:logo }}}
					<a class="navbar-brand" href="{{{ if brand:logo:url }}}{brand:logo:url}{{{ else }}}{relative_path}/{{{ end }}}">
						<img alt="{brand:logo:alt}" class="{brand:logo:display} forum-logo d-inline-block align-text-bottom" src="{brand:logo}?{config.cache-buster}" />
					</a>
					{{{ end }}}
					{{{ if config.showSiteTitle }}}
					<a class="navbar-brand text-truncate" href="{{{ if title:url }}}{title:url}{{{ else }}}{relative_path}/{{{ end }}}">
						{config.siteTitle}
					</a>
					{{{ end }}}
				</div>
			</div>

			{{{ if (config.searchEnabled && user.privileges.search:content) }}}
			<div class="navbar-search visible-xs oe-mobile-search">
				<form action="{config.relative_path}/search" method="GET">
					<button type="button" class="btn btn-link" aria-label="[[global:header.search]]">
						<svg class="oe-topbar-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
							<circle cx="11" cy="11" r="7" stroke="currentColor" stroke-width="1.75"></circle>
							<path d="m20 20-3.5-3.5" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
						</svg>
					</button>
					<input autocomplete="off" type="text" class="form-control hidden" name="term" placeholder="[[global:search]]"/>
					<button class="btn btn-primary hidden" type="submit"></button>
					<input type="text" class="hidden" name="in" value="{config.searchDefaultInQuick}" />
				</form>
				<div class="quick-search-container dropdown-menu d-block mt-2 hidden">
					<div class="quick-search-results-container"></div>
				</div>
			</div>
			{{{ end }}}

			{{{ if config.loggedIn }}}
			<button type="button" class="navbar-toggler border-0 oe-mobile-user-trigger" id="mobile-chats">
				<span component="notifications/icon" class="notification-icon fa fa-fw oe-topbar-fa fa-bell-o unread-count visually-hidden" data-content="{unreadCount.notification}"></span>
				<span component="chat/icon" class="notification-icon fa fa-fw oe-topbar-fa fa-comments unread-count visually-hidden" data-content="{unreadCount.chat}"></span>
				{buildAvatar(user, "32px", false)}
			</button>
			{{{ end }}}

			<div component="navbar/title" class="visible-xs hidden">
				<span></span>
			</div>

			<div id="nav-dropdown" class="collapse navbar-collapse d-none d-lg-block">
				<ul id="main-nav" class="navbar-nav me-auto mb-2 mb-lg-0">
					{{{each navigation}}}
					<!-- IF function.displayMenuItem, @index -->
					<li class="nav-item {navigation.class}{{{ if navigation.dropdown }}} dropdown{{{ end }}}" title="{navigation.title}">
						<a class="nav-link navigation-link {{{ if navigation.dropdown }}}dropdown-toggle{{{ end }}}"
						{{{ if navigation.dropdown }}} href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" {{{ else }}} href="{navigation.route}"{{{ end }}} {{{ if navigation.id }}}id="{navigation.id}"{{{ end }}}{{{ if navigation.targetBlank }}} target="_blank"{{{ end }}}>
							{{{ if navigation.iconClass }}}
							<i class="fa fa-fw {navigation.iconClass}" data-content="{navigation.content}"></i>
							{{{ end }}}
							{{{ if navigation.text }}}
							<span class="{navigation.textClass}">{navigation.text}</span>
							{{{ end }}}
							{{{ if navigation.dropdown}}}
							<svg class="oe-topbar-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
								<path d="m7 10 5 5 5-5" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
							</svg>
							{{{ end }}}
						</a>
						{{{ if navigation.dropdown }}}
						<ul class="dropdown-menu p-1" role="menu">
							{navigation.dropdownContent}
						</ul>
						{{{ end }}}
					</li>
					<!-- ENDIF function.displayMenuItem -->
					{{{end}}}
				</ul>
				<ul class="navbar-nav mb-2 mb-lg-0 hidden-xs">
					<li class="nav-item">
						<a href="#" id="reconnect" class="nav-link hide" title="[[global:reconnecting-message, {config.siteTitle}]]">
							<svg class="oe-topbar-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
								<path d="m5 12 4 4 10-10" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
							</svg>
						</a>
					</li>
				</ul>
				{{{ if (config.searchEnabled && user.privileges.search:content) }}}
				<div class="navbar-nav mb-2 mb-lg-0 position-relative">
					<!-- IMPORT partials/header/search.tpl -->
				</div>
				{{{ end }}}

				{{{ if !maintenanceHeader }}}
				{{{ if config.loggedIn }}}
				<ul id="logged-in-menu" class="navbar-nav me-0 mb-2 mb-lg-0 align-items-center">
					<li class="nav-item notifications dropdown d-none d-sm-block" component="notifications" title="[[global:header.notifications]]">
						<!-- IMPORT partials/header/notifications.tpl -->
					</li>

					{{{ if canChat }}}
					<li class="nav-item chats dropdown" title="[[global:header.chats]]">
						<!-- IMPORT partials/header/chats.tpl -->
					</li>
					{{{ end }}}

					<!-- IMPORT partials/header/user-menu.tpl -->
				</ul>
				{{{ else }}}
				<ul id="logged-out-menu" class="navbar-nav me-0 mb-2 mb-lg-0 align-items-center">
					{{{ if allowRegistration }}}
					<li class="nav-item">
						<a class="nav-link" href="{relative_path}/register">
							<svg class="oe-topbar-icon d-inline-block d-sm-none" viewBox="0 0 24 24" fill="none" aria-hidden="true">
								<path d="M12 20h9M16.5 3.5a2.1 2.1 0 0 1 3 3L7 19l-4 1 1-4 12.5-12.5Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
							</svg>
							<span>[[global:register]]</span>
						</a>
					</li>
					{{{ end }}}
					<li class="nav-item">
						<a class="nav-link" href="{relative_path}/login">
							<svg class="oe-topbar-icon d-inline-block d-sm-none" viewBox="0 0 24 24" fill="none" aria-hidden="true">
								<path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4M10 17l5-5-5-5M15 12H3" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
							</svg>
							<span>[[global:login]]</span>
						</a>
					</li>
				</ul>
				{{{ end }}}
				{{{ else }}}
				<ul class="navbar-nav me-0 mb-2 mb-lg-0">
					<li class="nav-item">
						<a href="{relative_path}/login">
							<svg class="oe-topbar-icon d-block d-sm-none" viewBox="0 0 24 24" fill="none" aria-hidden="true">
								<path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4M10 17l5-5-5-5M15 12H3" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
							</svg>
							<span>[[global:login]]</span>
						</a>
					</li>
				</ul>
				{{{ end }}}
			</div>
