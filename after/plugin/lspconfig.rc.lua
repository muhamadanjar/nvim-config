--vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

-- nvim_lsp.tailwindcss.setup {}
