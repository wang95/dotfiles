" ==================================================
" .vimrc of Brian {{{
" ==================================================
" Auto reload .vimrc upon save
autocmd! bufwritepost .vimrc source ~/.vimrc


" }}}
" ==================================================
" vim-plug Block {{{
" ==================================================
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug '~/.fzf'                            " path to fzf directory
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" ----------------------------------------
" Install Color Schemes
" ----------------------------------------
Plug 'morhetz/gruvbox'
"Plug 'tomasr/molokai'
"Plug 'liuchengxu/space-vim-dark'
"Plug 'chriskempson/vim-tomorrow-theme'
"Plug 'joshdick/onedark.vim'
"Plug 'w0ng/vim-hybrid'
" ----------------------------------------

call plug#end()


" }}}
" ==================================================
" Basic Settings {{{
" ==================================================
set nocompatible                  " 关闭 vi 兼容模式
set mouse=n                       " 仅 N 模式支持鼠标，其他模式支持 Xshell 鼠标复制
set history=1000                  " 历史记录
set backspace=indent,eol,start    " 退格键可以删除行

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
set background=dark

colorscheme gruvbox
"colorscheme molokai
"colorscheme space-vim-dark
"colorscheme Tomorrow-Night
"colorscheme onedark
"colorscheme hybrid
" ----------------------------------------

set t_Co=256
syntax on
set laststatus=2                              " 总是显示状态行
set number                                    " 显示行号
"highlight LineNr ctermfg=243 ctermbg=235     " 行号和背景颜色
highlight LineNr ctermfg=243 ctermbg=236      " 行号和背景颜色，浅一点搭配 gruvbox 主题
set cursorline                                " 高亮光标所在行
"set cursorcolumn                             " 高亮光标所在列
"highlight CursorLine cterm=NONE ctermbg=237 ctermfg=NONE guibg=NONE guifg=NONE        " 高亮行背景颜色
"highlight CursorColumn cterm=NONE ctermbg=237 ctermfg=NONE guibg=NONE guifg=NONE      " 高亮列背景颜色

" 显示不可见符号
"set list
" 自定义不可见符号外观
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:↵,precedes:«,extends:»

" ----------------------------------------
" vim-airline
" ----------------------------------------
" airline theme
let g:airline_theme='dark'
"let g:airline_theme='powerlineish'
"let g:airline_theme='distinguished'

" Use Powerline fonts
let g:airline_powerline_fonts = 1

" 打开 tabline
let g:airline#extensions#tabline#enabled = 1
" tabline 显示 buffer numbers
let g:airline#extensions#tabline#buffer_nr_show = 1

" 禁用空白符错误检测(行尾空格等)
"let g:airline#extensions#whitespace#enabled = 0
" 自定义空白符检测提示符号
"let g:airline#extensions#whitespace#symbol = '!'

" 空白符错误检测开关
map <F4> :AirlineToggleWhitespace<CR>

" 自定义 airline 符号
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

" Unicode symbols
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

" Powerline symbols
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
"let mapleader = ","        " 注意，此行后的 Leader 才是自定义的

" ----------------------------------------
" Basic Mappings
" ----------------------------------------
" Quickly close the current window
nnoremap <Leader>q :q<CR>
" Quickly save the current file
nnoremap <Leader>w :w<CR>

" 取消查找匹配高亮显示
map <F3> :set nohlsearch<CR>

" 显示/隐藏不可见字符
map <F5> :set list<CR>
map <F6> :set nolist<CR>

" ----------------------------------------
" Quickly Edit .vimrc
" ----------------------------------------
" Quickly reload .vimrc
map <Leader>ss :source ~/.vimrc<CR>
" Quickly open .vimrc
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

" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
let g:plug_window = 'noautocmd vertical topleft new'

" 显示行号
let g:NERDTreeShowLineNumbers=1

" 窗口宽度 默认30
"let g:NERDTreeWinSize=35

" ----------------------------------------
" airblade/vim-gitgutter
" ----------------------------------------
" vim-gitgutter 开关
map <F7> :GitGutterToggle<CR>

" line highlighting 开关
map <F8> :GitGutterLineHighlightsToggle<CR>

" ----------------------------------------
" Xuyuanp/nerdtree-git-plugin
" ----------------------------------------
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" ----------------------------------------
" plasticboy/vim-markdown
" ----------------------------------------
let g:vim_markdown_folding_disabled = 1


" }}}
" ==================================================
