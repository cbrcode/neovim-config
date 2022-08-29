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

        use('Mofiqul/vscode.nvim')
        use({'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        })
        use('mhinz/vim-startify')
        use({
            'NTBBloodbath/doom-one.nvim',
            setup = function()
                -- Add color to cursor
                vim.g.doom_one_cursor_coloring = false
                -- Set :terminal colors
                vim.g.doom_one_terminal_colors = true
                -- Enable italic comments
                vim.g.doom_one_italic_comments = false
                -- Enable TS support
                vim.g.doom_one_enable_treesitter = true
                -- Color whole diagnostic text or only underline
                vim.g.doom_one_diagnostics_text_color = false
                -- Enable transparent background
                vim.g.doom_one_transparent_background = false

                -- Pumblend transparency
                vim.g.doom_one_pumblend_enable = false
                vim.g.doom_one_pumblend_transparency = 20

                -- Plugins integration
                vim.g.doom_one_plugin_neorg = true
                vim.g.doom_one_plugin_barbar = false
                vim.g.doom_one_plugin_telescope = false
                vim.g.doom_one_plugin_neogit = true
                vim.g.doom_one_plugin_nvim_tree = true
                vim.g.doom_one_plugin_dashboard = true
                vim.g.doom_one_plugin_startify = true
                vim.g.doom_one_plugin_whichkey = true
                vim.g.doom_one_plugin_indent_blankline = true
                vim.g.doom_one_plugin_vim_illuminate = true
                vim.g.doom_one_plugin_lspsaga = false
            end,
            config = function()
                vim.cmd("colorscheme doom-one")
            end,
        })
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
        use('lukas-reineke/indent-blankline.nvim')

        -- LSP
        use('neovim/nvim-lspconfig')
        
        use('hrsh7th/cmp-nvim-lsp')
        use('hrsh7th/cmp-buffer')
        use('hrsh7th/cmp-path')
        use('hrsh7th/cmp-cmdline')
        use('hrsh7th/nvim-cmp')

        use('L3MON4D3/LuaSnip')
        use('rafamadriz/friendly-snippets')

        use({
            'lewis6991/gitsigns.nvim',
            config = function()
                require('gitsigns').setup()
            end
        })
    end
})
