<li component="post" class="forum-post-item <!-- IF posts.deleted -->deleted<!-- ENDIF posts.deleted -->" <!-- IMPORT partials/data/topic.tpl -->>
	<a component="post/anchor" data-index="{./index}" id="{increment(./index, "1")}"></a>

	<meta itemprop="datePublished" content="{posts.timestampISO}">
	<meta itemprop="dateModified" content="{posts.editedISO}">

	<article class="forum-post">
		<div class="forum-post-grid">
			<aside class="forum-user-pane">
				<div class="user-head">
					<h3 class="user-name">
						{{{ if posts.user.uid }}}
						<a href="{config.relative_path}/user/{posts.user.userslug}" itemprop="author">{posts.user.username}</a>
						{{{ else }}}
						[[global:guest]]
						{{{ end }}}
					</h3>
					{{{ if posts.user.userslug }}}
					<span component="user/status" class="status-dot status {posts.user.status}">
						<span class="visually-hidden">[[global:{posts.user.status}]]</span>
					</span>
					{{{ end }}}
				</div>

				<div class="avatar-slot">
					<a href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}">
						{buildAvatar(./user, "96px", false, "", "user/picture")}
					</a>
				</div>

				<div class="meta-stack">
					{{{ if posts.user.banned }}}
					<div class="meta-row">
						<span>[[user:banned]]</span>
					</div>
					{{{ end }}}
					<div class="meta-row">
						<span>[[global:votes]]</span>
						<span>{posts.votes}</span>
					</div>
					<div class="meta-row">
						<span>[[global:posts]]</span>
						<span>{posts.user.postcount}</span>
					</div>
				</div>
			</aside>

			<div class="forum-content-pane">
				<header class="post-meta-bar">
					<div class="post-meta-items">
						<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
							<circle cx="12" cy="12" r="9" stroke="currentColor" stroke-width="1.75"></circle>
							<path d="M12 7v5l3 3" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
						</svg>
						<span class="timeago" title="{posts.timestampISO}"></span>
						<span component="post/editor" class="post-editor-note {{{ if !posts.editor.username }}} hidden{{{ end }}}">
							[[global:last-edited-by, {posts.editor.username}]]
							<span class="timeago" title="{isoTimeToLocaleString(posts.editedISO, config.userLang)}"></span>
						</span>
					</div>
					<span class="post-index">#{increment(./index, "1")}</span>
				</header>

				<div class="post-body">
					<!-- IF @first -->
					<h1 class="topic-title forum-topic-title">
						<span component="post/header" class="forum-topic-title" itemprop="name">
							<span component="topic/labels" class="d-inline-flex gap-2 {{{ if (!scheduled && (!pinned && (!locked && (!oldCid && !icons.length)))) }}}hidden{{{ end }}}">
								<span component="topic/scheduled" class="oe-topic-state <!-- IF !scheduled -->hidden<!-- ENDIF !scheduled -->" title="[[topic:scheduled]]">
									<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
										<circle cx="12" cy="12" r="9" stroke="currentColor" stroke-width="1.75"></circle>
										<path d="M12 7v5l3 3" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
									</svg>
								</span>
								<span component="topic/pinned" class="oe-topic-state <!-- IF (scheduled || !pinned) -->hidden<!-- ENDIF (scheduled || !pinned) -->" title="{{{ if !pinExpiry }}}[[topic:pinned]]{{{ else }}}[[topic:pinned-with-expiry, {pinExpiryISO}]]{{{ end }}}">
									<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
										<path d="M12 17v5M5 8l6-6 8 8-6 6m-2 2-6 4" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
									</svg>
								</span>
								<span component="topic/locked" class="oe-topic-state <!-- IF !locked -->hidden<!-- ENDIF !locked -->" title="[[topic:locked]]">
									<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
										<rect x="5" y="11" width="14" height="10" rx="2" stroke="currentColor" stroke-width="1.75"></rect>
										<path d="M8 11V8a4 4 0 1 1 8 0v3" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
									</svg>
								</span>
								<span class="oe-topic-state <!-- IF !oldCid -->hidden<!-- ENDIF !oldCid -->" title="{{{ if privileges.isAdminOrMod }}}[[topic:moved-from, {oldCategory.name}]]{{{ else }}}[[topic:moved]]{{{ end }}}">
									<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
										<path d="M5 12h14M13 6l6 6-6 6" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
									</svg>
								</span>
								{{{each icons}}}{@value}{{{end}}}
							</span>
							<span component="topic/title">{title}</span>
						</span>
					</h1>
					<!-- ENDIF @first -->

					<div component="post/content" class="post-content" itemprop="text">{posts.content}</div>
					<!-- IF posts.user.signature -->
					<div class="post-signature">{posts.user.signature}</div>
					<!-- ENDIF posts.user.signature -->
				</div>

				<footer class="post-footer">
					<div class="post-actions">
						<div class="dropdown moderator-tools" component="post/tools">
							<button class="action-btn" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
									<circle cx="5" cy="12" r="1.75" fill="currentColor"></circle>
									<circle cx="12" cy="12" r="1.75" fill="currentColor"></circle>
									<circle cx="19" cy="12" r="1.75" fill="currentColor"></circle>
								</svg>
							</button>
							<ul class="dropdown-menu p-1" role="menu"></ul>
						</div>

						<!-- IF !reputation:disabled -->
						<a component="post/upvote" href="#" class="action-btn upvote<!-- IF posts.upvoted --> upvoted<!-- ENDIF posts.upvoted -->">
							<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
								<path d="m5 15 7-7 7 7" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
							</svg>
							<span>+1</span>
						</a>
						<span component="post/vote-count" class="action-btn votes" data-votes="{posts.votes}">{posts.votes}</span>
						<!-- IF !downvote:disabled -->
						<a component="post/downvote" href="#" class="action-btn downvote<!-- IF posts.downvoted --> downvoted<!-- ENDIF posts.downvoted -->">
							<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
								<path d="m19 9-7 7-7-7" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
							</svg>
							<span>-1</span>
						</a>
						<!-- ENDIF !downvote:disabled -->
						<!-- ENDIF !reputation:disabled -->

						<!-- IF !posts.selfPost -->
						<!-- IF posts.user.userslug -->
						<!-- IF loggedIn -->
						<!-- IF !config.disableChat -->
						<button component="post/chat" class="action-btn chat" type="button" title="[[topic:chat]]">
							<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
								<path d="M8 12h8M8 8h8M8 16h4" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
								<path d="M20 5v10a2 2 0 0 1-2 2H8l-4 4V7a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2Z" stroke="currentColor" stroke-width="1.75" stroke-linejoin="round"></path>
							</svg>
							<span>[[topic:chat]]</span>
						</button>
						<!-- ENDIF !config.disableChat -->
						<!-- ENDIF loggedIn -->
						<!-- ENDIF posts.user.userslug -->
						<!-- ENDIF !posts.selfPost -->

						<button component="post/quote" class="action-btn <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->" type="button" title="[[topic:quote]]">
							<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
								<path d="M10 9H5v5h4v5H4a1 1 0 0 1-1-1v-6a6 6 0 0 1 6-6h1v3Zm11 0h-5v5h4v5h-5a1 1 0 0 1-1-1v-6a6 6 0 0 1 6-6h1v3Z" stroke="currentColor" stroke-width="1.75" stroke-linejoin="round"></path>
							</svg>
							<span>[[topic:quote]]</span>
						</button>
						<button component="post/reply" class="action-btn action-btn-primary <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->" type="button">
							<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
								<path d="m9 17-5-5 5-5" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
								<path d="M20 18v-2a6 6 0 0 0-6-6H4" stroke="currentColor" stroke-width="1.75" stroke-linecap="round"></path>
							</svg>
							<span>[[topic:reply]]</span>
						</button>
					</div>

					<div class="post-last-activity">
						<svg class="oe-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
							<path d="M12 6v6l4 2" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"></path>
							<circle cx="12" cy="12" r="9" stroke="currentColor" stroke-width="1.75"></circle>
						</svg>
						<span class="timeago" title="{posts.timestampISO}"></span>
					</div>
				</footer>
			</div>
		</div>
	</article>

	<!-- IF !posts.index -->
	<div class="clearfix">
		<div class="post-bar-placeholder"></div>
	</div>
	<!-- ENDIF !posts.index -->
</li>
