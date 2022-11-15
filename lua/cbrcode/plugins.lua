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
        --use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
        use 'tamton-aquib/staline.nvim'
        use('tpope/vim-fugitive')
        --use('nvim-lualine/lualine.nvim')
        --use('sainnhe/everforest')
        use('sainnhe/gruvbox-material')
        --use('kvrohit/mellow.nvim')
        use {
          "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            requires = { 
              "nvim-lua/plenary.nvim",
              "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
              "MunifTanjim/nui.nvim",
            }
        }
        --use('NTBBloodbath/doom-one.nvim')
        use({
          "folke/noice.nvim",
          config = function()
            require("noice").setup()
          end,
        })

        use('b0o/incline.nvim')

        use('Shatur/neovim-ayu')

        ---------------------
        -- Editing Plugins --
        ---------------------
        
        use('folke/zen-mode.nvim')
        use('lewis6991/gitsigns.nvim')
        use('mbbill/undotree')
        use('sudoerwx/vim-ray-so-beautiful')
        use('onsails/lspkind.nvim')
        use('luochen1990/rainbow')
        use('itchyny/vim-highlighturl')
        use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
        })
        use {
          'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
          requires = { {'nvim-lua/plenary.nvim'} }
        }
        use('lukas-reineke/indent-blankline.nvim')
        use {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
        }

        -- LSP
        use('neovim/nvim-lspconfig') -- Configurations for Nvim LSP
        
        

        use({
            "glepnir/lspsaga.nvim",
            branch = "main",
            config = function()
                local saga = require("lspsaga")

                saga.init_lsp_saga({

                })
            end,
        })
        use('windwp/nvim-autopairs')
        use('windwp/nvim-ts-autotag')
        use('Saecki/crates.nvim')
        use 'simrat39/rust-tools.nvim'

        -- Autocomplete
        use('hrsh7th/nvim-cmp')
        use('hrsh7th/cmp-buffer')
        use('hrsh7th/cmp-path')
        use('hrsh7th/cmp-nvim-lsp')

        -- Snippets
        use('L3MON4D3/LuaSnip')
        use('saadparwaiz1/cmp_luasnip')
        use('rafamadriz/friendly-snippets')

        -- Dap
        use('mfussenegger/nvim-dap')

    end
})
