set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
set background=dark
colorscheme solarized
"colorscheme dual
set number

filetype plugin indent on
syntax on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

set laststatus=2
 
"autocmd FileType tex setlocal spell spelllang=en,ru

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab

if has("gui_running")
    set linespace=3 "amount of pixels lines between characters
    "colorscheme morning
    set guifont=Monospace\ 14
endif

augroup resCur
    autocmd!
    autocmd BufReadPost * call setpos('.', getpos("'\""))
augroup END
