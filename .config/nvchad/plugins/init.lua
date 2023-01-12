local overrides = require "custom.plugins.overrides"

return {

  --------------------- default plugins ---------------------

  ["folke/which-key.nvim"] = {
    disable = false,
  },

  ["goolord/alpha-nvim"] = {
    disable = false,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- override default configs
  ["kyazdani42/nvim-tree.lua"] = { override_options = overrides.nvimtree },
  ["nvim-treesitter/nvim-treesitter"] = { override_options = overrides.treesitter },
  ["lukas-reineke/indent-blankline.nvim"] = { override_options = overrides.blankline },
  ["williamboman/mason.nvim"] = { override_options = overrides.mason },
  ["NvChad/ui"] = { override_options = overrides.statusline },

  -- new packer version has a bug with lazy loading
  ["wbthomason/packer.nvim"] = {
    commit = "dcd2f38",
  },

  --------------------- custom plugins ---------------------

  -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- distraction free modes
  ["folke/zen-mode.nvim"] = {
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup {
        window = {
          backdrop = 0.3,
          width = 100,
        },
      }
    end,
  },

  -- visual undo history
  ["mbbill/undotree"] = {
    cmd = "UndotreeToggle"
  },

  -- quickly move around in visible area (better easymotion)
  ["ggandor/leap.nvim"] = {
    keys = { "s", "S" },
    config = function()
      require('leap').set_default_keymaps()
    end,
  },

  -- add a 'cut' operation separate from 'delete' 
  ["gbprod/cutlass.nvim"] = {
    config = function()
      require("cutlass").setup({
        cut_key = "x",
      })
    end
  },

  -- copilot
  ["github/copilot.vim"] = {},

  -- notes
  ["vimwiki/vimwiki"] = {
    commit = "40f0229",
    ft = {'markdown', 'vimwiki'},
  },

  ["mickael-menu/zk-nvim"] = {
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

  ["iamcco/markdown-preview.nvim"] = {
    disable = true,
    ft = { "vimwiki", "markdown" },
    cmd = {
      "MarkdownPreview",
      "MarkdownPreviewStop",
      "MarkdownPreviewToggle",
    },
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown", "vimwiki" }
      vim.g.mkdp_theme = 'dark'
    end,
  },

  -- paste image to files
  ["ekickx/clipboard-image.nvim"] = {
    cmd = "PasteImg",
    config = function ()
      require'clipboard-image'.setup {
        default = {
          img_dir = "assets",
          img_name = function() return os.date('%Y-%m-%d-%H-%M-%S') end,
        },
        vimwiki = {
          img_dir = "$HOME/main/notepad/assets",
          img_dir_txt = "../assets",
          affix = "![](%s)",
          -- manually insert image name
          img_name = function ()
            vim.fn.inputsave()
            local name = vim.fn.input('Name: ')
            vim.fn.inputrestore()
            return name
          end,
        }
      }
    end
  },
}
