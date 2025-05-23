return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    vim.filetype.add({
      extension = {
        c3 = "c3",
        c3i = "c3i",
        c3t = "c3t",
      }
    })
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.c3 = {
      install_info = {
        url = "https://github.com/c3lang/tree-sitter-c3",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "main",
      }
    }
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "c3", "c", "lua", "zig", "odin", "ocaml", "haskell", "rust" },
      sync_install = false,
      auto_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      additionall_vim_regex_highlighting = false,
    })
  end,
}
