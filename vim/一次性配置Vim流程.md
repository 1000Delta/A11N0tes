# 一次性配置Vim流程

1. 修改配置文件`~/.vimrc`或者`/etc/.vimrc`

   无插件版本

   ```shell
   set nocompatible " be iMproved, required
   "filetype off " required
   syntax on " 语法高亮 
   set ruler " 状态栏标尺
   set incsearch " 搜索时显示结果
   set ignorecase " 搜索时忽略大小写
   
   " 界面美化
   set laststatus=2 " 总是显示状态栏
   set ruler " 行号显示
   set number " 高亮当前行	
   set hlsearch " 高亮搜索内容
   if has("gui_running") "检查是否运行在GUI模式下
   set guifont=Microsoft\ YaHei\ Mono:h12 "设置字体和字号
   endif
   
   
   " 编码设置
   set encoding=utf-8
   set termencoding=utf-8
   set formatoptions+=mM
   set fencs=utf-8,gbk
   set smartindent
   
   " 缩进设置
   set tabstop=4
   set shiftwidth=4
   set softtabstop=4
   
   " 折行设置
   set linebreak " 特殊符号才会折行
   
   set autochdir " 自动切换工作目录
   ```

   

   ```shell
   set nocompatible " be iMproved, required
   "filetype off " required
   syntax on " 语法高亮 
   set ruler " 状态栏标尺
   set incsearch " 搜索时显示结果
   set ignorecase " 搜索时忽略大小写
   
   " 配色方案
   set background=dark 
   colorscheme solarized
   "colorscheme molokai 
   "colorscheme phd 
   let g:Powerline_colorscheme='solarized256' " 设置状态栏主题风格
   
   " 界面美化
   set laststatus=2 " 总是显示状态栏
   set ruler " 行号显示
   set number " 高亮当前行	
   set hlsearch " 高亮搜索内容
   if has("gui_running") "检查是否运行在GUI模式下
   set guifont=Microsoft\ YaHei\ Mono:h12 "设置字体和字号
   endif
   
   " 编码设置
   set encoding=utf-8
   set termencoding=utf-8
   set formatoptions+=mM
   set fencs=utf-8,gbk
   set smartindent
   
   " 缩进设置
   set tabstop=4
   set shiftwidth=4
   set softtabstop=4
   
   " 折行设置
   set linebreak " 特殊符号才会折行
   
   set autochdir " 自动切换工作目录
   
   " Go语言工具配置
   filetype plugin on " gocode
   
   " set the runtime path to include Vundle and initialize
   set rtp+=~/.vim/bundle/Vundle.vim
   let path='~/.vim/bundle/Vundle.vim'
   call vundle#begin(path)
   " alternatively, pass a path where Vundle should install plugins
   "call vundle#begin('~/some/path/here')
   " let Vundle manage Vundle, required
   Plugin 'VundleVim/Vundle.vim'
   " The following are examples of different formats supported.
   " Keep Plugin commands between vundle#begin/end.
   " plugin on GitHub repo
   Plugin 'tpope/vim-fugitive'
   Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
   Plugin 'fatih/vim-go'
   Plugin 'nsf/gocode', {'rtp': 'vim/'}
   " plugin from http://vim-scripts.org/vim/scripts.html
   " Plugin 'L9'
   " Git plugin not hosted on GitHub
   Plugin 'git://git.wincent.com/command-t.git'
   " The sparkup vim script is in a subdirectory of this repo called vim.
   " Pass the path to set the runtimepath properly.
   Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
   " Install L9 and avoid a Naming conflict if you've already installed a
   " different version somewhere else.
   " Plugin 'ascenator/L9', {'name': 'newL9'}
   Plugin 'Valloric/YouCompleteMe'
   " All of your Plugins must be added before the following line
   call vundle#end() " required
   filetype plugin indent on " required
   " To ignore plugin indent changes, instead use:
   "filetype plugin on
   "
   " Brief help
   " :PluginList - lists configured plugins
   " :PluginInstall - installs plugins; append `!` to update or just :PluginUpdate
   " :PluginSearch foo - searches for foo; append `!` to refresh local cache
   " :PluginClean - confirms removal of unused plugins; append `!` to auto-approve removal
   "
   " see :h vundle for more details or wiki for FAQ
   " Put your non-Plugin stuff after this line
   "
   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " => YouCompleteMe  代码自动补全
   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " 自动补全配置
   set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
   autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
   inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
   "上下左右键的行为 会显示其他信息
   inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
   inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
   inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
   inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
   
   "youcompleteme  默认tab  s-tab 和自动补全冲突
   "let g:ycm_key_list_select_completion=['<c-n>']
   let g:ycm_key_list_select_completion = ['<Down>']
   "let g:ycm_key_list_previous_completion=['<c-p>']
   let g:ycm_key_list_previous_completion = ['<Up>']
   let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
   
   let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
   let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
   let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
   let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
   nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
   "nnoremap <leader>lo :lopen<CR>	"open locationlist
   "nnoremap <leader>lc :lclose<CR>	"close locationlist
   inoremap <leader><leader> <C-x><C-o>
   "在注释输入中也能补全
   let g:ycm_complete_in_comments = 1
   "在字符串输入中也能补全
   let g:ycm_complete_in_strings = 1
   "注释和字符串中的文字也会被收入补全
   let g:ycm_collect_identifiers_from_comments_and_strings = 0
   
   nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处 
   " 函数参数补全配置
   set rtp+=~/.vim/bundle/CompleteParameter.vim
   " Minimal setting
   inoremap <silent><expr> ( complete_parameter#pre_complete("()")
   smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
   imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
   smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
   imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
   
   ```

2. 下载所需插件/主题

   1. [Vundle](插件/0.插件管理Vundle.md)
   2. [YouCompleteMe](插件/安装YouCompleteMe.md)
   3. [Solarized主题](主题/Solarized.md)
   4. [安装powerline]()

3. 强化自动补全 - [参数补全CompleteParameter](插件/安装CompleteParameter.md)
