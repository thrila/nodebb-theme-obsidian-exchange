<a data-bs-toggle="dropdown" href="#" role="button" class="nav-link position-relative" aria-haspopup="true" aria-expanded="false" aria-label="[[global:header.notifications]]">
	<span component="notifications/icon" class="unread-count" data-content="{unreadCount.notification}">
		<svg class="oe-topbar-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
			<path d="M18 8a6 6 0 0 0-12 0c0 7-3 9-3 9h18s-3-2-3-9" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
			<path d="M13.73 21a2 2 0 0 1-3.46 0" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
		</svg>
	</span>
</a>

<ul class="notifications-dropdown dropdown-menu dropdown-menu-end p-2" role="menu">
	<li>
		<div class="oe-dropdown-surface">
			<div class="oe-dropdown-title">[[global:header.notifications]]</div>
			<div component="notifications/list" class="list-container notification-list overscroll-behavior-contain ff-base ghost-scrollbar">
				<div class="oe-dropdown-item placeholder-wave">
					<div class="placeholder" style="width: 32px; height: 32px;"></div>
					<div class="oe-dropdown-item-body">
						<div class="text-sm">
							<span class="placeholder placeholder-sm col-4"></span>
							<span class="placeholder placeholder-sm col-6"></span>
							<span class="placeholder placeholder-sm col-7"></span>
							<span class="placeholder placeholder-sm col-2"></span>
							<span class="placeholder placeholder-sm col-5"></span>
						</div>
						<div class="text-xs">
							<div class="placeholder placeholder-xs col-6"></div>
						</div>
					</div>
					<button class="mark-read btn btn-ghost btn-sm oe-icon-button" aria-label="[[notifications:mark-all-read]]">
						<span class="oe-unread-dot" aria-hidden="true"></span>
					</button>
				</div>
			</div>
		</div>
	</li>
	<li>
		<div class="oe-dropdown-actions">
			<a role="button" href="#" class="btn btn-sm btn-light mark-all-read flex-fill text-nowrap text-truncate ff-secondary">
				<svg class="oe-topbar-icon me-1" viewBox="0 0 24 24" fill="none" aria-hidden="true">
					<path d="m7 12 3 3 7-7M3 12l3 3M14 6l7 7" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
				</svg>
				[[notifications:mark-all-read]]
			</a>
			<a class="btn btn-sm btn-primary flex-fill text-nowrap text-truncate ff-secondary" href="{relative_path}/notifications">
				<svg class="oe-topbar-icon me-1" viewBox="0 0 24 24" fill="none" aria-hidden="true">
					<path d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
				</svg>
				[[notifications:see-all]]
			</a>
		</div>
	</li>
</ul>
