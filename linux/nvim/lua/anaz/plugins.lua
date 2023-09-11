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
local status, packer = pcall(require, "packer")
if not status then
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

--- Install your plugins here ---
return packer.startup(function(use)
  --- CORE PLUGINS ---
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim") -- Common utilities
  use("nvim-lua/popup.nvim")
  use("voldikss/vim-floaterm")
  --  use("lewis6991/impatient.nvim")
  --- COLORSCHEMES ---
  use({ "catppuccin/nvim",
    as = "catppuccin" })
  --- WINDOW MANAGERS ---
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-file-browser.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("hoob3rt/lualine.nvim") -- The cool part i.e the status line.
  use("moll/vim-bbye")
  use("kyazdani42/nvim-tree.lua")
  use({
    "ahmedkhalf/project.nvim",
  })
  use("szw/vim-maximizer")

  --- CMP PLUGINS ---
  use("hrsh7th/nvim-cmp") -- Completion
  use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline") -- Commandline completion
  use("saadparwaiz1/cmp_luasnip") -- For snippet completionj
  use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
  use("hrsh7th/cmp-nvim-lua") -- For lua completion. It's cool.

  --- SNIPPETS ---
  use("L3MON4D3/LuaSnip") -- Snippet
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  --- LSP ---
  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
  }

  use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via lua
  use('folke/lsp-colors.nvim')
  --- FORMATTER/TREESITTER/---
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use('nvim-treesitter/nvim-treesitter-context')
  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
  use("lukas-reineke/indent-blankline.nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("windwp/nvim-ts-autotag")
  use("windwp/nvim-autopairs")
  use("numToStr/Comment.nvim")
  use("MunifTanjim/prettier.nvim") -- Prettier plugin for Neovim's built-in LSP client

  ---- GIT ---
  -- use("dinhhuy258/git.nvim")
  use("lewis6991/gitsigns.nvim")

  --- OTHERS/MISC ---
  --- WAKATIME ---
  --- LIVE SERVER ---
  use({
    "aurum77/live-server.nvim",
    run = function()
      require("live_server.util").install()
    end,
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
  })
  --- For API previews
  use({
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })
  if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
  end
end)
