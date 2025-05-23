return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      --      { 'LinArcX/telescope-changes.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } },
    config = function()
      require('telescope').setup {
        defaults   = {
          mappings = {
            i = {
              ["<C-j>"] = require('telescope.actions').move_selection_next,
              ["<C-k>"] = require('telescope.actions').move_selection_previous,
            },
          },
        },
        pickers    = {
          find_files = {
            theme = "ivy",
          }
        },
        extensions = {
          fzf = {},
        },
      }
      require("telescope").load_extension('fzf')
      -- require('telescope').load_extension("changes")
      require 'telescope'.load_extension('before')

      vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
      vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files)
      vim.keymap.set("n", "<space>fg", require('telescope.builtin').grep_string)
      vim.keymap.set("n", "<space>en",
        function()
          require('telescope.builtin').find_files({ cwd = vim.fn.stdpath("config") })
        end)
    end
  }
}
