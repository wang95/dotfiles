" ==================================================
" .vimrc of Brian {{{
" ==================================================
" When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc


" }}}
" ==================================================
" vim-plug Block {{{
" ==================================================
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'

" ----------------------------------------
" Install Color Schemes
" ----------------------------------------
Plug 'morhetz/gruvbox'
"Plug 'tomasr/molokai'
"Plug 'liuchengxu/space-vim-dark'
"Plug 'chriskempson/vim-tomorrow-theme'
"Plug 'joshdick/onedark.vim'
" ----------------------------------------

call plug#end()


" }}}
" ==================================================
" Basic Settings {{{
" ==================================================
set nocompatible      " 关闭 vi 兼容模式
set mouse=n           " 仅 N 模式支持鼠标，其他模式支持 Xshell 鼠标复制
set history=1000      " 历史记录

" ----------------------------------------
" Encoding
" ----------------------------------------
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
set fileencoding=utf-8

" ----------------------------------------
" Search
" ----------------------------------------
set hlsearch          " 高亮显示搜索内容
set incsearch         " 输入关键字的时候高亮显示
set ignorecase        " 搜索时忽略大小写
set smartcase         " 模式中有大写字母时不忽略大小写

" ----------------------------------------
" Tab & Indent
" ----------------------------------------
set expandtab         " 插入 <Tab> 时使用空格
set tabstop=4         " <Tab> 在文件里使用的空格数
set softtabstop=4     " 编辑时 <Tab> 使用的空格数
set smarttab          " 插入 <Tab> 时使用 'shiftwidth'
set shiftwidth=4      " (自动)缩进使用的步进单位，以空白数目计
set shiftround        " 缩进列数对齐到 shiftwidth 的整数倍
set autoindent        " 根据上一行决定新行的缩进
set cindent           " C 语言缩进，比 smartindent 严格，启用时 smartindent 失效


" }}}
" ==================================================
" Visual Settings {{{
" ==================================================
" ----------------------------------------
" Color Schemes
" ----------------------------------------
colorscheme gruvbox
"colorscheme molokai
"colorscheme space-vim-dark
"colorscheme Tomorrow-Night
"colorscheme onedark

set background=dark
" ----------------------------------------

set t_Co=256
syntax on
set laststatus=2                              " 总是显示状态行
set number                                    " 显示行号
"highlight LineNr ctermfg=243 ctermbg=235     " 行号和背景颜色
highlight LineNr ctermfg=243 ctermbg=236      " 行号和背景颜色，浅一点搭配 gruvbox 主题
set cursorline                                " 高亮光标所在行
"set cursorcolumn                             " 高亮光标所在列
"highlight CursorLine cterm=NONE ctermbg=237 ctermfg=NONE guibg=NONE guifg=NONE          " 高亮行背景颜色
"highlight CursorColumn cterm=NONE ctermbg=237 ctermfg=NONE guibg=NONE guifg=NONE        " 高亮列背景颜色

" ----------------------------------------
" vim-airline
" ----------------------------------------
" airline Theme
let g:airline_theme='dark'
"let g:airline_theme='powerlineish'
"let g:airline_theme='distinguished'

" Use Powerline Fonts
let g:airline_powerline_fonts = 1

" 打开 tabline 功能，方便查看Buffer和切换
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" 隐藏 airline 右边空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

" 自定义 airline 符号
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

" Unicode Symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" Powerline Symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''        " 默认为 ☰
let g:airline_symbols.maxlinenr = ''
" ----------------------------------------


" }}}
" ==================================================
" Mappings {{{
" ==================================================
let mapleader = ","          " 注意，此行后的 Leader 才是自定义的

" ----------------------------------------
" Basic Mappings
" ----------------------------------------
" Quickly close the current window
nnoremap <Leader>q :q<CR>
" Quickly save the current file
nnoremap <Leader>w :w<CR>

" ----------------------------------------
" Fast Editing of .vimrc
" ----------------------------------------
" Fast reloading of the .vimrc
map <Leader>ss :source ~/.vimrc<CR>
" Fast editing of .vimrc
map <Leader>ee :e ~/.vimrc<CR>

" ----------------------------------------
" Paste Mode
" ----------------------------------------
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>

" ----------------------------------------
" fzf.vim
" ----------------------------------------
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>L :BLines<CR>


" }}}
" ==================================================
" Other Settings {{{
" ==================================================
" ----------------------------------------
" NERDTree
" ----------------------------------------
" NERDTree Toggle
map <F2> :NERDTreeToggle<CR>

" 当 NERDTree 为剩下的唯一窗口时自动关闭 vim
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 显示行号
let g:NERDTreeShowLineNumbers=1

" 窗口宽度 默认30
"let g:NERDTreeWinSize=35


" }}}
" ==================================================
