set encoding=utf-8
set termencoding=utf-8
set t_Co=256
"tabs
"set tabstop=4
"set shiftwidth=4
"set smarttab
"set foldmethod=indent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
"set et "with this tabs won't be ..
"match
set showmatch
set hlsearch
set incsearch
set ignorecase
set backspace=indent,eol,start whichwrap+=<,>,[,]
"hilghlight tabs
set list listchars=trail:·,tab:··,precedes:<,extends:>
"enc
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866
"stuff
set number
set nocompatible
syn on
set ruler
set wildmenu
set vb t_vb=
set showcmd
set noswapfile
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
"paste
set pastetoggle=<F5>
set hidden
"set cursorline
set novisualbell
set mouse=a


filetype on

" CTRL-C and CTRL-Insert are Copy
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi
imap <S-Insert> <C-V>
vmap <S-Insert> <C-V>

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" map Ctrl-y to delete lines
"inoremap <c-y> <esc>ddi


imap <Tab> <C-N>

" Поиск и замена слова под курсором
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

" F2 - быстрое сохранение
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

" F3 - просмотр ошибок
nmap <F3> :copen<cr>
vmap <F3> <esc>:copen<cr>
imap <F3> <esc>:copen<cr>

nmap <C-F5> <Esc>:BufExplorer<cr>
vmap <C-F5> <esc>:BufExplorer<cr>
imap <C-F5> <esc>:BufExplorer<cr>

" F6 - предыдущий буфер
nmap <C-F6> :bp<cr>
vmap <C-F6> <esc>:bp<cr>i
imap <C-F6> <esc>:bp<cr>i

" F7 - следующий буфер
nmap <C-F7> :bn<cr>
vmap <C-F7> <esc>:bn<cr>i
imap <C-F7> <esc>:bn<cr>i

" F8 - список закладок
map <F8> :MarksBrowser<cr>
vmap <F8> <esc>:MarksBrowser<cr>
imap <F8> <esc>:MarksBrowser<cr>

" F9 - "make" команда
map <F9> :make<cr>
vmap <F9> <esc>:make<cr>i
imap <F9> <esc>:make<cr>i

" F10 - удалить буфер
map <F10> :bd<cr>
vmap <F10> <esc>:bd<cr>
imap <F10> <esc>:bd<cr>

" F11 - показать окно Taglist
map <F11> :TlistToggle<cr>
vmap <F11> <esc>:TlistToggle<cr>
imap <F11> <esc>:TlistToggle<cr>

" F12 - обозреватель файлов
map <S-C-E> :Ex<cr>
vmap <S-C-E> <esc>:Ex<cr>i
imap <S-C-E> <esc>:Ex<cr>i

nmap <C-N>v :NERDTree<cr>
vmap <C-N>v <esc>:NERDTree<cr>i
imap <C-N>v <esc>:NERDTree<cr>i

nmap <C-N>x :NERDTreeClose<cr>
vmap <C-N>x <esc>:NERDTreeClose<cr>i
imap <C-N>x <esc>:NERDTreeClose<cr>i


" < & > - делаем отступы для блоков
vmap < <gv
vmap > >gv
"completition
map <Esc>[Z <S-Tab>
imap <Tab> <c-r>=InsertTabWrapper("backward")<cr>
imap <S-Tab> <c-r>=InsertTabWrapper("forward")<cr>
function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
endfunction
"tabs
command! -bang QA :call TabQAll('<bang>')
"imap <C-T> <Esc>:tabnew<CR>
"nmap <C-T> :tabnew<CR>
"imap <C-Up> <Esc>:tabnext<CR>
"imap <C-Down> <Esc>:tabprevious<CR>
"nmap <C-Up> :tabnext<CR>
"nmap <C-Down> :tabprevious<CR>
"My { } and [] Style
"inoremap { {<CR>}<Esc>O<Tab>
"imap [ []<LEFT>
"Double
imap <C-d> <esc>yypi
"Home
nmap <Home> ^
imap <Home> <Esc>I
"Path Complete By Shift+Tab
imap <S-Tab> <C-X><C-F>
set complete=""
" Из текущего буфера
set complete+=.
" Из словаря
set complete+=k
" Из других открытых буферов
set complete+=b
" из тегов 
set complete+=t

" Включаем filetype плугин. Настройки, специфичные для определынных файлов мы разнесём по разным местам
filetype plugin on
au BufRead,BufNewFile *.phps set filetype=php
au BufRead,BufNewFile *.thtml set filetype=php

" Настройки для SessionMgr
let g:SessionMgr_AutoManage = 0
let g:SessionMgr_DefaultName = "mysession"

" Настройки для Tlist (показвать только текущий файл в окне навигации по коду)
let g:Tlist_Show_One_File = 1

set completeopt-=preview
set completeopt+=longest
set mps-=[:] 
"Next level
""Copy Symbols from up and down<C-Y> of the line<C-E>
"theme
"set background=dark
"highlight Comment cterm=NONE ctermfg=Gray ctermbg=black 
"hi CursorLine term=NONE cterm=NONE ctermbg=LightBlue
"hi Pmenu ctermbg=Gray
"let g:bg_tango = 1 
colorscheme neverland-laptop

