set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
set background=dark
"colorscheme solarized
"colorscheme dual
colorscheme askapachecode
set number

filetype plugin indent on
syntax on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" ignore the following pep8 stuff:
" E501 line too long
" E261 two spaces before inline comment
" E265 block comment should start with "# "
" E122 continuation line missing indentation or outdented
" E128 continuation line under-indented for visual indent
let g:pymode_lint_ignore="E501,E261,E265,E122,E128,W602"
"
" Rope
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_vim_completion = 0


set laststatus=2
 
"autocmd FileType tex setlocal spell spelllang=en,ru

set smarttab
set expandtab
set modeline

autocmd FileType python set shiftwidth=4
autocmd FileType python set tabstop=4
autocmd FileType python set softtabstop=4
autocmd FileType python set textwidth=80

autocmd FileType lisp set shiftwidth=4
autocmd FileType lisp set tabstop=4
autocmd FileType lisp set softtabstop=4
autocmd FileType lisp set textwidth=80


augroup resCur
    autocmd!
    autocmd BufReadPost * call setpos('.', getpos("'\""))
augroup END

if has("gui_running")
    set linespace=3 "amount of pixels lines between characters
    set guifont=Monospace\ 10

    " ------------------------------------------------------------------
    " Solarized Colorscheme Config
    " ------------------------------------------------------------------
    let g:solarized_contrast="high"    "default value is normal
    let g:solarized_visibility="high"    "default value is normal
    let g:solarized_hitrail=1    "default value is 0
    syntax enable
    set background=light
    colorscheme solarized
    " ------------------------------------------------------------------

    " The following items are available options, but do not need to be
    " included in your .vimrc as they are currently set to their defaults.

    " let g:solarized_termtrans=0
    " let g:solarized_degrade=0
    " let g:solarized_bold=1
    " let g:solarized_underline=1
    " let g:solarized_italic=1
    " let g:solarized_termcolors=16
    " let g:solarized_diffmode="normal"
    " let g:solarized_menu=1

endif
