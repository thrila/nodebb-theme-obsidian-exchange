<!-- IF ./isSection -->
<div component="categories/category" class="col-12 category-item mb-3 category-section">
	<h2 class="section-title">{./name}</h2>
</div>
<!-- ELSE -->
<div component="categories/category" class="{{{ if ./class }}}{./class}{{{ else }}}col-md-6 col-xl-4 col-sm-6 col-12{{{ end }}} category-item mb-3" data-cid="{./cid}" data-numRecentReplies="{./numRecentReplies}">
	<meta itemprop="name" content="{./name}">

	<article class="forum-category-card">
		<div
			id="category-{./cid}"
			class="forum-category-banner category-header-image-{./imageClass}"
			{{{ if ./backgroundImage }}}style="background-image: url({./backgroundImage});"{{{ end }}}>
			{{{ if ./icon }}}
			<i class="fa {./icon} fa-2x"></i>
			{{{ else }}}
			<svg class="oe-icon oe-icon-lg" viewBox="0 0 24 24" fill="none" aria-hidden="true">
				<path d="M3 9.5 12 4l9 5.5V20a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V9.5Z" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
				<path d="M9 21V12h6v9" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
			</svg>
			{{{ end }}}
		</div>

		<div class="forum-category-body">
			<h3 class="forum-category-title">
				<a href="{{{ if ./link }}}{./link}{{{ else }}}{config.relative_path}/category/{./slug}{{{ end }}}" itemprop="url">
					{./name}
				</a>
			</h3>

			<div class="forum-category-description" itemprop="description">{./descriptionParsed}</div>

			{{{ if !./link }}}
			<div class="forum-category-meta">
				<span class="platform-count-pill">[[global:topics]] {humanReadableNumber(./totalTopicCount)}</span>
				<span class="platform-count-pill">[[global:posts]] {humanReadableNumber(./totalPostCount)}</span>
			</div>
			{{{ end }}}

			{{{ if ./children.length }}}
			<div class="forum-category-children">
				{{{ each ./children }}}
				<a href="{{{ if ./link }}}{./link}{{{ else }}}{config.relative_path}/category/{./slug}{{{ end }}}" class="forum-category-child">
					{buildCategoryIcon(@value, "20px", "rounded-circle")}
					<span>{./name}</span>
				</a>
				{{{ end }}}
			</div>
			{{{ end }}}

			{{{ if !./link }}}
			{{{ if ./posts.length }}}
			<div class="forum-category-preview">
				{{{ each ./posts }}}
				<div component="category/posts" class="forum-category-preview-item">
					<a class="forum-category-preview-title" href="{config.relative_path}/topic/{./topic.slug}">{./topic.title}</a>
					<div class="forum-category-preview-meta">
						<a href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}">
							{buildAvatar(./user, "22px", true)}
						</a>
						<span class="timeago" title="{./timestampISO}"></span>
						<a href="{config.relative_path}/topic/{./topic.slug}{{{ if ./index }}}/{./index}{{{ end }}}">[[global:read-more]]</a>
					</div>
				</div>
				{{{ end }}}
			</div>
			{{{ end }}}
			{{{ end }}}
		</div>
	</article>
</div>
<!-- ENDIF ../isSection -->
