--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
lvim.transparent_window = false
vim.o.guifont = "Iosevka Nerd Font Mono"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- ===== Basic Mappings =====
-- undo key
-- vim.api.nvim_set_keymap('', 'l', 'u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'j', 'n', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'J', 'N', { noremap = true, silent = true })

-- easier command
vim.api.nvim_set_keymap('', ';', ':', { noremap = true, silent = true })

-- insert below/next line
vim.api.nvim_set_keymap('', 'l', 'o', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'L', 'O', { noremap = true, silent = true })

-- insert key
vim.api.nvim_set_keymap('', 'k', 'i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'K', 'I', { noremap = true, silent = true })

-- find pair
vim.api.nvim_set_keymap('', ',.', '%', { noremap = true, silent = true })

-- ===== Cursor Movement =====
vim.api.nvim_set_keymap('', 'n', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'e', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'i', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'o', 'l', { noremap = true, silent = true })

-- to start and end
vim.api.nvim_set_keymap('', 'N', '0', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'O', '$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'h', 'e', { noremap = true, silent = true })

-- move view port without moving cursor
vim.api.nvim_set_keymap('', '<C-n>i', '5<C-y>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-e>', '5<C-e>', { noremap = true, silent = true })

--

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }
lvim.builtin.which_key.mappings['w'] = {
  name = "+Window",
  w = { "<cmd>wincmd w<cr>", "Next" },
  W = { "<cmd>wincmd W<cr>", "Prev" },
  c = { "<cmd>wincmd c<cr>", "Close" },

  v = { "<cmd>wincmd v<cr>", "Vertical Split" },
  h = { "<cmd>wincmd s<cr>", "Horizontal Split" },

  n = { "<cmd>wincmd h<cr>", "To Left" },
  e = { "<cmd>wincmd j<cr>", "To Down" },
  i = { "<cmd>wincmd l<cr>", "To Right" },
  u = { "<cmd>wincmd k<cr>", "To Up" },

  N = { "<cmd>wincmd H<cr>", "Move To Left" },
  E = { "<cmd>wincmd J<cr>", "Move To Down" },
  I = { "<cmd>wincmd L<cr>", "Move To Right" },
  U = { "<cmd>wincmd K<cr>", "Move To Up" },
  T = { "<cmd>wincmd T<cr>", "Move To New Tab" },

  r = { "<cmd>wincmd r<cr>", "Rotate Down Right" },
  R = { "<cmd>wincmd R<cr>", "Rotate Up Left" },
}

-- lvim.builtin.which_key.mappings['n'] = {
--   "<cmd>tabnew<cr>", "New Tab"
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
