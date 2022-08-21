local keymap = vim.keymap

keymap.set("n", "x", '"_x')

-- Increment / Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", 'dw', 'vb"_d')


-- Select All
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New tab
keymap.set("n", "te", ":tabedit<Return>", { silent = true})
keymap.set("n", "<TAB>", ":bnext")
keymap.set("n", "<S-TAB>", ":bprevious")
-- Split Window
keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true})
keymap.set("n", "sv", ":vsplit<Return><C-w>", { silent = true})
-- Move Window
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "s<left>", "<C-w>h")
keymap.set("", "s<up>", "<C-w>k")
keymap.set("", "s<down>", "<C-w>j")
keymap.set("", "s<right>", "<C-w>l")

keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Alternate Save
keymap.set("n", "<C-s>", ":w<Return>")
keymap.set("n", "<C-Q>", ":wq!<Return>")

keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")


