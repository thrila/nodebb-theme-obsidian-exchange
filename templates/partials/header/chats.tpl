<a class="nav-link" data-bs-toggle="dropdown" href="{relative_path}/user/{user.userslug}/chats" data-ajaxify="false" id="chat_dropdown" component="chat/dropdown" role="button" aria-haspopup="true" aria-expanded="false">
	<span component="chat/icon" class="unread-count" data-content="{unreadCount.chat}">
		<svg class="oe-topbar-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
			<path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
		</svg>
	</span>
	<span class="d-inline d-sm-none">[[global:header.chats]]</span>
</a>
<ul class="dropdown-menu dropdown-menu-end p-1" aria-labelledby="chat_dropdown" role="menu">
	<li>
		<ul component="chat/list" class="list-unstyled chat-list chats-list ghost-scrollbar pe-1">
			<div>
				<div class="d-flex gap-1 justify-content-between">
					<div class="dropdown-item p-2 d-flex gap-2 placeholder-wave">
						<div class="main-avatar">
							<div class="placeholder" style="width: 32px; height: 32px;"></div>
						</div>
						<div class="d-flex flex-grow-1 flex-column w-100">
							<div class="text-xs"><div class="placeholder col-3"></div></div>
							<div class="text-sm"><div class="placeholder col-11"></div></div>
							<div class="text-xs"><div class="placeholder col-4"></div></div>
						</div>
					</div>
					<div>
						<button class="mark-read btn btn-ghost btn-sm d-flex align-items-center justify-content-center flex-grow-0 flex-shrink-0 p-1" style="width: 1.5rem; height: 1.5rem;">
							<span class="oe-unread-dot" aria-hidden="true"></span>
						</button>
					</div>
				</div>
			</div>
		</ul>
	</li>
	<li class="dropdown-divider"></li>
	<li>
		<div class="d-flex justify-content-center gap-1 flex-wrap">
			<a class="btn btn-light btn-sm mark-all-read flex-fill text-nowrap" href="#" component="chats/mark-all-read">
				<svg class="oe-topbar-icon me-1" viewBox="0 0 24 24" fill="none" aria-hidden="true">
					<path d="m7 12 3 3 7-7M3 12l3 3M14 6l7 7" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
				</svg>
				[[modules:chat.mark-all-read]]
			</a>
			<a class="btn btn-primary btn-sm flex-fill text-nowrap" href="{relative_path}/user/{user.userslug}/chats">
				<svg class="oe-topbar-icon me-1" viewBox="0 0 24 24" fill="none" aria-hidden="true">
					<path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
				</svg>
				[[modules:chat.see-all]]
			</a>
		</div>
	</li>
</ul>
