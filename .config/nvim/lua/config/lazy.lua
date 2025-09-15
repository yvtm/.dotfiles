-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- Setup lazy.nvim
require("lazy").setup({
  { 
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("plugins.colorscheme").setup()
    end, 
  },
--  {
--    "nvim-telescope/telescope",
--    config = function()
--      require("plugins.telescope").setup({})
--   end,
--  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

	auto_install = true,

	highlight = {
	  enable = true,
	},
	incremental_selection = {
	  enable = true,
	  keymaps = {
	    init_selection = "<Leader>ss",
	    node_incremental = "<Leader>si",
	    scope_incremental= "<Leader>sc",
	    node_decremental = "<Leader>sd",
	  },
	},
	
	textobjects = {
	  select = {
	    enable = true,

	    lookahead = true,
	    
	    keymaps = {
	       ["af"] = "@function.outer",
	       ["if"] = "@function.inner",
	       ["ac"] = "@class.outer",
	    },

	    selection_modes = {
	      ["@parameter.outer"] = "v", --charwise
	      ["@function.outer"] = "V", --linewise
	      ["@class.outer"] = "<c-v>",
	    },
	    include_surrounding_whitespace = true,
	  },
	},
      })
    end, 
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers({
	function(server_name)
	    require("lspconfig")[server_name].setup({})
	end,
      })
    end,
  },
})
