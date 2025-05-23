return {
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets', 'L3MON4D3/LuaSnip' },
    -- use a release tag to download pre-built binaries
    version = '*',
    opts = {
      snippets = { preset = 'luasnip' },
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = {
        preset = 'default',
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-g>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-l>'] = { 'snippet_forward', 'fallback' },
        ['<C-h>'] = { 'snippet_backward', 'fallback' },
        ['<CR>'] = { 'accept', 'hide', 'fallback' },
      },
      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },
      signature = { enabled = true },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "markdown" },
        providers = {
          markdown = {
            name = "RenderMarkdown",
            module = "render-markdown.integ.blink",
            fallbacks = { 'lsp' },
          }
        },
        -- ...are/nvim/lazy/blink.cmp/lua/blink/cmp/config/sources.lua:104: `sources.cmdline` has been replaced with `cmdline.sources`
        -- cmdline = {},
      },
      cmdline = {
        enabled = true,
        keymap = {
          preset = 'cmdline',
          ['<C-j>'] = { 'select_next', 'fallback' },
          ['<C-k>'] = { 'select_prev', 'fallback' },
          -- ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
          -- ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
          -- ['<C-g>'] = { 'scroll_documentation_down', 'fallback' },
          -- ['<C-l>'] = { 'snippet_forward', 'fallback' },
          -- ['<C-h>'] = { 'snippet_backward', 'fallback' },
          ['<CR>'] = { 'select_accept_and_enter', 'hide', 'fallback' },
        },
        --   sources = {
        --
        --   }
      },

      completion = {
        -- list = { selection = { preselect = false, auto_insert = false } },
        list = { selection = { preselect = false, auto_insert = true } },
        menu = {
          -- auto_show = function(ctx)
          --   return ctx.mode ~= "cmdline"
          -- end,
          border = "rounded",
          draw = { columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } } },
        },
        documentation = { window = { border = "rounded" } },
      },
    },
  }
}
