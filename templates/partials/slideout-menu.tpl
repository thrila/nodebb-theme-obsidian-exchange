<div class="oe-slideout">
	<div class="oe-slideout-brand">
		{{{ if brand:logo }}}
		<a class="oe-slideout-logo" href="{{{ if brand:logo:url }}}{brand:logo:url}{{{ else }}}{relative_path}/{{{ end }}}">
			<img alt="{brand:logo:alt}" class="{brand:logo:display} forum-logo" src="{brand:logo}?{config.cache-buster}" />
		</a>
		{{{ end }}}
		{{{ if config.showSiteTitle }}}
		<a class="oe-slideout-title" href="{{{ if title:url }}}{title:url}{{{ else }}}{relative_path}/{{{ end }}}">{config.siteTitle}</a>
		{{{ end }}}
	</div>

	{{{ if config.loggedIn }}}
	<div class="oe-slideout-user">
		<a class="oe-slideout-avatar" href="{config.relative_path}/user/{user.userslug}">
			{buildAvatar(user, "40px", false)}
		</a>
		<div class="oe-slideout-user-meta">
			<span class="oe-slideout-username">{user.username}</span>
			<span component="user/status" class="oe-status-dot status {user.status}">
				<span class="visually-hidden">[[global:{user.status}]]</span>
			</span>
		</div>
	</div>
	{{{ end }}}

	<ul class="oe-slideout-nav list-unstyled">
		{{{each navigation}}}
		<!-- IF function.displayMenuItem, @index -->
		<li class="nav-item {navigation.class}">
			<a class="nav-link" href="{{{ if navigation.dropdown }}}#{{{ else }}}{navigation.route}{{{ end }}}" {{{ if navigation.targetBlank }}} target="_blank"{{{ end }}}>
				{{{ if navigation.iconClass }}}<i class="fa fa-fw {navigation.iconClass}"></i>{{{ end }}}
				<span class="nav-text">{navigation.text}</span>
			</a>
		</li>
		<!-- ENDIF function.displayMenuItem -->
		{{{end}}}
	</ul>

	<div class="oe-slideout-actions">
		{{{ if config.loggedIn }}}
		<a class="oe-slideout-action" href="{relative_path}/user/{user.userslug}">
			<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
				<path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
				<circle cx="12" cy="7" r="4" stroke="currentColor" stroke-width="1.75"></circle>
			</svg>
			[[user:profile]]
		</a>
		<a class="oe-slideout-action" href="{relative_path}/user/{user.userslug}/settings">
			<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
				<circle cx="12" cy="12" r="3.5" stroke="currentColor" stroke-width="1.75"></circle>
				<path d="M19.4 15a1.7 1.7 0 0 0 .3 1.8l.1.1a2 2 0 1 1-2.8 2.8l-.1-.1a1.7 1.7 0 0 0-1.8-.3 1.7 1.7 0 0 0-1 1.5V21a2 2 0 1 1-4 0v-.2a1.7 1.7 0 0 0-1-1.5 1.7 1.7 0 0 0-1.8.3l-.1.1a2 2 0 1 1-2.8-2.8l.1-.1a1.7 1.7 0 0 0 .3-1.8 1.7 1.7 0 0 0-1.5-1H3a2 2 0 1 1 0-4h.2a1.7 1.7 0 0 0 1.5-1 1.7 1.7 0 0 0-.3-1.8l-.1-.1a2 2 0 1 1 2.8-2.8l.1.1a1.7 1.7 0 0 0 1.8.3h0a1.7 1.7 0 0 0 1-1.5V3a2 2 0 1 1 4 0v.2a1.7 1.7 0 0 0 1 1.5h0a1.7 1.7 0 0 0 1.8-.3l.1-.1a2 2 0 1 1 2.8 2.8l-.1.1a1.7 1.7 0 0 0-.3 1.8v0a1.7 1.7 0 0 0 1.5 1H21a2 2 0 1 1 0 4h-.2a1.7 1.7 0 0 0-1.5 1Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
			</svg>
			[[user:settings]]
		</a>
		<a class="oe-slideout-action" href="{relative_path}/notifications">
			<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
				<path d="M18 8a6 6 0 0 0-12 0c0 7-3 9-3 9h18s-3-2-3-9" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
				<path d="M13.73 21a2 2 0 0 1-3.46 0" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
			</svg>
			[[global:header.notifications]]
		</a>
		{{{ if canChat }}}
		<a class="oe-slideout-action" href="{relative_path}/user/{user.userslug}/chats">
			<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
				<path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
			</svg>
			[[global:header.chats]]
		</a>
		{{{ end }}}
		<form method="post" action="{relative_path}/logout">
			<input type="hidden" name="_csrf" value="{config.csrf_token}">
			<button type="submit" class="oe-slideout-action">
				<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
					<path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
					<path d="M16 17l5-5-5-5" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
					<path d="M21 12H9" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
				</svg>
				[[global:logout]]
			</button>
		</form>
		{{{ else }}}
		<a class="oe-slideout-action" href="{relative_path}/login">
			<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
				<path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
				<path d="M10 17l5-5-5-5" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
				<path d="M15 12H3" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
			</svg>
			[[global:login]]
		</a>
		{{{ if allowRegistration }}}
		<a class="oe-slideout-action" href="{relative_path}/register">
			<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
				<path d="M12 20h9" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
				<path d="M16.5 3.5a2.1 2.1 0 0 1 3 3L7 19l-4 1 1-4 12.5-12.5Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
			</svg>
			[[global:register]]
		</a>
		{{{ end }}}
		{{{ end }}}
	</div>
</div>