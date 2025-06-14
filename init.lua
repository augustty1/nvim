-- leader
vim.g.mapleader = " "

-- lazy path and bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- lazy plugins
require("lazy").setup({

  -- ayu mirage theme
  {
    "Shatur/neovim-ayu",
    config = function()
      require("ayu").setup({ mirage = true })
      vim.cmd("colorscheme ayu")
    end,
  },

  -- telescope fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
      vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>") -- files
      vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>") -- grep text
    end,
  },

  -- treesitter highlight and indentation
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = { "lua", "rust", "cpp", "c" },
      })
    end,
  },
})

-- basics
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
