set relativenumber
set guicursor=
set nohlsearch
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set updatetime=50
set shortmess
set signcolumn=yes
set cmdheight=2
set hidden
set visualbell
set noshowmode
set completeopt=menu,menuone,noselect

if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" WSL Clipboard
set clipboard+=unnamedplus
let g:clipboard = {
          \   'name': 'win32yank-wsl',
          \   'copy': {
          \      '+': 'win32yank.exe -i --crlf',
          \      '*': 'win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': 'win32yank.exe -o --lf',
          \      '*': 'win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 0,
          \ }

call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'ray-x/go.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'ryanoasis/vim-devicons'
Plug 'mbbill/undotree'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/popup.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/dashboard-nvim'
Plug 'luochen1990/rainbow'
Plug 'vitalk/vim-shebang'
Plug 'itchyny/lightline.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'preservim/nerdtree'
Plug 'windwp/nvim-autopairs'
Plug 'folke/trouble.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

let g:rainbow_active = 1

let g:lightline = {'colorscheme': 'tokyonight'}
colorscheme tokyonight

let mapleader = " "
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for: ")})<CR>
nnoremap tn :tabnew<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap to :tabo<CR>
nnoremap vs :vs<CR>
nnoremap sp :sp<CR>
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>bf :Telescope buffers<CR>
nnoremap <leader>ca :%bd<bar>q<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <leader>sh :mksession<CR>
nnoremap <leader>tr :TroubleToggle<CR>

lua << END
require('nvim-autopairs').setup{}

require('luasnip.loaders.from_vscode').lazy_load()

require('lspconfig').pyright.setup{}
require('lspconfig').gopls.setup{}

vim.diagnostic.config({
    virtual_text = false
})

require("nvim-treesitter.configs").setup {
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {}, -- list of language that will be disabled
    },
}

local db = require('dashboard')
local home = os.getenv('HOME')
db.custom_center = {
  {icon = '  ',
  desc = 'Recently latest session                  ',
  shortcut = 'SPC s l',
  action ='SessionLoad'},
  {icon = '  ',
  desc = 'Recently opened files                   ',
  action =  'DashboardFindHistory',
  shortcut = 'SPC f h'},
  {icon = '  ',
  desc = 'Find  File                              ',
  action = 'Telescope find_files find_command=rg,--hidden,--files',
  shortcut = 'SPC f f'},
  {icon = '  ',
  desc ='File Browser                            ',
  action =  'Telescope file_browser',
  shortcut = 'SPC f b'},
  {icon = '  ',
  desc = 'Find  word                              ',
  action = 'Telescope live_grep',
  shortcut = 'SPC f w'},
}

require("trouble").setup {}

require("go").setup()
END

lua << EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['gopls'].setup {
    capabilities = capabilities
  }
EOF

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup christian
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif
