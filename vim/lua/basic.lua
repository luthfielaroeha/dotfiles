
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
vim.opt.whichwrap:append('<', '>', 'h', 'l')

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

------------------------------
-- => Visual mode related
------------------------------
-- Visual mode pressing * or # searches for the current selection
vim.api.nvim_set_keymap('v', '*', ':<C-u>call VisualSelection(\'\', \'\')<CR>/<C-R>=@/<CR><CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '#', ':<C-u>call VisualSelection(\'\', \'\')<CR>?<C-R>=@/<CR><CR>', {noremap = true, silent = true})

---------------------------------------------------------------
-- => Moving around, tabs, windows and buffers
---------------------------------------------------------------
-- Disable highlight when <leader><cr> is pressed
vim.api.nvim_set_keymap('', '<leader><cr>', ':noh<cr>', {noremap = true, silent = true})

-- Smart way to move between windows
vim.api.nvim_set_keymap('', '<C-h>', '<C-W>h', {noremap = true})
vim.api.nvim_set_keymap('', '<C-l>', '<C-W>l', {noremap = true})

-- Close the current buffer
vim.api.nvim_set_keymap('', '<leader>bd', ':Bclose<cr>:tabclose<cr>gT', {noremap = true})

-- Close all the buffers
vim.api.nvim_set_keymap('', '<leader>ba', ':bufdo bd<cr>', {noremap = true})

-- Open previous buffer
vim.api.nvim_set_keymap('', '<leader>z', '<C-^>', {noremap = true})

-- Navigate between buffer
vim.api.nvim_set_keymap('', '<leader>l', ':bnext<cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>h', ':bprevious<cr>', {noremap = true})

-- Useful mappings for managing tabs
vim.api.nvim_set_keymap('', '<leader>tn', ':tabnew<cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>to', ':tabonly<cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>tc', ':tabclose<cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>tm', ':tabmove', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>t<leader>', ':tabnext', {noremap = true})

-- Switch CWD to the directory of the open buffer
vim.api.nvim_set_keymap('', '<leader>cd', ':cd %:p:h<cr>:pwd<cr>', {noremap = true})

---------------------------------------------------------------
-- => Editing mappings
---------------------------------------------------------------
-- Remap VIM 0 to first non-blank character
vim.api.nvim_set_keymap("n", "0", "^", { silent = true })

-- Set space to run @q macro
vim.api.nvim_set_keymap("n", "<Space>", "@q", {})

-- Move a line of text using ALT+[jk] or Command+[jk] on mac
vim.api.nvim_set_keymap("n", "<M-j>", "mz:m+<cr>`z", { silent = true})
vim.api.nvim_set_keymap("n", "<M-k>", "mz:m-2<cr>`z", { silent = true})
vim.api.nvim_set_keymap("v", "<M-j>", ":m'>+<cr>`zgv`yo`z", { silent = true})
vim.api.nvim_set_keymap("v", "<M-k>", ":m'<-2<cr>`>my`<mzgv`yo`z", { silent = true})

if vim.fn.has("mac") or vim.fn.has("macunix") then
  vim.api.nvim_set_keymap("n", "<D-j>", "<M-j>", { silent = true })
  vim.api.nvim_set_keymap("n", "<D-k>", "<M-k>", { silent = true })
  vim.api.nvim_set_keymap("v", "<D-j>", "<M-j>", { silent = true })
  vim.api.nvim_set_keymap("v", "<D-k>", "<M-k>", { silent = true })
end

-- Ctrl+c = copy | Ctrl+v = paste
-- Only works in visual and insert mode to avoid conflict to visual-block key
-- <C-v> in normal mode
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true })
vim.api.nvim_set_keymap("v", "<C-x>", '"+d', { noremap = true })
vim.api.nvim_set_keymap("v", "<C-v>", 'c<ESC>"+p', { noremap = true })

-- Copy relative filepath (based on cwd) of current buffer
vim.api.nvim_set_keymap("n", "<leader>fp", ":let @+ = expand('%')<CR>", { noremap = true })

---------------------------------------------------------------
-- => Misc
---------------------------------------------------------------

-- Don't close window when deleting a buffer
vim.cmd('command! -buffer Bclose lua bufcloseCloseIt()')

function bufcloseCloseIt()
    local currentBufNum = vim.api.nvim_get_current_buf()
    local alternateBufNum = vim.fn.bufnr('#')

    if vim.fn.buflisted(alternateBufNum) == 1 then
        vim.api.nvim_command('buffer #')
    else
        vim.api.nvim_command('bnext')
    end

    if vim.api.nvim_get_current_buf() == currentBufNum then
        vim.api.nvim_command('new')
    end

    if vim.fn.buflisted(currentBufNum) == 1 then
        vim.api.nvim_command('bdelete! ' .. currentBufNum)
    end
end
