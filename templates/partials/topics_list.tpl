<div class="thread-panel">
	<div class="thread-panel-head">
		<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
			<path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
		</svg>
		<h2 class="thread-panel-title">[[global:topics]]</h2>
	</div>

	<div class="thread-table-head">
		<div class="thread-table-head-main">[[global:topic]]</div>
		<div class="thread-table-head-votes">[[global:votes]]</div>
		<div class="thread-table-head-posts">[[global:posts]]</div>
		<div class="thread-table-head-last">[[global:lastpost]]</div>
	</div>

	<ul component="category" class="topic-list thread-list list-unstyled" id="topics-container">
		<meta itemprop="itemListOrder" content="descending">
		{{{ each topics }}}
		<li component="category/topic" class="thread-row category-item {function.generateTopicClass}" itemprop="itemListElement" <!-- IMPORT partials/data/category.tpl -->>
			<a id="{./index}" data-index="{./index}" component="topic/anchor"></a>
			<meta itemprop="name" content="{function.stripTags, title}">

			<div class="thread-row-link">
				<div class="thread-cell-main">
					{{{ if showSelect }}}
					<span class="oe-select-control" aria-hidden="true">
						<i class="fa fa-fw fa-square-o pointer" component="topic/select"></i>
						<span class="oe-select-icon oe-select-icon-unchecked">
							<svg class="oe-icon" viewBox="0 0 24 24" fill="none">
								<rect x="4" y="4" width="16" height="16" rx="2.5" stroke="currentColor" stroke-width="1.75"></rect>
							</svg>
						</span>
						<span class="oe-select-icon oe-select-icon-checked">
							<svg class="oe-icon" viewBox="0 0 24 24" fill="none">
								<rect x="4" y="4" width="16" height="16" rx="2.5" stroke="currentColor" stroke-width="1.75"></rect>
								<path d="m8 12 3 3 5-6" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
							</svg>
						</span>
					</span>
					{{{ end }}}

					<span class="thread-icon-square" aria-hidden="true">
						<svg class="oe-icon" viewBox="0 0 24 24" fill="none">
							<path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
						</svg>
					</span>

					<div class="thread-main-copy">
						<div>
							<span component="topic/scheduled" class="oe-topic-state {{{ if !topics.scheduled }}}hidden{{{ end }}}" title="[[topic:scheduled]]">
								<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
									<circle cx="12" cy="12" r="9" stroke="currentColor" stroke-width="1.75"></circle>
									<path d="M12 7v5l3 3" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
								</svg>
							</span>
							<span component="topic/pinned" class="oe-topic-state {{{ if (topics.scheduled || !topics.pinned) }}}hidden{{{ end }}}" title="{{{ if !../pinExpiry }}}[[topic:pinned]]{{{ else }}}[[topic:pinned-with-expiry, {../pinExpiryISO}]]{{{ end }}}">
								<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
									<path d="M12 17v5M5 8l6-6 8 8-6 6m-2 2-6 4" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
								</svg>
							</span>
							<span component="topic/locked" class="oe-topic-state {{{ if !topics.locked }}}hidden{{{ end }}}" title="[[topic:locked]]">
								<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
									<rect x="5" y="11" width="14" height="10" rx="2" stroke="currentColor" stroke-width="1.75"></rect>
									<path d="M8 11V8a4 4 0 1 1 8 0v3" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
								</svg>
							</span>
							<span component="topic/moved" class="oe-topic-state {{{ if !topics.oldCid }}}hidden{{{ end }}}" title="[[topic:moved]]">
								<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
									<path d="M5 12h14M13 6l6 6-6 6" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
								</svg>
							</span>
							{{{each topics.icons}}}{@value}{{{end}}}

							{{{ if topics.noAnchor }}}
							<span class="thread-title topic-title" component="topic/header">{topics.title}</span>
							{{{ else }}}
							<a class="thread-title topic-title" component="topic/header" href="{config.relative_path}/topic/{topics.slug}" itemprop="url">{topics.title}</a>
							{{{ end }}}
						</div>

						<p class="thread-meta-line">
							{buildCategoryIcon(./category, "18px", "rounded-circle")}
							<a href="{config.relative_path}/category/{topics.category.slug}">{topics.category.name}</a>
							&bull; <span class="timeago" title="{topics.timestampISO}"></span>
						</p>

						{{{ if topics.tags.length }}}
						<span class="tag-list mb-1">
							{{{ each ./tags }}}
							<!-- IMPORT partials/topic/tag.tpl -->
							{{{ end }}}
						</span>
						{{{ end }}}
					</div>
				</div>

				<div class="thread-cell-mid-a">
					<span title="{topics.votes}">{humanReadableNumber(topics.votes)} [[global:votes]]</span>
				</div>

				<div class="thread-cell-mid-b">
					<span title="{topics.postcount}">{humanReadableNumber(topics.postcount)} [[global:posts]]</span>
				</div>

				<div class="thread-cell-right" component="topic/teaser">
					{{{ if topics.unreplied }}}
					<span>[[category:no-replies]]</span>
					{{{ else }}}
					<div class="d-flex align-items-center gap-2">
						<a href="{{{ if ./teaser.user.userslug }}}{config.relative_path}/user/{./teaser.user.userslug}{{{ else }}}#{{{ end }}}">
							{buildAvatar(./teaser.user, "24px", true)}
						</a>
						<a href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}">
							<span class="timeago" title="{topics.teaser.timestampISO}"></span>
						</a>
					</div>
					{{{ end }}}
				</div>
			</div>

			<div class="thread-row-tools">
				{{{ if topics.pinned }}}
				<span class="pin-badge">
					<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
						<path d="M12 17v5M5 8l6-6 8 8-6 6m-2 2-6 4" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
					</svg>
					[[topic:pinned]]
				</span>
				{{{ end }}}
				<span class="pin-action" aria-hidden="true">
					<svg class="oe-icon" viewBox="0 0 24 24" fill="none">
						<path d="m9 12 2 2 4-4" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
						<path d="M21 12c0 4.97-4.03 9-9 9s-9-4.03-9-9 4.03-9 9-9 9 4.03 9 9Z" stroke="currentColor" stroke-width="1.75"></path>
					</svg>
				</span>
			</div>
		</li>
		{{{ end }}}
	</ul>
</div>
