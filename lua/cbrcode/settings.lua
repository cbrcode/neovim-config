--vim.cmd('autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg')
local g = vim.g
local o = vim.o

o.termguicolors = true

o.updatetime=200

-- scrolloff
o.scrolloff=8
o.sidescrolloff=8

-- ui
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true
o.mouse='a'
math.randomseed(os.time())
--local themes = {'gruvbox-material', 'doom-one', 'everforest'}
--local themes = {'carbonfox',}
--local theme = string.format('color %s', themes[math.random(1,#themes)])
local theme = "colo ayu-dark"
vim.cmd(theme)
--vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
--vim.cmd('set noshowmode')
o.cmdheight = 2
o.laststatus = 3

g.netrw_browsex_viewer="cmd.exe /C start"

-- Ray.so
g.ray_browser = 'cmd.exe /C start'
g.ray_options = {
    colors = 'midnight',
    background = 'false'
}

-- everforest
g.everforest_background = 'soft'

-- editing
o.expandtab = true
o.clipboard = "unnamedplus"
o.completeopt = "menuone,noselect"
o.wrap = false
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 0
o.smartcase = true
o.ignorecase = true
o.autoindent = true
o.smartindent = true
o.splitbelow = true
o.splitright = true

-- keybindings
g.mapleader = ' '
g.maplocalleader = ' '

-- netrw
g.netrw_banner = 0
g.netrw_winsize = 20

-- rainbow
g.rainbow_active = 1

-- undofile
o.undofile=true
o.noswapfile = true
o.swapfile = false
o.nobackup = true
o.backup = false

-- bells
o.visualbell = true
