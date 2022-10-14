local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not isntalled")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use({
		"svrana/neosolarized.nvim",
		requires = { "tjdevries/colorbuddy.nvim" },
	})
	use("kyazdani42/nvim-web-devicons")
	use("glepnir/lspsaga.nvim")
	use("L3MON4D3/LuaSnip") -- Snippet
	use("hoob3rt/lualine.nvim") -- The cool part i.e the status line.
	use("onsails/lspkind.nvim") -- vscode-like pictograms
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
	use("hrsh7th/nvim-cmp") -- Completion
	use("neovim/nvim-lspconfig") -- LSP
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via lua
	use("MunifTanjim/prettier.nvim") -- Prettier plugin for Neovim's built-in LSP client
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	})
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("nvim-lua/plenary.nvim") -- Common utilities
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	--  use 'akinsho/nvim-bufferline.lua'
	use({ "akinsho/bufferline.nvim", branch = "dev" })
	use("norcalli/nvim-colorizer.lua")
	use("lewis6991/gitsigns.nvim")
	use("dinhhuy258/git.nvim")
	use("wakatime/vim-wakatime")
	use("folke/lua-dev.nvim")
	use({
		"aurum77/live-server.nvim",
		run = function()
			require("live_server.util").install()
		end,
		cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
	})
end)
