vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":noh<CR>", { desc = "Clear search highlighting" })

keymap.set({ "n", "v", "o" }, "ge", "G", { desc = "Goto last line" })

keymap.set({ "n", "v", "o" }, "gs", "^", { desc = "Goto first non-blank in line" })
keymap.set({ "n", "v", "o" }, "^", "<nop>", { desc = "Disabled" })

keymap.set({ "n", "v", "o" }, "gh", "0", { desc = "Goto line start" })
keymap.set({ "n", "v", "o" }, "0", "<nop>", { desc = "Disabled" })

keymap.set({ "n", "v", "o" }, "gl", "$", { desc = "Goto line end" })
keymap.set({ "n", "v", "o" }, "$", "<nop>", { desc = "Disabled" })

keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

keymap.set("x", "J", ":m '>+1<CR>gv-gv", { silent = true })
keymap.set("x", "K", ":m '<-2<CR>gv-gv", { silent = true })

keymap.del("n", "grr")
keymap.del("n", "gra")
keymap.del("n", "gri")
keymap.del("n", "grn")
keymap.del("n", "grt")
