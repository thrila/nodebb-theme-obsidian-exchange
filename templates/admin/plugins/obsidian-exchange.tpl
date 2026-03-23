<div class="acp-page-container obsidian-exchange-acp">
	<!-- IMPORT admin/partials/settings/header.tpl -->

	<div class="d-grid gap-4">
		<section class="card border-0 rounded-4 shadow-sm overflow-hidden">
			<div class="card-body p-3 p-lg-4">
				<div class="row g-4 align-items-start">
					<div class="col-12 col-xl-8">
						<div class="d-flex flex-wrap gap-2 mb-3">
							<span class="badge text-bg-dark rounded-pill px-3 py-2">Obsidian Exchange</span>
							<span class="badge border rounded-pill px-3 py-2 text-body-secondary">Mobile-Ready ACP</span>
						</div>
						<h3 class="mb-2">Theme Controls</h3>
						<p class="text-body-secondary mb-0">
							Manage layout behavior and group badge image mappings from one place. The page is structured for small screens first, while keeping the existing save flow and settings fields untouched.
						</p>
					</div>

					<div class="col-12 col-xl-4">
						<div class="border rounded-4 p-3 h-100 bg-body-tertiary">
							<div class="text-uppercase small fw-semibold text-body-secondary mb-2">Quick Notes</div>
							<div class="small text-body-secondary d-grid gap-2">
								<div>Use line-based mappings for quick edits or paste a JSON object.</div>
								<div>Filename-only values resolve to the theme icon directory automatically.</div>
								<div>Save first, then rebuild/restart NodeBB if cached assets delay the visual update.</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<div class="row g-4 m-0 align-items-start">
			<div id="spy-container" class="col-12 col-xl-8 px-0" tabindex="0">
				<form role="form" class="obsidian-exchange-settings d-grid gap-4">
					<section class="card border-0 rounded-4 shadow-sm">
						<div class="card-body p-3 p-md-4 d-grid gap-3">
							<div>
								<h5 class="mb-1">Layout Options</h5>
								<p class="text-body-secondary small mb-0">Theme-level toggles for masonry and quick reply behavior.</p>
							</div>

							<div class="form-check form-switch border rounded-4 p-3 bg-body-tertiary mb-0">
								<input class="form-check-input" id="disableMasonry" type="checkbox" name="disableMasonry" />
								<label class="form-check-label ms-2 d-grid gap-1" for="disableMasonry">
									<span class="fw-semibold">Disable Masonry</span>
									<span class="small text-body-secondary">Switch category listings back to a simpler flow layout.</span>
								</label>
							</div>

							<div class="form-check form-switch border rounded-4 p-3 bg-body-tertiary mb-0">
								<input class="form-check-input" id="enableQuickReply" type="checkbox" name="enableQuickReply" />
								<label class="form-check-label ms-2 d-grid gap-1" for="enableQuickReply">
									<span class="fw-semibold">Enable Quick Reply</span>
									<span class="small text-body-secondary">Expose the inline reply composer on topic pages.</span>
								</label>
							</div>
						</div>
					</section>

					<section class="card border-0 rounded-4 shadow-sm">
						<div class="card-body p-3 p-md-4 d-grid gap-3">
							<div>
								<h5 class="mb-1">Group Badge Image Mappings</h5>
								<p class="text-body-secondary small mb-0">
									Map a group name to an image or GIF. Filename-only values resolve to
									<code>/plugins/nodebb-theme-obsidian-exchange/icons/&lt;file&gt;</code>.
								</p>
							</div>

							<div class="rounded-4 border bg-body-tertiary p-3 d-grid gap-2 small">
								<div class="fw-semibold text-body-secondary text-uppercase">Accepted Input</div>
								<code>administrators = admin.gif</code>
								<code>moderators = /uploads/mod-badge.png</code>
								<code>&#123;"vip":"https://cdn.example.com/badges/vip.gif"&#125;</code>
							</div>

							<div>
								<label class="form-label fw-semibold" for="groupIconMappings">Mappings</label>
								<textarea
									class="form-control font-monospace"
									id="groupIconMappings"
									name="groupIconMappings"
									rows="10"
									placeholder="administrators = admin.gif&#10;moderators = /uploads/mod-badge.png&#10;vip = https://cdn.example.com/badges/vip.gif"
								></textarea>
								<div class="form-text">
									Accepted formats: one mapping per line using <code>group = path</code> or a JSON object.
								</div>
							</div>
						</div>
					</section>
				</form>
			</div>

			<div class="col-12 col-xl-4 px-0">
				<div class="d-grid gap-4">
					<div class="card border-0 rounded-4 shadow-sm">
						<div class="card-body p-3 p-md-4 d-grid gap-3">
							<div>
								<h5 class="mb-1">Mapping Guide</h5>
								<p class="text-body-secondary small mb-0">Use lightweight square assets so badges remain sharp in compact UI surfaces.</p>
							</div>

							<div class="d-grid gap-2 small text-body-secondary">
								<div class="border rounded-4 p-3 bg-body-tertiary">Prefer transparent PNG, WebP, SVG, or subtle GIF files.</div>
								<div class="border rounded-4 p-3 bg-body-tertiary">Keep filenames simple when storing assets in the theme icon directory.</div>
								<div class="border rounded-4 p-3 bg-body-tertiary">Use absolute or upload paths when the asset is managed outside the theme folder.</div>
							</div>
						</div>
					</div>

					<!-- IMPORT admin/partials/settings/toc.tpl -->
				</div>
			</div>
		</div>
	</div>
</div>
