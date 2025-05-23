return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      explorer = {
        replace_netrw = true,
      },
      picker = {

      },

      image = {
        enabled = true,
        inline = false,
        doc = {
          enabled = true,
          inline = true,
          float = true,
          max_width = 80,
          max_height = 40,
        },
        -- your image configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    }
  }
}
