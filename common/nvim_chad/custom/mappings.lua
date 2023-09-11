local M = {}

M.disabled = {
  ["<leader>wa"] = "",
  ["<leader>xr"] = "",
  ["<leader>xl"] = "",
}

M.general = {
  i = {
    -- esc
    ["UU"] = { "<ESC>", "Escape insert mode" },
  },

  n = {
    ["<CR>"] = { ":noh <CR>", "Clear highlights" },
  }
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["<leader>xa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>xr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>xl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },
}

return M
