set shell=/bin/bash

" -- Execute pathogen and install plugins at startup
execute pathogen#infect()


" -- Cancel compatibility with vi
set nocompatible


" -- Display
set title            " Update title of window to terminal tile
set number           " Display line numbers
set ruler            " Display cursor position
set wrap             " Wrap lines when they are too long
set cursorline       " Show a visual line under the cursor
set showmatch        " Show the matching part of the pair for [] {} and ()

set scrolloff=3      " Display at least three lines around the cursor

set guioptions=T     " Enable the toolbar

set guifont=DejaVu\ Sans\ Mono\ 12
set antialias


" -- Editing
set ts=4              " Set tabs to have four spaces
set autoindent        " Indent when moving to the next line
set expandtab         " Expand tabs into spaces
set shiftwidth=4      " When using the >> or << commands, shift lines by 4 spaces
set clipboard=unnamed " Allow yank to copy to clipboard
set mouse=a           " Enables the mouse


" -- Search
set ignorecase       " Ignore case when searching
set smartcase        " Enable case sensitivity when search term contains upper case character

set incsearch        " Highlight search results when typing
set hlsearch         " Highlight search results


" -- Beep
set visualbell       " Prevent Vim from beeping
set noerrorbells     " Ditto


" -- Disable the arrow keys. A little insane, but let's try it
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>


" -- Use the j key pressed twice to invoke Esc
:imap jj <Esc>


" -- Use the dark version of Solarized
colorscheme solarized8_dark_low


" -- Backspace behaves as expected
set backspace=indent,eol,start


" -- Remap the leader key
let mapleader=","


" -- Hide buffer when switching to another buffer
set hidden


" -- Ack Parameters
let g:ackprg="ack -H --nocolor --nogroup --column"  " Default params


" -- Add a mark and search
nmap <leader>j mA:Ack<space>


" -- Add a mark and search for the word under the cursor
nmap <leader>ja mA:Ack "<C-r>=expand("<cword>")<cr>"
nmap <leader>ja mA:Ack "<C-r>=expand("<cWORD>")<cr>"


autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>


" -- Enable syntax highlighting
syntax enable


" -- Enable file specific behaviour like syntax highlighting and indentation
filetype on
filetype plugin on
filetype indent on

autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType scss setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2

" -- YouCompleteMe Config
let g:ycm_server_python_interpreter = '/home/kai/envs/edrolo/bin/python'
let g:ycm_python_binary_path = 'python'

" Remap some of the completer commands
map <F12> :YcmCompleter GoToDefinition<CR>
map <C-r> :YcmCompleter GoToReferences<CR>

" -- Ale (Async Linting)
let g:ale_linters = {'javascript': ['eslint']}

" -- Javascript prettier
let g:prettier#exec_cmd_async=1
let g:prettier#autoformat=0
autocmd BufWritePre *.js, *.jsx, *.css, *.scss, *.less, *.json, PrettierAsync

" -- Disable swp files
set backupdir=/tmp
set directory=/tmp,.

" -- NerdTree config
map <C-n> :NERDTreeToggle<CR>

" -- Python AutoPep8
au FileType python setlocal formatprg=autopep8\ -

" -- fzf
set rtp+=~/.fzf

" -- ctrl + p
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" -- Make Ack use Ag
let g:ackprg = 'ag --vimgrep'

" -- Fugitive (Git plugin)
set diffopt+=vertical
