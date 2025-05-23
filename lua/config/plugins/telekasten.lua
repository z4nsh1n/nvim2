return {
  {
    'renerocksai/telekasten.nvim',
    requires = { 'nvim-telescope/telescope.nvim' },
    -- lazy = true,

    config = function()
      require('telekasten').setup({
        home = vim.fn.expand("~/storagebox/zettel/")
      })
    end
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
  },
  {
    'magnusriga/markdown-tools.nvim',
    -- Optional dependencies for picker:
    -- dependencies = { 'folke/snacks.nvim' },
    -- dependencies = { 'ibhagwan/fzf-lua' },
    -- dependencies = { 'nvim-telescope/telescope.nvim' },
    opts = {
      -- Your custom configuration here
      -- Example: Use fzf-lua for template picking
      -- picker = 'fzf',
    },
  }
}
