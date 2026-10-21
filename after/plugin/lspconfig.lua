

local protocol = require('vim.lsp.protocol')

-- ===============================
-- 🧩 Auto-format on save
-- ===============================
local augroup_format = vim.api.nvim_create_augroup("LspFormat", { clear = true })

local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buf = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buf = bufnr,
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
  local opts = { noremap = true, silent = true, buf = bufnr }
  local map = vim.keymap.set

  -- Basic LSP keymaps
  map("n", "gD", vim.lsp.buf.declaration, opts)
  map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "gi", vim.lsp.buf.implementation, opts)
  map("n", "K", vim.lsp.buf.hover, opts)

  -- Enable formatting on save only if supported
  if client:supports_method("textDocument/formatting") then
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
  pyright = {},
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
  vim.lsp.config(name, config)
end
vim.lsp.enable(vim.tbl_keys(servers))

-- ===============================
-- 🚨 Diagnostics customization
-- ===============================
vim.diagnostic.config({
  virtual_text = { prefix = "●" },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = { source = "always" },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})

