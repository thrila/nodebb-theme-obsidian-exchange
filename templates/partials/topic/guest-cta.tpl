{{{ if !config.loggedIn }}}
<div class="topic-guest-cta surface-card-tight">
	<p class="text-secondary mb-2">[[topic:guest-login-reply]]</p>
	<div class="d-flex flex-wrap gap-2">
		<a href="{relative_path}/login" class="btn btn-primary">[[global:login]]</a>
		{{{ if allowRegistration }}}
		<a href="{relative_path}/register" class="btn btn-outline-secondary">[[global:register]]</a>
		{{{ end }}}
	</div>
</div>
{{{ end }}}