local status, neogit = pcall(require, "neogit")
if (not status) then return end

neogit.setup({
  -- Menentukan default behavior saat memicu UI Neogit
  kind = "split", -- Sesuai preferensi Anda yang menyukai layout split ringkas
  commit_editor = {
    kind = "split", -- Menulis pesan commit juga dalam bentuk split window
  },
  integrations = {
    -- Jika Anda menginstal diffview.nvim, integrasi ini otomatis aktif
    diffview = true,
  },
})

vim.keymap.set(
    "n",
    "<leader>gg",
    function() neogit.open({ kind = "split" }) end,
    { desc = "Open Neogit UI", silent = true }
)

