local status, n = pcall(require, "catppuccin")
if (not status) then return end

n.setup({
  flavour = "auto", -- latte, frappe, macchiato, mocha
  background = {    -- :h background
    light = "latte",
    dark = "mocha",
  },

})

vim.cmd.colorscheme "catppuccin"
