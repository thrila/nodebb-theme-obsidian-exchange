<div class="btn-group bottom-sheet" component="thread/sort">
	<button class="btn btn-ghost btn-sm ff-secondary d-flex gap-2 align-items-center dropdown-toggle text-truncate oe-control-button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" aria-label="[[aria:post-sort-option, {sortOptionLabel}]]">
		<i class="fa fa-fw fa-arrow-down-wide-short text-primary"></i>
		<span class="d-none d-md-inline fw-semibold text-truncate text-nowrap">{sortOptionLabel}</span>
	</button>

	<ul class="dropdown-menu p-1 text-sm" role="menu">
		<li>
			<a class="dropdown-item d-flex align-items-center gap-2" href="#" class="oldest_to_newest" data-sort="oldest_to_newest" role="menuitem">
				<span class="flex-grow-1">[[topic:oldest-to-newest]]</span>
				<span class="flex-shrink-0 oe-menu-check">
					<i class="fa fa-fw text-secondary"></i>
					<svg class="oe-icon oe-check-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
						<path d="M20 6 9 17l-5-5" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
					</svg>
				</span>
			</a>
		</li>
		<li>
			<a class="dropdown-item d-flex align-items-center gap-2" href="#" class="newest_to_oldest" data-sort="newest_to_oldest" role="menuitem">
				<span class="flex-grow-1">[[topic:newest-to-oldest]]</span>
				<span class="flex-shrink-0 oe-menu-check">
					<i class="fa fa-fw text-secondary"></i>
					<svg class="oe-icon oe-check-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
						<path d="M20 6 9 17l-5-5" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
					</svg>
				</span>
			</a>
		</li>
		<li>
			<a class="dropdown-item d-flex align-items-center gap-2" href="#" class="most_votes" data-sort="most_votes" role="menuitem">
				<span class="flex-grow-1">[[topic:most-votes]]</span>
				<span class="flex-shrink-0 oe-menu-check">
					<i class="fa fa-fw text-secondary"></i>
					<svg class="oe-icon oe-check-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
						<path d="M20 6 9 17l-5-5" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
					</svg>
				</span>
			</a>
		</li>
	</ul>
</div>