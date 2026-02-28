<li id="user_label" class="nav-item dropdown px-3" title="[[global:header.profile]]">
	<a href="#" for="user-control-list-check" data-bs-toggle="dropdown" id="user_dropdown" role="button" component="header/avatar" aria-haspopup="true" aria-expanded="false">
		{buildAvatar(user, "32px", true)}
		<span id="user-header-name" class="d-block d-sm-none">{user.username}</span>
	</a>
	<input type="checkbox" class="hidden" id="user-control-list-check" aria-hidden="true">
	<ul id="user-control-list" component="header/usercontrol" class="overscroll-behavior-contain user-dropdown dropdown-menu dropdown-menu-end shadow p-1 text-sm ff-base" role="menu">
		<li>
			<a class="dropdown-item rounded-1 d-flex align-items-center gap-2" component="header/profilelink" href="{relative_path}/user/{user.userslug}" role="menuitem" aria-label="[[user:profile]]">
				<span component="user/status" class="flex-shrink-0 border border-white border-2 rounded-circle status {user.status}"><span class="visually-hidden">[[global:{user.status}]]</span></span>
				<span class="fw-semibold" component="header/username">{user.username}</span>
			</a>
		</li>
		<li role="presentation" class="dropdown-divider"></li>
		<li><h6 class="dropdown-header text-xs">[[global:status]]</h6></li>
		<li>
			<a href="#" class="dropdown-item rounded-1 user-status d-flex align-items-center gap-2 {{{ if user.online }}}selected{{{ end }}}" data-status="online" role="menuitem">
				<span component="user/status" class="flex-shrink-0 border border-white border-2 rounded-circle status online"></span>
				<span class="flex-grow-1">[[global:online]]</span>
			</a>
		</li>
		<li>
			<a href="#" class="dropdown-item rounded-1 user-status d-flex align-items-center gap-2 {{{ if user.away }}}selected{{{ end }}}" data-status="away" role="menuitem">
				<span component="user/status" class="flex-shrink-0 border border-white border-2 rounded-circle status away"></span>
				<span class="flex-grow-1">[[global:away]]</span>
			</a>
		</li>
		<li>
			<a href="#" class="dropdown-item rounded-1 user-status d-flex align-items-center gap-2 {{{ if user.dnd }}}selected{{{ end }}}" data-status="dnd" role="menuitem">
				<span component="user/status" class="flex-shrink-0 border border-white border-2 rounded-circle status dnd"></span>
				<span class="flex-grow-1">[[global:dnd]]</span>
			</a>
		</li>
		<li>
			<a href="#" class="dropdown-item rounded-1 user-status d-flex align-items-center gap-2 {{{ if user.offline }}}selected{{{ end }}}" data-status="offline" role="menuitem">
				<span component="user/status" class="flex-shrink-0 border border-white border-2 rounded-circle status offline"></span>
				<span class="flex-grow-1">[[global:invisible]]</span>
			</a>
		</li>
		<li role="presentation" class="dropdown-divider"></li>
		<li>
			<a class="dropdown-item d-flex align-items-center gap-2" href="{relative_path}/user/{user.userslug}/bookmarks" role="menuitem">
				<svg class="oe-topbar-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
					<path d="M6 3h12a1 1 0 0 1 1 1v17l-7-4-7 4V4a1 1 0 0 1 1-1Z" stroke="currentColor" stroke-width="1.75" stroke-linejoin="round"></path>
				</svg>
				<span>[[user:bookmarks]]</span>
			</a>
		</li>
		<li>
			<a class="dropdown-item d-flex align-items-center gap-2" component="header/profilelink/edit" href="{relative_path}/user/{user.userslug}/edit" role="menuitem">
				<svg class="oe-topbar-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
					<path d="M12 20h9M16.5 3.5a2.1 2.1 0 0 1 3 3L7 19l-4 1 1-4 12.5-12.5Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
				</svg>
				<span>[[user:edit-profile]]</span>
			</a>
		</li>
		<li>
			<a class="dropdown-item d-flex align-items-center gap-2" component="header/profilelink/settings" href="{relative_path}/user/{user.userslug}/settings" role="menuitem">
				<svg class="oe-topbar-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
					<circle cx="12" cy="12" r="3.5" stroke="currentColor" stroke-width="1.75"></circle>
					<path d="M19.4 15a1.7 1.7 0 0 0 .3 1.8l.1.1a2 2 0 1 1-2.8 2.8l-.1-.1a1.7 1.7 0 0 0-1.8-.3 1.7 1.7 0 0 0-1 1.5V21a2 2 0 1 1-4 0v-.2a1.7 1.7 0 0 0-1-1.5 1.7 1.7 0 0 0-1.8.3l-.1.1a2 2 0 1 1-2.8-2.8l.1-.1a1.7 1.7 0 0 0 .3-1.8 1.7 1.7 0 0 0-1.5-1H3a2 2 0 1 1 0-4h.2a1.7 1.7 0 0 0 1.5-1 1.7 1.7 0 0 0-.3-1.8l-.1-.1a2 2 0 1 1 2.8-2.8l.1.1a1.7 1.7 0 0 0 1.8.3h0a1.7 1.7 0 0 0 1-1.5V3a2 2 0 1 1 4 0v.2a1.7 1.7 0 0 0 1 1.5h0a1.7 1.7 0 0 0 1.8-.3l.1-.1a2 2 0 1 1 2.8 2.8l-.1.1a1.7 1.7 0 0 0-.3 1.8v0a1.7 1.7 0 0 0 1.5 1H21a2 2 0 1 1 0 4h-.2a1.7 1.7 0 0 0-1.5 1Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
				</svg>
				<span>[[user:settings]]</span>
			</a>
		</li>
		{{{ if showModMenu }}}
		<li role="presentation" class="dropdown-divider"></li>
		<li><h6 class="dropdown-header">[[pages:moderator-tools]]</h6></li>
		<li>
			<a class="dropdown-item d-flex align-items-center gap-2" href="{relative_path}/flags" role="menuitem">
				<svg class="oe-topbar-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
					<path d="M4 22V4h10l-1 4h7l-1.5 6H11l-1 4H4Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
				</svg>
				<span>[[pages:flagged-content]]</span>
			</a>
		</li>
		<li>
			<a class="dropdown-item d-flex align-items-center gap-2" href="{relative_path}/post-queue" role="menuitem">
				<svg class="oe-topbar-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
					<path d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
				</svg>
				<span>[[pages:post-queue]]</span>
			</a>
		</li>
		{{{ if registrationQueueEnabled }}}
		<li>
			<a class="dropdown-item d-flex align-items-center gap-2" href="{relative_path}/registration-queue" role="menuitem">
				<svg class="oe-topbar-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
					<path d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
				</svg>
				<span>[[pages:registration-queue]]</span>
			</a>
		</li>
		{{{ end }}}
		<li>
			<a class="dropdown-item d-flex align-items-center gap-2" href="{relative_path}/ip-blacklist" role="menuitem">
				<svg class="oe-topbar-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
					<circle cx="12" cy="12" r="9" stroke="currentColor" stroke-width="1.75"></circle>
					<path d="m5.5 5.5 13 13" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
				</svg>
				<span>[[pages:ip-blacklist]]</span>
			</a>
		</li>
		{{{ else }}}
		{{{ if postQueueEnabled }}}
		<li>
			<a class="dropdown-item d-flex align-items-center gap-2" href="{relative_path}/post-queue" role="menuitem">
				<svg class="oe-topbar-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
					<path d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
				</svg>
				<span>[[pages:post-queue]]</span>
			</a>
		</li>
		{{{ end }}}
		{{{ end }}}

		<li role="presentation" class="dropdown-divider"></li>
		<li component="user/logout">
			<form method="post" action="{relative_path}/logout">
				<input type="hidden" name="_csrf" value="{config.csrf_token}">
				<input type="hidden" name="noscript" value="true">
				<button type="submit" class="dropdown-item d-flex align-items-center gap-2" role="menuitem">
					<svg class="oe-topbar-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
						<path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4M16 17l5-5-5-5M21 12H9" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
					</svg>
					<span>[[global:logout]]</span>
				</button>
			</form>
		</li>
	</ul>
</li>
