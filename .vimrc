let mapleader = "," 
set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" *******************************************************


" 自动补全配置
set completeopt=longest,menu
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"


" compile file automatically via file extension
autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype ruby nnoremap <F4> :w <bar> exec '!ruby -W '.shellescape('%')<CR>


" NERD_Tree config
Plugin 'https://github.com/scrooloose/nerdtree.git'
" Tutorial: https://www.youtube.com/watch?v=CPu9mDpSYj0
" open mouse mode
let g:NERDTreeMouseMode=3
" show hidden files
"let NERDTreeShowHidden=1
" window width
let NERDTreeWinSize=31
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p


" Emmet
Plugin 'mattn/emmet-vim'
" enable just for html/css/sass/less
let g:user_emmet_install_global = 0
autocmd FileType html,css,sass,less EmmetInstall
" redefine trigger key


" Syntax checking
Plugin 'Syntastic'


" Taglist
" you can now use the ":TlistToggle" command to open/close the taglist 
" window.
Plugin 'taglist.vim'


" Full path fuzzy file, buffer, mru, tag, ... finder for Vim
Plugin 'kien/ctrlp.vim'
" Tutorial: https://www.youtube.com/watch?v=9XrHk3xjYsw
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'order:btb,min:1,max:10,results:20'


" surround target for html
Plugin 'tpope/vim-surround'


" Molokai color scheme
Plugin 'tomasr/molokai'
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai


" vim comment
Plugin 'tpope/vim-commentary' 


" vim auto pairs
Plugin 'jiangmiao/auto-pairs'


" "Map Configs"
nmap <C-T> :TlistToggle<CR> 
nmap <C-N> :NERDTreeToggle<CR>
nmap <TAB> V>
nmap <S-TAB> V<
vmap <TAB> >gv
vmap <S-TAB> <gv
map  <C-D> yyp
imap <S> <C-N>

"********************************************************
""                   一般性配置                          *
"********************************************************
set cursorline " 突出当前行
set noeb " 去掉输入错误的提示音
set noeb vb t_vb= " 禁止嘟嘟声

"关闭vim一致性原则
set nocompatible
 
"显示行号
set number
   
"设置在编辑过程中右下角显示光标的行列信息
set ruler

"在状态栏显示正在输入的命令
set showcmd
     
"设置历史记录条数
set history=2000
      
"设置取消备份 禁止临时文件的生成
set nobackup
set noswapfile
       
"设置匹配模式
set showmatch
        
"设置C/C++方式自动对齐
"set autoindent
"set cindent
         
"开启语法高亮功能
syntax enable
syntax on
          
"指定配色方案为256色
"set t_Co=256
           
"设置搜索时忽略大小写
set ignorecase
            
"配置backspace的工作方式
set backspace=indent,eol,start
             
"设置在vim中可以使用鼠标
set mouse=a
             
"设置tab宽度
set tabstop=4
              
"设置自动对齐空格数
set shiftwidth=4
                
"设置退格键时可以删除2个空格
set smarttab
set softtabstop=3
                 
"将tab键自动转换为空格
set expandtab
                  
"设置编码方式
set encoding=utf-8
                   
"自动判断编码时 依次尝试以下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
                    
"检测文件类型
filetype on
                    
"针对不同的文件采取不同的缩进方式
"filetype indent on
                   
"允许插件
filetype plugin on
                     
"启动智能补全
"filetype plugin indent on

" Turn off Enable text wrapping
set nowrap

" Turn on Display right margin and set it to 80 characters
set colorcolumn=80


