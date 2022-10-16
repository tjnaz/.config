local options = {
  number = true,
  relativenumber = true,
  encoding = "utf-8",
  fileencoding = "utf-8",
  title = true,
  ai = true, -- Auto indent
  si = true, -- Smart indent
  hls = true,
  incsearch = true,
  showtabline = 2,
  undofile = true, -- enable persistent undovim.opt.backup = false
  showcmd = true,
  cmdheight = 2,
  laststatus = 2,
  expandtab = true,
  scrolloff = 10,
  shell = "zsh",
  backupskip = "/tmp/*,/private/tmp/*",
  inccommand = "split",
  ignorecase = true,
  smarttab = true,
  breakindent = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  wrap = false, -- It was disabled by the 'craftzdog'
  backspace = "start,eol,indent",
  -- From Chris configuration file
  completeopt = { "menuone", "noselect" },
  pumheight = 10, -- pop up menu height
  splitbelow = true,
  splitright = true,
  updatetime = 300,
  numberwidth = 3,
  signcolumn = "yes",
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  -- From highlights.lua
  cursorline = true,
  termguicolors = true,
  winblend = 0,
  wildoptions = "pum",
  pumblend = 5,
  background = "dark",
  -- Active/Inactive Window
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- From the current config
vim.scriptencoding = "utf-8"
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
-- Currently not working in iTerm2, maybe in the future

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Add asterisk in block comments
vim.opt.formatoptions:append({ "r" })

--
-- From Chris' File
vim.opt.shortmess:append("c")
--
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work
vim.cmd([[set iskeyword+=-]])
--vim.cmd([[set hi LineNr guifg=#e6e1de]])
