--vim.lsp.set_log_level("debug")

-- local status, nvim_lsp = pcall(require, "lspconfig")
local nvim_lsp = require("lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

-- ===============================
-- 🧩 Auto-format on save
-- ===============================
local augroup_format = vim.api.nvim_create_augroup("LspFormat", { clear = true })

local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ async = false })
    end,
  })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- ===============================
-- 🔧 on_attach function
-- ===============================
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local map = vim.keymap.set

  -- Basic LSP keymaps
  map("n", "gD", vim.lsp.buf.declaration, opts)
  map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "gi", vim.lsp.buf.implementation, opts)
  map("n", "K", vim.lsp.buf.hover, opts)

  -- Enable formatting on save only if supported
  if client.supports_method("textDocument/formatting") then
    enable_format_on_save(client, bufnr)
  end
end

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- ===============================
-- 🧠 LSP Server configurations
-- ===============================
local servers = {
  flow = {},
  ts_ls = { -- pengganti tsserver
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" },
  },
  sourcekit = {},
  tailwindcss = {},
  cssls = {},
  astro = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
      },
    },
  },
}

for name, config in pairs(servers) do
  config.on_attach = on_attach
  config.capabilities = capabilities
  lspconfig[name].setup(config)
end

-- nvim_lsp.flow.setup {
--   on_attach = on_attach,
--   capabilities = capabilities
-- }

-- -- nvim_lsp.tsserver.setup {
-- nvim_lsp.ts_ls.setup {
--   on_attach = on_attach,
--   filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
--   cmd = { "typescript-language-server", "--stdio" },
--   capabilities = capabilities
-- }

-- nvim_lsp.sourcekit.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

-- nvim_lsp.lua_ls.setup {
--   capabilities = capabilities,
--   on_attach = function(client, bufnr)
--     on_attach(client, bufnr)
--     enable_format_on_save(client, bufnr)
--   end,
--   settings = {
--     Lua = {
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = { 'vim' },
--       },

--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--         checkThirdParty = false
--       },
--     },
--   },
-- }

-- nvim_lsp.tailwindcss.setup {
--   on_attach = on_attach,
--   capabilities = capabilities
-- }

-- nvim_lsp.cssls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities
-- }

-- nvim_lsp.astro.setup {
--   on_attach = on_attach,
--   capabilities = capabilities
-- }

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--   underline = true,
--   update_in_insert = false,
--   virtual_text = { spacing = 4, prefix = "●" },
--   severity_sort = true,
-- }
-- )

-- -- Diagnostic symbols in the sign column (gutter)
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- end

-- vim.diagnostic.config({
--   virtual_text = {
--     prefix = '●'
--   },
--   update_in_insert = true,
--   float = {
--     source = "always", -- Or "if_many"
--   },
-- })


-- ===============================
-- 🚨 Diagnostics customization
-- ===============================
vim.diagnostic.config({
  virtual_text = { prefix = "●" },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = { source = "always" },
})

-- Diagnostic symbols (icons) in gutter
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

