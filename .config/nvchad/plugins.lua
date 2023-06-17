local overrides = require("custom.configs.overrides")

local plugins = {

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
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

  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup {
        user_default_options = {
          names = false, -- "Name" codes like Blue or blue
          AARRGGBB = true, -- 0xAARRGGBB hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions
        },
      }
    end,
  },

  -- distraction free modes
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup {
        window = {
          width = 85,
        },
        plugins = {
          gitsigns = { enabled = true },
        },
      }
    end,
  },

  -- visual undo history
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle"
  },

  -- quickly move around in visible area (better easymotion)
  {
    "ggandor/leap.nvim",
    keys = { "s", "S" },
    config = function()
      require('leap').set_default_keymaps()
    end,
  },

  -- add a 'cut' operation separate from 'delete' 
  {
    "gbprod/cutlass.nvim",
    event = "BufEnter",
    config = function()
      require("cutlass").setup({
        cut_key = "x",
      })
    end
  },

  {
    "github/copilot.vim",
    event = "InsertEnter",
  },

  -- notes
  {
    "mickael-menu/zk-nvim",
    ft = {'markdown'},
    config = function ()
      require("zk").setup({
        picker = "telescope",
        lsp = {
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
          },
          auto_attach = {
            enabled = true,
            filetypes = { "markdown" },
          },
        },
      })
    end
  },

  -- MarkdownPreview
  -- {
  --   'toppair/peek.nvim',
  --   build = 'deno task --quiet build:fast',
  --   ft = {'markdown'},
  --   config = function()
  --     require('peek').setup({
  --       app = 'firefox',
  --       filetype = { 'markdown' },
  --       })
  --   end,
  --   init = function()
  --     vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
  --     vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
  --   end,
  -- },

  {
    "iamcco/markdown-preview.nvim",
    -- enabled = false,
    ft = { "markdown" },
    build = "cd app && npm install",
    cmd = {
      "MarkdownPreview",
      "MarkdownPreviewStop",
      "MarkdownPreviewToggle",
    },
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_theme = 'dark'
    end,
  },

  -- paste image to files
  {
    -- "ekickx/clipboard-image.nvim",
    "postfen/clipboard-image.nvim",
    cmd = "PasteImg",
    config = function ()
      require'clipboard-image'.setup {
        default = {
          img_dir = "assets",
          img_dir_txt = "../assets",
          img_name = function() return os.date('%Y%m%d%H%M%S') end,
          -- img_name = function () return vim.fn.input('Name: ') end,
        },
      }
    end
  },
}

return plugins
