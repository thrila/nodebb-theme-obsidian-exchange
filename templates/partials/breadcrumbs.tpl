<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		{{{ each breadcrumbs }}}
		<li class="breadcrumb-item {{{ if @last }}}active{{{ end }}}" {{{ if @last }}}aria-current="page"{{{ end }}}>
			{{{ if !@last }}}
			<a href="{./url}">{./text}</a>
			{{{ else }}}
			{./text}
			{{{ end }}}
		</li>
		{{{ end }}}
	</ol>
</nav>