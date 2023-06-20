local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim" }  -- Useful lua functions used by lots of plugins

  -- use {
  -- 'svrana/neosolarized.nvim',
  -- requires = { 'tjdevries/colorbuddy.nvim' }
  -- }
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  -- use { 'kwsp/halcyon-neovim' }
  use { 'nvim-lualine/lualine.nvim' }

  -- use { "catppuccin/nvim", requires = { 'tjdevries/colorbuddy.nvim' }, as = "catppuccin" } -- colorscheme
  use { 'akinsho/nvim-bufferline.lua' }

  use { 'windwp/nvim-autopairs' } -- automatically close brackets
  use { 'windwp/nvim-ts-autotag' }
  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }
  use { 'norcalli/nvim-colorizer.lua' }

  -- cmp (completion plugins)
  use { "hrsh7th/nvim-cmp" }         -- The completion plugin
  use { "hrsh7th/cmp-buffer" }       -- buffer completions
  use { "hrsh7th/cmp-path" }         -- path completions
  use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua" }

  use { "github/copilot.vim" } -- copilot ai

  -- Language Server Protocol
  use { "neovim/nvim-lspconfig" }           -- enable LSP
  use { "williamboman/mason.nvim" }         -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim" }
  use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  use { "MunifTanjim/prettier.nvim" }
  use { 'glepnir/lspsaga.nvim' }            -- LSP UIs
  use { "RRethy/vim-illuminate" }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-file-browser.nvim' }

  use { 'lewis6991/gitsigns.nvim' }
  use { 'dinhhuy258/git.nvim' } -- For git blame & browse

  -- snippets
  use { "L3MON4D3/LuaSnip" }             --snippet engine
  use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use


  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  }) -- markdown-preview

  use { 'folke/zen-mode.nvim' }

  use { 'kyazdani42/nvim-web-devicons' } -- File icons
end)
