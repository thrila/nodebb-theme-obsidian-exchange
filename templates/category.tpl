<div data-widget-area="header">
	{{{each widgets.header}}}
	{{widgets.header.html}}
	{{{end}}}
</div>
<div class="category row category-layout">
	<div class="{{{ if widgets.sidebar.length }}}col-lg-9 col-sm-12{{{ else }}}col-lg-12{{{ end }}} forum-stack">

		<div class="forum-breadcrumb-wrap">
			<!-- IMPORT partials/breadcrumbs.tpl -->
		</div>

		<div class="subcategories">
			{{{ if hasMoreSubCategories }}}
			<div class="mb-2"><!-- IMPORT partials/category/selector-dropdown-left.tpl --></div>
			{{{ end }}}
			<div class="row" component="category/subcategory/container">
				{{{each children}}}
				<!-- IMPORT partials/category_child.tpl -->
				{{{end}}}
			</div>
			{{{ if hasMoreSubCategories}}}
			<button class="btn btn-outline-secondary mt-2" component="category/load-more-subcategories">[[category:x-more-categories, {subCategoriesLeft}]]</button>
			{{{ end }}}
		</div>

		<div class="forum-thread-header topic-list-header sticky-top">
			<h1 class="forum-thread-title">{name}</h1>
			<div class="forum-thread-actions">
				{{{ if privileges.topics:create }}}
				<a href="{config.relative_path}/compose?cid={cid}" component="category/post" id="new_topic" class="btn btn-primary btn-sm text-nowrap" data-ajaxify="false" role="button">
					<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
						<path d="M12 5v14M5 12h14" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
					</svg>
					[[category:new-topic-button]]
				</a>
				{{{ else }}}
					{{{ if !loggedIn }}}
					<a component="category/post/guest" href="{config.relative_path}/login" class="btn btn-primary btn-sm">[[category:guest-login-post]]</a>
					{{{ end }}}
				{{{ end }}}

				<a href="{config.relative_path}/{selectedFilter.url}{querystring}" class="d-inline-block">
					<div class="alert alert-warning h-100 m-0 px-2 py-1 d-flex gap-1 align-items-center hide" id="new-topics-alert">
						<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
							<path d="M21 12a9 9 0 1 1-2.64-6.36" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
							<path d="M21 3v6h-6" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
						</svg>
						[[recent:load-new-posts]]
					</div>
				</a>
				<div component="category/controls" class="d-flex gap-1">
				<!-- IMPORT partials/category/watch.tpl -->
				<!-- IMPORT partials/category/sort.tpl -->
				<!-- IMPORT partials/category/tools-dropdown-right.tpl -->
				</div>
			</div>
		</div>

		{{{ if !topics.length }}}
		<div class="alert alert-warning" id="category-no-topics">
			[[category:no-topics]]
		</div>
		{{{ end }}}

		<!-- IMPORT partials/topics_list.tpl -->

		{{{ if config.usePagination }}}
		<!-- IMPORT partials/paginator.tpl -->
		{{{ end }}}
	</div>

	{{{ if topics.length }}}
	<div data-widget-area="sidebar" class="col-md-3 col-12 category-sidebar {{{ if !widgets.sidebar.length }}}hidden{{{ end }}}">
		{{{each widgets.sidebar}}}
		{{widgets.sidebar.html}}
		{{{end}}}
	</div>
	{{{ end }}}
</div>

<div data-widget-area="footer">
	{{{each widgets.footer}}}
	{{widgets.footer.html}}
	{{{end}}}
</div>

{{{ if !config.usePagination }}}
<noscript>
	<!-- IMPORT partials/paginator.tpl -->
</noscript>
{{{ end }}}
