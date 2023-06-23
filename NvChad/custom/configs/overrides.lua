local M = {}

M.treesitter = {
  autotag = {
    enable = true,
  },
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "c_sharp",
    "json",
    "tsx",
    "markdown",
    "markdown_inline",
    "rust",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "tailwindcss",

    -- .net ore
    "csharp_ls",
    "csharpier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- rust
    "rustfmt",
    "rust-analyzer",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },
  view = {
    side = "left",
    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local _width = screen_w * 0.7
        local _height = screen_h * 0.5
        local width = math.floor(_width)
        local height = math.floor(_height)
        local center_y = ((vim.opt.lines:get() - _height) / 2) - vim.opt.cmdheight:get()
        local center_x = (screen_w - _width) / 2
        local layouts = {
          center = {
            anchor = "NW",
            relative = "editor",
            border = "single",
            row = center_y,
            col = center_x,
            width = width,
            height = height,
          },
        }
        return layouts.center
      end,
    },
    width = function()
      return math.floor(vim.opt.columns:get() * 0.7)
    end,
    -- height = function()
    --   return math.floor((vim.opt.lines:get() - vim.opt.cmdheight:get()) * 0.5)
    -- end,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.copilot = {
  -- Possible configurable fields can be found on:
  -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
  suggestion = {
    enable = false,
  },
  panel = {
    enable = false,
  },
}

return M
