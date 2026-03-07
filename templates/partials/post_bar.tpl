<div class="post-bar-toolbar">
	<nav class="post-bar-inner">
		<div class="post-bar-actions">
			<!-- IMPORT partials/topic/mark-unread.tpl -->
			<!-- IMPORT partials/topic/watch.tpl -->
			<!-- IMPORT partials/topic/sort.tpl -->
			<!-- IMPORT partials/topic/crosspost.tpl -->
			<!-- IMPORT partials/topic/tools.tpl -->

			{{{ if (!feeds:disableRSS && rssFeedUrl) }}}
			<a class="btn btn-ghost btn-sm d-none d-lg-flex align-items-center" target="_blank" href="{rssFeedUrl}" title="[[global:rss-feed]]"><i class="fa fa-rss text-primary"></i></a>
			{{{ end }}}
		</div>
		<div class="post-bar-reply">
			<!-- IMPORT partials/topic/reply-button.tpl -->
		</div>
	</nav>
</div>