return {
  {
    "stevearc/oil.nvim",
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    opt = {
      default_file_explorer = true,
    },
    config = function()
      require("oil").setup {}
    end
  }
}
