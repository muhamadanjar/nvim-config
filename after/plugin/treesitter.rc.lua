local status, treesitter = pcall(require, "nvim-treesitter")
if (not status) then return end

local languages = {
  "tsx",
  "toml",
  "fish",
  "php",
  "json",
  "yaml",
  "swift",
  "css",
  "html",
  "lua",
  "python",
}
local filetypes = {
  "tsx",
  "toml",
  "fish",
  "php",
  "json",
  "yaml",
  "swift",
  "css",
  "html",
  "lua",
  "javascriptreact",
  "typescriptreact",
}

treesitter.setup({})
treesitter.install(languages)

vim.treesitter.language.register("tsx", { "javascriptreact", "typescriptreact" })

local treesitter_group = vim.api.nvim_create_augroup("NvimTreesitter", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = treesitter_group,
  pattern = filetypes,
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

local autotag_status, autotag = pcall(require, "nvim-ts-autotag")
if autotag_status then
  autotag.setup({})
end
