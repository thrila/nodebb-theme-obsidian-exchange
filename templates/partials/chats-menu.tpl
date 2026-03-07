<div class="oe-slideout">
	<div class="oe-slideout-brand">
		<span class="oe-slideout-title">[[global:header.chats]]</span>
	</div>
	<div class="oe-slideout-section surface-card-tight oe-slideout-chats">
		<span class="oe-slideout-label">[[global:recent]]</span>
		<ul component="chat/list" class="list-unstyled chat-list chats-list"></ul>
	</div>
	{{{ if config.loggedIn }}}
	<div class="oe-slideout-nav">
		<a class="nav-link" href="{relative_path}/user/{user.userslug}/chats">
			<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
				<path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
			</svg>
			[[modules:chat.see-all]]
		</a>
	</div>
	{{{ end }}}
</div>
