<form component="search/form" id="search-form" class="d-flex justify-content-end align-items-center" role="search" method="GET">
	<div component="search/fields" class="hidden" id="search-fields">
		<div class="input-group flex-nowrap">
			<input autocomplete="off" type="text" class="form-control" placeholder="[[global:search]]" name="query" value="">

			<a href="{config.relative_path}/search" class="btn btn-outline-secondary" aria-label="[[search:type-to-search]]">
				<svg class="oe-topbar-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
					<circle cx="12" cy="12" r="3.5" stroke="currentColor" stroke-width="1.75"></circle>
					<path d="M19.4 15a1.7 1.7 0 0 0 .3 1.8l.1.1a2 2 0 1 1-2.8 2.8l-.1-.1a1.7 1.7 0 0 0-1.8-.3 1.7 1.7 0 0 0-1 1.5V21a2 2 0 1 1-4 0v-.2a1.7 1.7 0 0 0-1-1.5 1.7 1.7 0 0 0-1.8.3l-.1.1a2 2 0 1 1-2.8-2.8l.1-.1a1.7 1.7 0 0 0 .3-1.8 1.7 1.7 0 0 0-1.5-1H3a2 2 0 1 1 0-4h.2a1.7 1.7 0 0 0 1.5-1 1.7 1.7 0 0 0-.3-1.8l-.1-.1a2 2 0 1 1 2.8-2.8l.1.1a1.7 1.7 0 0 0 1.8.3h0a1.7 1.7 0 0 0 1-1.5V3a2 2 0 1 1 4 0v.2a1.7 1.7 0 0 0 1 1.5h0a1.7 1.7 0 0 0 1.8-.3l.1-.1a2 2 0 1 1 2.8 2.8l-.1.1a1.7 1.7 0 0 0-.3 1.8v0a1.7 1.7 0 0 0 1.5 1H21a2 2 0 1 1 0 4h-.2a1.7 1.7 0 0 0-1.5 1Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
				</svg>
			</a>
		</div>

		<div id="quick-search-container" class="quick-search-container dropdown-menu d-block mt-2 hidden">
			<div class="form-check filter-category mb-2 ms-4">
				<input class="form-check-input" type="checkbox" checked>
				<label class="form-check-label name"></label>
			</div>

			<div class="text-center loading-indicator">
				<svg class="oe-icon oe-spin" viewBox="0 0 24 24" fill="none" aria-hidden="true">
					<path d="M12 2v4" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
					<path d="m16.2 7.8 2.9-2.9" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
					<path d="M18 12h4" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
					<path d="m16.2 16.2 2.9 2.9" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
					<path d="M12 18v4" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
					<path d="m4.9 19.1 2.9-2.9" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
					<path d="M2 12h4" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
					<path d="m4.9 4.9 2.9 2.9" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
				</svg>
			</div>
			<div class="quick-search-results-container"></div>
		</div>
		<button type="submit" class="btn btn-outline-secondary hide">[[global:search]]</button>
	</div>

	<div class="nav-item" title="[[global:search]]"><a component="search/button" id="search-button" href="#" class="nav-link" aria-label="[[global:search]]"><svg class="oe-topbar-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true"><circle cx="11" cy="11" r="7" stroke="currentColor" stroke-width="1.75"></circle><path d="m20 20-3.5-3.5" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path></svg></a></div>
</form>
