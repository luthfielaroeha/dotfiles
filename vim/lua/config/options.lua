---------------------------------------------------------------
-- => General
---------------------------------------------------------------
-- Sets how many lines of history VIM has to remember
vim.opt.history = 500

-- Set to auto read when a file is changed from the outside
vim.opt.autoread = true

-- With a map leader it's possible to do extra key combinations
-- like <leader>w saves the current file
vim.g.mapleader = ','

-- VIM user interface
---------------------------------------------------------------
-- => VIM user interface
---------------------------------------------------------------
-- Set 7 lines to the cursor - when moving vertically using j/k
vim.opt.scrolloff = 7

-- Turn on the Wild menu
vim.opt.wildmenu = true

-- Ignore compiled files
vim.opt.wildignore:append('*.o', '*~', '*.pyc')
if vim.fn.has('win16') or vim.fn.has('win32') then
    vim.opt.wildignore:append('.git/*', '.hg/*', '.svn/*')
else
    vim.opt.wildignore:append({ '*/.git/*', '*/.hg/*', '*/.svn/*', '*/.DS_Store' })
end

-- Always show current position
vim.opt.ruler = true

-- Height of the command bar
vim.opt.cmdheight = 2

-- A buffer becomes hidden when it is abandoned
vim.opt.hidden = true

-- Configure backspace so it acts as it should act
vim.opt.backspace:append('eol', 'start', 'indent')
vim.opt.whichwrap:append('<')
vim.opt.whichwrap:append('>')
vim.opt.whichwrap:append('h')
vim.opt.whichwrap:append('l')

-- Ignore case when searching
vim.opt.ignorecase = true

-- When searching try to be smart about cases 
vim.opt.smartcase = true

-- Highlight search results
vim.opt.hlsearch = true

-- Makes search act like search in modern browsers
vim.opt.incsearch = true

-- Don't redraw while executing macros (good performance config)
vim.opt.lazyredraw = true

-- For regular expressions turn magic on
vim.opt.magic = true

-- Show matching brackets when text indicator is over them
vim.opt.showmatch = true

-- How many tenths of a second to blink when matching brackets
vim.opt.mat = 2

-- No annoying sound on errors
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.tm = 500

-- Show line number
vim.opt.number = true

---------------------------------------------------------------
-- => Colors and Fonts
---------------------------------------------------------------

-- Set extra options when running in GUI mode
if vim.fn.has("gui_running") == 1 then
    if vim.fn.exists('$NVIM_TUI_ENABLE_TRUE_COLOR') then
        vim.opt.termguicolors = true
        vim.env["NVIM_TUI_ENABLE_TRUE_COLOR"] = 1
    elseif vim.fn.exists('$TERM_PROGRAM') then
        vim.opt.guioptions:remove('T', 'e')
        vim.opt.t_Co = 256
        vim.opt.guitablabel = '%M %t'
    end
end

-- Set utf8 as standard encoding and en_US as the standard language
vim.opt.encoding = 'utf8'

---------------------------------------------------------------
-- => Files, backups and undo
---------------------------------------------------------------
-- Turn backup off, since most stuff is in SVN, git etc
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

---------------------------------------------------------------
-- => Text, tab and indent related
---------------------------------------------------------------
-- Use spaces instead of tabs
vim.opt.expandtab = true

-- 1 tab == 2 spaces
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Linebreak on 500 characters
vim.opt.lbr = true
vim.opt.tw = 500

-- Auto indent
vim.opt.ai = true

-- Wrap lines
vim.opt.wrap = true

