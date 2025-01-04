print("loading config...")

require("config.lazy")

vim.cmd([[
  highlight LineNrBelow guifg=#7b80A1
  highlight LineNrAbove guifg=#7b80A1
  highlight LineNr guifg=#ffffff
  ]])
-- TODO: temp fix for treesitter error
vim.hl = vim.highlight
-- default opts
local set = vim.opt
set.shiftwidth = 2
set.tabstop = 2
set.softtabstop = 2
set.expandtab = true
set.number = true
set.relativenumber = true
set.clipboard = "unnamedplus"

-- search mappings
-- vim.keymap.set("n", "<leader>/", "VHoL<esc>/\\%V")
-- vim.keymap.set("n", "/", "H/")

vim.keymap.set("n", "<leader>/", ":Pounce<cr>")
-- vim.keymap.set("n", "<leader>/", "/")


vim.keymap.set("n", "<leader>h", ":noh<cr>")
vim.keymap.set("n", "-", "<cmd>Oil<cr>")
vim.keymap.set("n", "<space>bx", "<cmd>bdelete<cr>")
vim.keymap.set("n", "<space><space>x", "<cmd>source %<cr>")
vim.keymap.set("n", "<space>x", ":.lua<cr>")
vim.keymap.set("n", "<C-s>", ":w!<cr>")
vim.keymap.set("n", "gs", function() require("telescope.builtin").lsp_document_symbols() end)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
vim.keymap.set('n', 'grr', vim.lsp.buf.references)
vim.keymap.set('n', "<M-j>", "<cmd>cnext<cr>")
vim.keymap.set('n', "<M-k>", "<cmd>cprev<cr>")
vim.keymap.set('n', "<space>dq", vim.diagnostic.setqflist)
vim.keymap.set('n', "<space>fb", "<cmd>Telescope buffers<cr>")

-- insert mappings
vim.keymap.set('i', '<C-s>', "<esc>:w<cr>")
vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help)
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "<M-h>", "<Left>")
vim.keymap.set("i", "<M-l>", "<Right>")
vim.keymap.set("i", "<M-b>", "<S-Left>")
vim.keymap.set("i", "<M-f>", "<S-Right>")

vim.keymap.set("v", "<space>x", ":lua<cr>")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = "Highlight when yanking test",
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Terminal
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

local job_id = 0
vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.cmd.normal("i")
  vim.api.nvim_win_set_height(0, 15)
  job_id = vim.bo.channel
end)

vim.keymap.set("n", "<space>ls", function()
  vim.fn.chansend(job_id, { "htop\r\n" })
end)
