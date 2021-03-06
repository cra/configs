set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
set background=dark
"colorscheme solarized
"colorscheme dual
"colorscheme askapachecode
colorscheme elflord
set number

" Toggle 'show invisibles'
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:▸\ ,eol:¬

filetype plugin indent on
syntax on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" when I do gq, don't add extra spaces between sentences
set nojoinspaces

" ignore the following pep8 stuff:
" E501 line too long
" E261 two spaces before inline comment
" E262 inline comment must starts with "# "
" E265 block comment should start with "# "
" E122 continuation line missing indentation or outdented
" E128 continuation line under-indented for visual indent
" E731 do not assign a lambda expression, use a def
let g:pymode_lint_ignore="E501,E261,E262,E265,E122,E128,W602,E731"

"aerogram mode
" E302 expected 2 blank lines, found 0
" E225 missing whitespace around operator
" E231 missing whitespace after ','
" E303 too many blank lines
" E202 whitespace before ']'
"let g:pymode_lint_ignore="E302,E303,E202,E225,E231,E501,E261,E265,E122,E128,W602,"

"
" Rope
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_vim_completion = 0

" TagTime helper macro
"replace tags on this tagtime line with those from the prev line.
"(warning: must have timestamp in square brackets on both lines)
map <f4> mzk0el"vy/\([\\|$\)<cr>jd/\([\\|$\)<cr>h"vp`zj

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

set laststatus=2
 
"autocmd FileType tex setlocal spell spelllang=en,ru

set smarttab
set expandtab
set modeline

autocmd FileType python set shiftwidth=4
autocmd FileType python set tabstop=4
autocmd FileType python set softtabstop=4
autocmd FileType python set textwidth=80

autocmd FileType javascript set shiftwidth=4
autocmd FileType javascript set tabstop=4
autocmd FileType javascript set softtabstop=4
autocmd FileType javascript set textwidth=80

autocmd FileType lisp set shiftwidth=4
autocmd FileType lisp set tabstop=4
autocmd FileType lisp set softtabstop=4
autocmd FileType lisp set textwidth=80

au BufReadPost *.html set syntax=htmldjango


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
