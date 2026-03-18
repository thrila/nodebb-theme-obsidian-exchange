<div class="acp-page-container">
	<!-- IMPORT admin/partials/settings/header.tpl -->

	<div class="row m-0">
		<div id="spy-container" class="col-12 col-md-8 px-0 mb-4" tabindex="0">
			<form role="form" class="obsidian-exchange-settings">
				<div class="card border-0 rounded-4 bg-body-tertiary mb-3">
					<div class="card-body d-grid gap-3">
						<div>
							<h5 class="mb-1">Layout options</h5>
							<p class="text-muted small mb-0">Theme-level toggles for masonry and quick reply.</p>
						</div>

						<div class="form-check">
							<label class="form-check-label" for="disableMasonry">Disable Masonry</label>
							<input class="form-check-input" id="disableMasonry" type="checkbox" name="disableMasonry" />
						</div>

						<div class="form-check">
							<label class="form-check-label" for="enableQuickReply">Enable quick reply</label>
							<input class="form-check-input" id="enableQuickReply" type="checkbox" name="enableQuickReply" />
						</div>
					</div>
				</div>

				<div class="card border-0 rounded-4 bg-body-tertiary">
					<div class="card-body d-grid gap-3">
						<div>
							<h5 class="mb-1">Group badge image mappings</h5>
							<p class="text-muted small mb-0">
								Map a group name to an image or GIF. Filename-only values resolve to
								<code>/plugins/nodebb-theme-obsidian-exchange/icons/&lt;file&gt;</code>.
							</p>
						</div>

						<div>
							<label class="form-label" for="groupIconMappings">Mappings</label>
							<textarea
								class="form-control font-monospace"
								id="groupIconMappings"
								name="groupIconMappings"
								rows="8"
								placeholder="administrators = admin.gif&#10;moderators = /uploads/mod-badge.png&#10;vip = https://cdn.example.com/badges/vip.gif"
							></textarea>
							<div class="form-text">
								Accepted formats: one mapping per line using <code>group = path</code> or a JSON object.
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>

		<!-- IMPORT admin/partials/settings/toc.tpl -->
	</div>
</div>
