" init.vim - neovim configuration file

"""""""" sets """"""""
syntax on                               " enables syntax highlighting
set exrc                                " put additional vimrc in any dir
set noshowmode                          " remove --insert-- at the bottom (have lightline)
set nu                                  " precede each line with its line number
set number 
set relativenumber
set nohlsearch
set hidden                              " navigate buffers without losing unsaved work
set splitbelow
set splitright
set noerrorbells
set wildmenu                            " nice menu when typing `:command <Tab>`
set wildmode=longest,list,full 
set wildignore+=*.pyc                   " ignore files in finders
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set tabstop=2                           " text
set softtabstop=2
set shiftwidth=2
set expandtab

autocmd FileType python call Python_settings()

function! Python_settings()
  setlocal tabstop=4
  setlocal softtabstop=4
  setlocal shiftwidth=4
endfunction

set smartindent
set mouse=a                             " enable mouse support
set nowrap
set ai
set noswapfile                          " undos
set nobackup
set undodir=~/.vim/undodir
set undofile
set smartcase                           " case insensitive search unless capital letters are used
set ignorecase
set incsearch
set termguicolors                       " better colors
set scrolloff=8
set colorcolumn=99
set signcolumn=yes
set completeopt=menuone,noinsert,noselect
set updatetime=250
set shortmess+=c
set backspace=2                         " fix backspace inconveniences
" trying this out
set autochdir
set autoread
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
""""""""""""""""""""""

"""""" remaps """"""""
let mapleader = " "
inoremap jk <Esc>
" noremap! <C-h> <C-w>  
" noremap! <C-BS> <C-w> " c-bs in insert mode ! applies to insert & command-line
nnoremap Y yg$
nnoremap n nzzzv  
nnoremap N Nzzzv
nnoremap J mzJ`z
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" windows mvmt
nnoremap <c-j> <c-w>j 
nnoremap <c-h> <c-w>h 
nnoremap <c-k> <c-w>k 
nnoremap <c-l> <c-w>l 
nnoremap <c-c> <c-w>c
" create new buffers w/ ctrl+n
nnoremap <silent><expr> <c-n> ':'.(winwidth(0) > 75 ? 'vs' : '').' wincmd n<cr>'

nnoremap <Leader>ft :TSPlayground<CR>
nnoremap <c-p> :Telescope find_files<CR>
nnoremap <c-f> :Telescope live_grep<CR>
nnoremap <c-b> :Telescope buffers<CR>
nnoremap <c-g> :Telescope git_status<CR>
nnoremap <c-s> :Telescope treesitter<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>  " test stuff faster


""""""toggle terminal""""""""
command! Term :bo 5new | term

" start term in insert mode
autocmd TermOpen term://* startinsert

" use esc in the vim terminal
tnoremap <Esc> <C-\><C-n>
tnoremap jk <C-\><C-n>

let g:TermIsOpen=0

function! ToggleTerm()
    if g:TermIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&buftype") ==# "terminal")
                silent exe "bdelete! " . i
            endif
            let i-=1
        endwhile
        let g:TermIsOpen=0
    else
        let g:TermIsOpen=1
        silent Term
    endif
endfunction

noremap <silent> <C-T> :call ToggleTerm()<CR>
"""""""""""""""""""""""""""""""

"""""""""toggle netr"""""""""
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" netr file explorer toggle
noremap <silent> <C-E> :call ToggleNetrw()<CR>
"""""""""""""""""""""""""""""""

"""""" colors """"""""
highlight Normal guibg=none
""""""""""""""""""""""

""""" variables """"""
let g:netrw_banner = 0  " no banner in netrw
let g:netrw_liststyle = 3  " better netrw style
let g:netrw_winsize = 15  " netrw window size when opened
" let g:netrw_browse_split = 4  " open files in new window
let g:netrw_altv = 1

let g:tsplayground_winsize = 25  " tree syntax from treesitter
set clipboard+=unnamedplus
let g:rooter_patterns = ['.git', '.svn', 'package.json', '!node_modules']
""""""""""""""""""""""

"""""" plugins """""""
call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'  " theme
Plug 'itchyny/lightline.vim' " lightline
Plug 'chrisbra/Colorizer'  " colorize colors
Plug 'mhinz/vim-startify'  " start screen

Plug 'nvim-lua/plenary.nvim'  " telescope required plenary
Plug 'nvim-telescope/telescope.nvim' " main telescope plugin
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'} " optional plugin recommended by Telescope docs

Plug 'tpope/vim-fugitive'  " git wrapper
Plug 'lewis6991/gitsigns.nvim'

Plug 'neovim/nvim-lspconfig'  " lsp
Plug 'onsails/lspkind-nvim'  " autocompletion icons
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " treesitter - improves syntax highlighting
Plug 'nvim-treesitter/playground'

Plug 'hrsh7th/nvim-cmp'  " autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'  " nvim cmp dependency
Plug 'L3MON4D3/LuaSnip'  " autocomplete for snippets
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'mfussenegger/nvim-dap'  " debugger
Plug 'mfussenegger/nvim-dap-python'
" Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'rcarriga/nvim-dap-ui'

" testing
Plug 'airblade/vim-rooter'  " testing
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

call plug#end()

""""""""""""""""""""""
"""debug (testing - wont be using for a while)"""
nnoremap <leader>dh :lua require"dap".toggle_breakpoint()<CR>
nnoremap <leader>dH :lua require"dap".set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <A-k> :lua require"dap".step_out()<CR>
nnoremap <A-l> :lua require"dap".step_into()<CR>
nnoremap <A-j> :lua require"dap".step_over()<CR>
nnoremap <A-h> :lua require"dap".continue()<CR>
nnoremap <leader>dn :lua require"dap".run_to_cursor()<CR>
nnoremap <leader>dk :lua require"dap".up()<CR>zz
nnoremap <leader>dj :lua require"dap".down()<CR>zz
nnoremap <leader>dc :lua require"dap".terminate()<CR>
nnoremap <leader>dr :lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l
nnoremap <leader>dR :lua require"dap".clear_breakpoints()<CR>
nnoremap <leader>de :lua require"dap".set_exception_breakpoints({"all"})<CR>
nnoremap <leader>da :lua require"debugHelper".attach()<CR>
nnoremap <leader>dA :lua require"debugHelper".attachToRemote()<CR>
nnoremap <leader>di :lua require"dap.ui.widgets".hover()<CR>
nnoremap <leader>d? :lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>
nnoremap <leader>dq :lua require('dapui').toggle()<CR>
lua require('dapui').setup()
" default is unittest
" lua require('dap-python').test_runner = 'pytest'

"""""""""""

"""" plugin config """"
colorscheme gruvbox
" set background=light
" let g:gruvbox_contrast_dark="hard"
let g:gruvbox_sign_column="none"
lua require('bnamaral')
""""""""""""""""""""""

