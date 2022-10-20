local status, mason = pcall(require, "mason")
if not status then
  return
end

local status2, lsp_installer = pcall(require, "mason-lspconfig")
if not status2 then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

local lspconfig = require("lspconfig")
local servers = { "sumneko_lua", "denols", "emmet_ls", "cssls", "cssmodules_ls", "html", "jsonls", "clangd" }

lsp_installer.setup({
  ensure_installed = servers,
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("anaz.lsp.handlers").on_attach,
    capabilities = require("anaz.lsp.handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end
  lspconfig[server].setup(opts)
end
