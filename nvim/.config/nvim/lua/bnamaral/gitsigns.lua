-- git blame configuration
require('gitsigns').setup {
	-- signs config
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text_pos = 'eol',
	}
}
