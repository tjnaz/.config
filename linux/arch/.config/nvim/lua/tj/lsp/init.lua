local status, _ = pcall(require, "lspconfig")
if (not status) then return end

require("tj.lsp.configs")
require("tj.lsp.handlers").setup()
require("tj.lsp.lsp-colors")
require("tj.lsp.null-ls")
