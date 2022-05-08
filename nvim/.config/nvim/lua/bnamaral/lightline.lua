-- show branch on bottom left
vim.g.lightline = {
	active = {
		left = {
			{ 'mode', 'past' },
			{ 'gitbranch', 'filename', 'modified' }
		}
	},
	component_function = {
		gitbranch = 'fugitive#head'
	},
    colorscheme = 'wombat',

}
