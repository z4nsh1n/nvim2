return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      require("lspconfig").lua_ls.setup { capabilities = capabilities }
      require("lspconfig").zls.setup { capabilities = capabilities }
      require('lspconfig').rust_analyzer.setup {}
      require('lspconfig').c3_lsp.setup {}
      require('lspconfig').ocamllsp.setup {}
      require('lspconfig').ols.setup {}
      require('lspconfig').v_analyzer.setup {}
      require('lspconfig').nim_langserver.setup {}
      require('lspconfig').marksman.setup { capabilities = capabilities }
      require('lspconfig').unison.setup {}
      require('lspconfig').hls.setup {}
      require('lspconfig').gopls.setup {}
      require('lspconfig').crystalline.setup {}
      require('lspconfig').clangd.setup {}

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          vim.diagnostic.config({ virtual_lines = true, virtual_text = true })
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end
          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end

            })
          end
        end
      })
      vim.keymap.set("n", "<space>lf", function() vim.lsp.buf.format() end)
    end,
  }
}
