local status, _ = pcall(require, "lspconfig")
if (not status) then return end

require "anaz.lsp.configs"
require("anaz.lsp.handlers").setup()
require("anaz.lsp.lsp-colors")
require "anaz.lsp.null-ls"
