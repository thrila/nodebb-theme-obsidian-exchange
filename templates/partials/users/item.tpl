<li class="users-box registered-user oe-user-card" data-uid="{users.uid}" data-is-admin="{{{ if users.isAdministrator }}}1{{{ else }}}0{{{ end }}}">
	<a class="oe-user-card-avatar" href="{config.relative_path}/user/{users.userslug}">
		{buildAvatar(users, "56px", true)}
	</a>

	<div class="user-info oe-user-card-body">
		<div class="oe-user-card-head">
			<span component="user/status" class="oe-status-dot status {users.status}" aria-hidden="true"></span>
			<a class="oe-user-card-name text-truncate" href="{config.relative_path}/user/{users.userslug}">{users.username}</a>
			{{{ if users.primaryRoleLabel }}}
			<span class="oe-user-card-role-badge" title="{users.primaryRoleLabel}">
				{{{ if users.primaryRoleIcon }}}
				<img class="oe-user-card-role-icon" src="{users.primaryRoleIcon}" alt="" aria-hidden="true" />
				{{{ end }}}
				<span class="oe-user-card-role-text">{users.primaryRoleLabel}</span>
			</span>
			{{{ end }}}
			{{{ if users.isAdministrator }}}
			<span class="oe-user-card-admin">Admin</span>
			{{{ end }}}
		</div>

		<div class="oe-user-card-meta">
			<span class="oe-user-card-pill">
				<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
					<circle cx="12" cy="12" r="9" stroke="currentColor" stroke-width="1.75"></circle>
					<path d="M12 7v5l3 3" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
				</svg>
				<span class="timeago" title="{users.lastonlineISO}"></span>
			</span>
		</div>

		<div class="oe-user-card-stats">
			{{{ if section_joindate }}}
			<span class="oe-user-card-pill">
				<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
					<path d="M8 2v4"></path>
					<path d="M16 2v4"></path>
					<rect width="18" height="18" x="3" y="4" rx="2"></rect>
					<path d="M3 10h18"></path>
				</svg>
				<span class="timeago" title="{users.joindateISO}"></span>
			</span>
			{{{ end }}}

			{{{ if section_sort-reputation }}}
			<span class="oe-user-card-pill">
				<svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
					<path d="m12 3 2.8 5.6L21 9.4l-4.5 4.4 1 6.2L12 17.1 6.5 20l1-6.2L3 9.4l6.2-.8L12 3Z" stroke="currentColor" stroke-width="1.75" stroke-linejoin="round"></path>
				</svg>
				{formattedNumber(users.reputation)}
			</span>
			{{{ end }}}

			{{{ if section_sort-posts }}}
			<span class="oe-user-card-pill">
				<svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
					<path d="M12 20h9M16.5 3.5a2.1 2.1 0 0 1 3 3L7 19l-4 1 1-4 12.5-12.5Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
				</svg>
				{formattedNumber(users.postcount)}
			</span>
			{{{ end }}}

			{{{ if section_flagged }}}
			<span class="oe-user-card-pill">
				<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
					<path d="M4 4v16"></path>
					<path d="M4 4h11l-1 5 1 5H4"></path>
				</svg>
				<a href="{config.relative_path}/flags?targetUid={users.uid}">{users.flags}</a>
			</span>
			{{{ end }}}
		</div>
	</div>
</li>
