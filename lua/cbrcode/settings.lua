local g = vim.g
local o = vim.o

o.termguicolors = true

o.updatetime=200

-- scrolloff
o.scrolloff=8
o.sidescrolloff=8

-- theme settings
g.tokyonight_style = "night"



-- ui
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true
math.randomseed(os.time())
local themes = {'tokyonight', 'doom-one', 'nord', 'gotham'}
local theme = string.format('color %s', themes[math.random(1,#themes)])
vim.cmd(theme)
--vim.cmd('set noshowmode')
o.cmdheight = 2
o.laststatus=3
--
-- editing
o.expandtab = true
o.wrap = false
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 0
o.clipboard  = 'unnamedplus'
o.nowrap = true
o.smartcase = true
o.ignorecase = true
o.autoindent = true

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
o.undodir="~/.vim/undodir"
o.nobackup = true
o.noswapfile = true

-- bells
o.visualbell = true
o.noerrorbells = true

--g.clipboard = {
--	'name': 'win32yank-wsl',
--	'copy': {
--		'+': 'win32yank.exe -i --crlf',
--		'*': 'win32yank.exe -i --crlf'
--	},
--	'paste': {
--		'+': 'win32yank.exe -o --lf',
--		'*': 'win32yank.exe -o --lf'
--	},
--	'cache_enabled': 0
--}
