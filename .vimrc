set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
colorscheme Dim_modified
"colorscheme dual
set number

filetype plugin indent on
syntax on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
 
"autocmd FileType tex setlocal spell spelllang=en,ru

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab

if has("gui_running")
    set guifont=Monospace\ 18
endif
