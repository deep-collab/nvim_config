return {
  -- LSP Zero with modern preset
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      -- LSP Support
      {"neovim/nvim-lspconfig"},
      {"williamboman/mason.nvim"},
      {"williamboman/mason-lspconfig.nvim"},

      -- Autocompletion
      {"hrsh7th/nvim-cmp"},
      {"hrsh7th/cmp-nvim-lsp"},
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
      {"hrsh7th/cmp-cmdline"},
      {"saadparwaiz1/cmp_luasnip"},
      {"L3MON4D3/LuaSnip"},
    },
    config = function()
      local lsp = require("lsp-zero")

      lsp.preset("recommended")

      -- Optional: Set up on_attach, keymaps, etc.
      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
      end)

      -- Setup Mason
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
	  "ts_ls",
          -- add more here as needed
        },
        handlers = {
          lsp.default_setup,
        },
      })

      -- Setup cmp (autocomplete)
      local cmp = require("cmp")
      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
      })

      lsp.setup()
    end,
  },
}

