return {
  "cbochs/portal.nvim",
  -- Optional dependencies
  dependencies = {
    "cbochs/grapple.nvim",
    "ThePrimeagen/harpoon"
  },
  config = function()
    vim.keymap.set("n", "<leader>o", "<cmd>Portal changelist backward<cr>")
    vim.keymap.set("n", "<leader>i", "<cmd>Portal changelist forward<cr>")
  end
}
