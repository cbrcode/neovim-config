-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

return require('packer').startup({
    function(use)
        ---------------------
        -- Package Manager --
        ---------------------

        use('wbthomason/packer.nvim')

        ----------------------
        -- Required plugins --
        ----------------------

        use('nvim-lua/plenary.nvim')

        ----------------------------------------
        --        Theme, Icons, Statusbar     --
        ----------------------------------------

        -- use('Mofiqul/vscode.nvim')
        use({'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        })
        use('mhinz/vim-startify')
        use('tpope/vim-fugitive')
        use {
          "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            requires = { 
              "nvim-lua/plenary.nvim",
              "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
              "MunifTanjim/nui.nvim",
            }
        }
        use('whatyouhide/vim-gotham')
        use('folke/tokyonight.nvim')
        use {
            'sunjon/shade.nvim',
            config = function()
                require("shade").setup()
            end
        }
        use {
          "folke/trouble.nvim",
          requires = "kyazdani42/nvim-web-devicons",
          config = function()
            require("trouble").setup {}
          end
        }
        use('arcticicestudio/nord-vim')
        use('NTBBloodbath/doom-one.nvim')
        --use({
        --    'NTBBloodbath/doom-one.nvim',
        --    setup = function()
        --        -- Add color to cursor
        --        vim.g.doom_one_cursor_coloring = false
        --        -- Set :terminal colors
        --        vim.g.doom_one_terminal_colors = true
        --        -- Enable italic comments
        --        vim.g.doom_one_italic_comments = false
        --        -- Enable TS support
        --        vim.g.doom_one_enable_treesitter = true
        --        -- Color whole diagnostic text or only underline
        --        vim.g.doom_one_diagnostics_text_color = false
        --        -- Enable transparent background
        --        vim.g.doom_one_transparent_background = false

        --        -- Pumblend transparency
        --        vim.g.doom_one_pumblend_enable = false
        --        vim.g.doom_one_pumblend_transparency = 20

        --        -- Plugins integration
        --        vim.g.doom_one_plugin_neorg = false
        --        vim.g.doom_one_plugin_barbar = false
        --        vim.g.doom_one_plugin_telescope = true
        --        vim.g.doom_one_plugin_neogit = true
        --        vim.g.doom_one_plugin_nvim_tree = true
        --        vim.g.doom_one_plugin_dashboard = false
        --        vim.g.doom_one_plugin_startify = true
        --        vim.g.doom_one_plugin_whichkey = false
        --        vim.g.doom_one_plugin_indent_blankline = false
        --        vim.g.doom_one_plugin_vim_illuminate = true
        --        vim.g.doom_one_plugin_lspsaga = false
        --    end,
        --    config = function()
        --        vim.cmd("colorscheme doom-one")
        --    end,
        --})
        ---------------------
        -- Editing Plugins --
        ---------------------
        
        use('mbbill/undotree')
        use('luochen1990/rainbow')
        use('windwp/nvim-autopairs')
        use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
        })
        --use('lukas-reineke/indent-blankline.nvim')

        -- LSP
        use {'neoclide/coc.nvim', branch = 'release'}
    end
})
