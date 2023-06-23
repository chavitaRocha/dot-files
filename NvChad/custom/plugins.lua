local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {},
      },
    },
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "jose-elias-alvarez/typescript.nvim" },
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  -- custom plugins
  {
    "akinsho/bufferline.nvim",
    lazy = false,
    keys = {
      { "<leader>bd", ":bd<CR>", desc = "Close buffer" },
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    },
    opts = {
      options = {
      -- stylua: ignore
      close_command = function(n) require("mini.bufremove").delete(n, false) end,
      -- stylua: ignore
      right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = overrides.copilot,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        config = true,
      },
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
      opts.sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "copilot", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path", group_index = 2 },
      }
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    config = function()
      require("neoscroll").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {
        check_ts = true,
        ts_config = {
          lua = { "string" }, -- it will not add a pair on that treesitter node
          javascript = { "template_string" },
          java = false, -- don't check treesitter on java
        },
      }
    end,
  },
  {
    "andymass/vim-matchup",
    ft = { "html", "javascript", "typescript", "typescriptreact", "vue", "svelte", "lua", "tsx", "xml", "jsx" },
    config = function() end,
  },
  {
    "kamykn/spelunker.vim",
    lazy = false,
    config = function()
      vim.api.nvim_command "highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#FF5154"
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    enabled = false,
    ft = {
      "html",
      "javascript",
      "typescript",
      "typescriptreact",
      "vue",
      "svelte",
      "lua",
      "tsx",
      "xml",
      "jsx",
      "tsx",
      "cs",
      "csharp",
      "rs",
      "rust",
    },
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      local ufo = require "ufo"
      vim.keymap.set("n", "zR", ufo.openAllFolds)
      vim.keymap.set("n", "zM", ufo.closeAllFolds)
      require("ufo").setup {
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      }
    end,
  },
  {
    "tpope/vim-surround",
    lazy = false,
    config = function() end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    config = function()
      local on_attach = require("plugins.configs.lspconfig").on_attach
      local capabilities = require("plugins.configs.lspconfig").capabilities
      require("rust-tools").setup {
        server = {
          on_attach = on_attach,
          capabilities = capabilities,
        },
      }
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}

return plugins
