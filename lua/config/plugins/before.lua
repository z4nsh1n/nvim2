return {
  {
    "bloznelis/before.nvim",
    config = function()
      local before = require("before")
      before.setup {
        history_size = 200,
        history_wrap_enabled = false,
      }
      vim.keymap.set("n", "go", before.jump_to_last_edit, { desc = "before: jump to previous edit" })
      vim.keymap.set("n", "gi", before.jump_to_next_edit, { desc = "before: jump to next edit" })
      -- You can provide telescope opts to the picker as show_edits_in_telescope argument:
      vim.keymap.set('n', '<leader>t', function()
        before.show_edits_in_telescope(require('telescope.themes').get_dropdown())
      end, {})
    end,
  },
}
