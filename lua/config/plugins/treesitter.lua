return {
  "nvim-treesitter/nvim-treesitter",
  build=":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {"c", "lua", "zig", "odin", "ocaml", "haskell",  "rust"},
      sync_install = false,
      auto_install = false,
      highlight = {enabled=true},
      indent = {enabled=true},
      additionall_vim_regex_highlighting = false,
    })
  end,
}
