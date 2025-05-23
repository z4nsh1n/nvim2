print("loading config...")


require("config.lazy")

-- vim.cmd('set rtp ^= "/home/zanshin/.opam/engine/share/ocp-indent/vim"')
-- vim.cmd('set rtp += "/home/zanshin/code/projects/nvim-lua"')
vim.opt.rtp:append("~/code/projects/nvim-lua/")

vim.filetype.add({
  extension = {
    c3 = "c3",
    c3i = "c3",
    c3t = "c3",
  },
})
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


vim.keymap.set("n", "K", function()
  vim.lsp.buf.hover({ border = "rounded", max_height = 25, max_width = 80 })
end)
vim.keymap.set("n", "<leader>z", ":tabnew %<cr>")
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
vim.keymap.set("n", "<A-h>", [[<Esc><C-w>h]])
vim.keymap.set("n", "<A-l>", [[<Esc><C-w>l]])
vim.keymap.set("n", "<A-j>", [[<Esc><C-w>j]])
vim.keymap.set("n", "<A-k>", [[<Esc><C-w>k]])

-- insert mappings
vim.keymap.set('i', '<C-s>', "<esc>:w<cr>")
-- vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help)
vim.keymap.set("i", "<C-c>", "<Esc>")
-- vim.keymap.set("i", "<M-h>", "<Left>")
-- vim.keymap.set("i", "<M-l>", "<Right>")
-- vim.keymap.set("i", "<M-h>", [[<Esc><C-w>h]])
-- vim.keymap.set("i", "<M-l>", [[<Esc><C-w>l]])
-- vim.keymap.set("i", "<M-j>", [[<Esc><C-w>j]])
-- vim.keymap.set("i", "<M-k>", [[<Esc><C-w>k]])
vim.keymap.set("i", "<M-b>", "<S-Left>")
vim.keymap.set("i", "<M-f>", "<S-Right>")
vim.keymap.set("v", "<space>x", ":lua<cr>")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<A-h>", [[<C-\><C-n><C-w>h]])
vim.keymap.set("t", "<A-l>", [[<C-\><C-n><C-w>l]])
vim.keymap.set("t", "<A-j>", [[<C-\><C-n><C-w>j]])
vim.keymap.set("t", "<A-k>", [[<C-\><C-n><C-w>k]])

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
    vim.cmd("startinsert")
  end,
})
-- vim.cmd([[autocmd BufWinEnter,WinEnter,BufEnter * if &buftype == 'terminal' | startinsert | endif]])
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "term://*" },
  command = "startinsert"
});

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "zig" },
  callback = function()
    vim.keymap.set("n", "<F5>",
      function()
        vim.cmd([[split]])
        vim.cmd([[exec "normal \<c-w>j"]])
        vim.cmd([[terminal zig build run]])
      end)
  end
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

local function remove_from_changelist()
  local changelist = vim.fn.getchangelist()[1]
  changelist[0] = {};
end
