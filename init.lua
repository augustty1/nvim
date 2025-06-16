vim.g.mapleader = ' ' -- leader and lazy path
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git','clone','--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',lazypath,
	})
end -- clone lazy
vim.opt.rtp:prepend(lazypath)

-- lazy plugins ===============================================
require('lazy').setup({
-- utils ======================================================
	-- fuzzy finder
	-- telescope https://github.com/nvim-telescope/telescope.nvim
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {'nvim-lua/plenary.nvim'},
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = 'Telescope find files'})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = 'Telescope live grep'})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = 'Telescope buffers'})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = 'Telescope help tags'})
		end
	},
	
-- personalization ============================================
	-- colorscheme
	-- everforest https://github.com/sainnhe/everforest/blob/master/doc/everforest.txt
	{
		'sainnhe/everforest',
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_enable_italic = true
			vim.g.everforest_background = 'hard'
			vim.cmd.colorscheme('everforest')
		end
	},

	-- startup dashboard
	-- alpha-nvim https://github.com/goolord/alpha-nvim
	{
    		'goolord/alpha-nvim',
    		dependencies = { 'echasnovski/mini.icons' },
    		config = function ()
        		require'alpha'.setup(require'alpha.themes.startify'.config)
    		end
	},
})

-- basic stuff ================================================
vim.o.number = true
vim.o.relativenumber = true
