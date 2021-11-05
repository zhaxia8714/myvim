"set number          "显示行号
set nonu            "不显示行号
set paste           "设置粘贴模式,防止粘贴时自动缩进
set showmatch       "高亮显示括号匹配
filetype on         "打开文件类型检查

set tabstop=4       "将tab宽度设置成等长的4个空格宽度
set shiftwidth=4    "设置智能缩进的宽度为4
set softtabstop=4   "设置删除tab的宽度

set encoding=utf-8  "设置vim 内部使用的字符编码方式

"只有在文件为c或者cpp文件的时候才会将tab建设置成空格键
if has("autocmd")
    autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.hpp set expandtab
endif

set noautoindent    "每行的缩进值与上一行相等，使用 set noautoindent 可以取消设置
set nocindent       "它会按照 C 语言的语法，自动地调整缩进的长度，比如，输入了半条语句然后回车后，缩进会自动增加一个 TABSTOP 值，
                    "输入了一个右花括号后，会自动减少一个 TABSTOP 值。set nocindent可以取消设置

syntax enable       "打开语法高亮
set syntax=on       "允许用指定语法高亮配色方案替换默认方案
set background=dark "使用黑色背景
colorscheme solarized
let g:solarized_termcolors=256

"根据文件后缀来选择对应的快捷字颜色配置文件
augroup filetypedetect 
    au! BufRead,BufNewFile *asm setfiletype asmx86
augroup END 

set ruler           "设置右下角显示光标位置状态行
set laststatus=2    "状态行显示在底部倒数第二行

"获取当前文件的路径，提供该状态行显示
function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "g")
    return curdir
endfunction

"设置状态行显示的内容
set statusline=\|\%f%m\ \%=\|\ %l,%c,\ %p%%,%L\|

"将默认的窗口切换快捷键由Ctrl+w+j\k\l\h换成Ctrl+j\k\l\h
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"用ctrl+v 选中文字之后，连续按2次按下/就可以直接搜索选中的文字
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR> 

"-------------------常用MAC快捷键----------------------------------------------
"程序之间相互切换:
"Command + Tab :任意情况下切换应用程序 - 向前循环
"
"Console快捷键:
"Command + shift +  向左/向右切换标签
"Command + k   :清屏
"Command + t   :新建标签
"Command + w   :关闭当前标签页
"Command + s   :保存终端输出

"-------------------常用vim命令------------------------------------------------
" $     : 跳至行尾
" ^     : 跳至行首
" gg    : 跳至文件第一行
" G     : 跳至文件最后一行
" w     : 移动光标到下一个词词首
" b     : 移动光标到上一个词词首
" W     : 移动光标到下一个词词首,按照空格分割
" )     : 移动光标到当前代码块的开始处
" (     : 移动光标到当前代码块的结尾处
" {     : 移动光标到上一个代码块的开始处
" }     : 移动光标到下一个代码块的开始处
" [[    : 移动光标到上一个函数的开始处
" ]]    : 移动光标到下一个函数的开始处
" 4j    : 光标下移4行
" 4k    : 光标上移4行
" ggyG  : 拷贝整个文件
" u     : 撤销
" Ctrl+r: 反撤销
" Shift+p            : 项目目录下所有的文件
" Shift+u            : 最近使用过的文件
" Shift+f            : 当前打开的文件中所有的函数
" Shift+l            : 打开或者关闭缩进对齐显示
" Shift+t            : 打开或者关闭taglist
" $ctags -R          : 生成tag文件默认文件名tags
" $ctags -R -f .tags : 生成tag文件名为.tags，这样可以方便在gitignore中设置忽略.tags文件
" Ctrl+]             : 转跳到光标当前所在函数或者变量的定义处
" Ctrl+t             : 退回光标原来在的地方
" :set nu            : 设置显示行号
" :set nonu          : 设置不显示行号
" :set list          : 显示空格和tab
" :set nolist        : 不显示空格和tab
" :/\s\+$            : 显示行尾空格
"
" 从文本中复制单词到cmd buffer:
" <1> 光标移动到待复制复单词处，
" <2> 进入命令行模式
" <3> Ctrl+r
" <4> Ctrl+w
"
" 均分面板:
"     Ctrl + w, =
"
" 文本对象:
" v, p, y, d 分别为: 选中, 粘贴, 复制, 删除
" S        : 清除当前行的内容
" iw       : 当前单词
" aw       : 当前单词和一个空格
" iW       : 当前字符串
" aW       : 当前字符串和一个空格
" is       : 当前句子
" as       : 当前句子和一个空格
" ip       : 当前段落
" ap       : 当前段落和一个空行
" a) 或 ab : 一对圆括号 (parentheses)
" i) 或 ib : 圆括号 (parentheses) 内部
" a} 或 aB : 一对花括号 {braces}
" i} 或 iB : 花括号 {braces} 内部
" a]       : 一对方括号 [brackets]
" i]       : 方括号 [brackets] 内部
" a>       : 一对尖括号 <angle brackets>
" i>       : 尖括号 <angle brackets> 内部
" a'       : 一对单引号 'single quotes'
" i'       : 单引号 'single quotes' 内部
" a"       : 一对双引号 "double quotes"
" i"       : 双引号 "double quotes" 内部
" a`       : 一对反引号 `backticks`
" i`       : 反引号 `backticks` 内部
"
" Gblame   : 查看源文件的每一行最后是谁修改的
"--------------------------------------------------------------------------


"-------------------git----------------------------------------------------
" 安装git sed
" sudo apt-get  install git-extras
"
" 用法 全局字符串替换:
" git sed ENABLE_SLAAC  CONFIG_SLAAC_ENABLE
"


"-------------------Git/Github 初始化设置-------------------------------------------
" git config --global user.name "username"
" git config --global user.email useremail@163.com 
"
" ssh-keygen -t rsa -b 4096 -C "usermail@163.com" // 生成ssh key
" cat ~/.ssh/id_rsa.pub // 将public key复制到https://github.com/settings/keys -> New SSH key
" ssh -T git@github.com // 测试是否能访问github

"-------------------MAC 环境设置-------------------------------------------
" <1> https://www.iterm2.com/ 下载iterm2，将其设置为默认console
" <2> git clone git://github.com/altercation/solarized.git 下载solarized配色
" <3> 双击solarized/iterm2-colors-solarized/Solarized Dark.itermcolors 自动将配色导入到iTerm2
" <4> iTerm2->Preferences->Profiles->Color->Color Presets 中选择Solarized Dark
" <4> iTerm2->Preferences->Profiles->Color->Minium Contrast 设置成最小值
" <5> iTerm2->Preferences->Profiles->Color->Megenta/Bright颜色值改成f12020与linux保持一致
" <6> iTerm2->Preferences->Profiles->Text中取消Draw bold text in bright color
" <7> iTerm2->Preferences->Keys 中将Previous Tab和Next Tab的快捷键改成Ctrl+PgUp和Ctrl+PgDn 与linux保持一致
" <8> mkdir -p ~/.vim/colors  // 设置vim配色
" <9> cp ./repos/solarized/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
" <10> vi ~/.vimrc   // 添加下面的内容设置 Solarized 配色：
"   set syntax=on
"   set background=dark
"   colorscheme solarized
"
" <11> vi ~/.bash_profile  // 设置ls命令显示颜色
"   export CLICOLOR=1
"
" <12> vi ~/.inputrc  // 使用PageUp/PageDown历史自动补全功能,快捷键与linux保持一致
"	#"\e[A": history-search-backward  // Fn + UpArray     MAC 键盘
"	#"\e[B": history-search-forward   // Fn + DownArray   MAC 键盘
"	"\e[5~": history-search-backward  // PageUp           MAC 外接键盘
"	"\e[6~": history-search-forward   // PageDown         MAC 外接键盘
"	set show-all-if-ambiguous on
"	set completion-ignore-case on

"-------------------Linux 环境设置-------------------------------------------
" <1> 设置terminal 配色
"   View -> Preferences -> Unnamed -> Colors -> Build-in schemes -> Solarized dark
"   View -> Preferences -> Unnamed -> Colors -> Palette -> Build-in schemes -> Solarized
"
" <2> vi ~/.vimrc   // 添加下面的内容设置 Solarized 配色：
"   syntax enable
"   set syntax=on
"   colorscheme solarized
"   set background=dark
"   let g:solarized_termcolors=256
"
" <3> vim ./.tmux.conf
"   unbind C-b
"   set -g prefix C-q
"   set -g mouse on
"   set -g default-terminal "xterm-256color"
"   set-option -ga terminal-overrides ",xterm-256color:Tc"
"
" <4> Install cscope and ctags:
"   sudo apt-get install cscope
"   sudo apt-get install ctags
"
" <5> Install YouCompleteMe:
"   sudo apt-get install cmake
"   sudo apt-get install clang
"   cd ~/.vim/plugged
"   git clone git@github.com:ycm-core/YouCompleteMe.git
"   git submodule update --init --recursive
"   cd ~/.vim/plugged/YouCompleteMe
"   ./install.py --clang-completer
"

"-------------------linux 快捷键-------------------------------------------
" 1. 使用命令行复制(该方法在SSH中不适用)：
" 在linux的bashrc文件中添加：
" alias "xc=xclip -selection clipboard"
"
" 使用方法:
"  pwd | xc          // 复制当前路径到剪切板
"  Ctrl + Shift +v   // 将剪切板中的内容粘贴到鼠标处
"
" 2. 将vim中的内容复制到linux系统中的剪切板中:
" vim使用下面的配置,这样使用vim的复制命令时，会直接将内容复制到系统的剪切板中。
" 在系统中用Ctrl+Shift+v就可以复制到别处. 注意:vim的version必须在7.3.74以上. 
set clipboard=unnamedplus

"-------------------tmux---------------------------------------------------
" 在MAC中使用tmux的时候，建议使用iterm2,它可以支持用鼠标复制粘贴。
"
" linux中的tmux的粘贴复制:
" Shift + 鼠标选中 或者 Command + 鼠标选中
" Ctrl + Shift + c copy
" Ctrl + Shift + v paste 
"
" 或者使用下面的快捷键粘贴复制：
" <1>同时按下 prefix + [ 可以进入复制模式
" <2>移动光标到要复制文本的开端位置。
" <3>按下空格键开始进行选择，移动到要复制的文本的末尾位置。
" <4>按下回车键结束复制(到了系统粘贴板，如果无效请参考使用tmux-yank)并退出文本复制模式(这是文本已经在粘贴板上)。
" <5>到目标位置按下 prefix + ] 或者用 系统粘贴(macOS 是 command + v)
"
" 将下面三句加入~/.tmux.conf中将快捷键Ctrl-b更改成Ctrl-q：
" unbind C-b
" set -g prefix C-q
" set -g mouse on
" set -g default-terminal "xterm-256color"
" set-option -ga terminal-overrides ",xterm-256color:Tc"
" bind R source-file ~/.tmux.conf ; display-message "Config reloaded.."
" 
" 更改完配置文件之后按下Ctrl-b r 重新加载配置文件
"
" 1. 创建会话相关命令:
" $tmux new -s session1      // 创建一个新的tmux会话session1
" $tmux new -s session1 -d   // 在后台创建一个新的tmux会话session1
" $tmux ls                   // 查看创建的所有会话
" $Ctrl-b d                  // 退出当前会话，但是不关闭会话
" $Ctrl-d                    // 直接关闭会话
" $tmux a -t session1        // 登录一个已知的会话，a也可以写成attach
" $tmux rename -t session1 session_uart  // 重命名会话
"
" 2. 调整窗口：
" <1>. 先按下下面的快捷键进入命令模式：
" Ctrl-b :
"
" <2>.输入下面的命令调整窗口大小：
" resize-pane -U 5  // 上移5行
" resize-pane -D 5  // 下移5行
" resize-pane -L 5  // 左移5行
" resize-pane -R 5  // 右移5行
"
"
" 快捷键(注意：先按下Ctrl-b 然后松手 最后按下后面的快捷字符)：
" 3. 面板操作:
" Ctrl-b % : 分割两个竖直面板
" Ctrl-b " : 分割两个水平面板
" Ctrl-b left  : 切换至左边的面板
" Ctrl-b right : 切换至右边的面板
" Ctrl-b up    : 切换至上边的面板
" Ctrl-b down  : 切换至下边的面板
" Ctrl-b x     : 关闭当前面板
" Ctrl-b q     : 显示面板编号
" Ctrl+b z     : 当前窗格全屏显示，再使用一次会变回原来大小
" Ctrl-b q n   : 切换到面板编号为n的面板
"
" 4. 窗口操作:
" Ctrl+b c     : 创建一个新窗口，状态栏会显示多个窗口的信息。
" Ctrl-b &     : 关闭当前窗口
" Ctrl+b p     : 切换到上一个窗口（按照状态栏上的顺序）。
" Ctrl+b n     : 切换到下一个窗口。
" Ctrl+b <number>: 切换到指定编号的窗口，其中的<number>是状态栏上的窗口编号。
" Ctrl+b w     : 从列表中选择窗口。
" Ctrl+b ,     : 窗口重命名。

"打开鼠标支持, 先进入命令模式，然后输入：
" : set -g mouse on
"------------------------------------------------------------------------------

"-------------------docker-----------------------------------------------------
" 常用docker命令:
"
" $docker search ubuntu              // 查找ubuntu镜像
" $docker pull ubuntu:16.04          // 下载指定版本的镜像
" $docker pull ubuntu:latest         // 下载最新版本的镜像
" $docker images [-a]                // 显示本地镜像,[-a]显示所有镜像
"
" 创建一个容器
" $docker run -it  ${REPOSITORY}:${TAG} /bin/bash
" $docker run -it -d --name xzl_ubuntu ${IMAGE ID}  /bin/bash 
" $sudo docker run --rm -it -v $HOME:$HOME  -w $HOME --name xzl_ubuntu ${IMAGE ID} /bin/bash -c "adduser --disabled-password --uid=$(id -u) --gecos '' $USER && su $USER"
" Options:
"    --interactive, -i   展示容器输入信息STDIN
"    --tty, -t	         命令行交互模式
"    --workdir, -w		 指定容器内的目录, Example: -w $HOME
"    --detach, -d		 后台运行模式，在后台执行命令相关命令
"    --user, -u		     设置用户名(format: <name|uid>[:<group|gid>])
"    -v		             将宿主机目录挂载到docker中, Example: -v $HOME:$HOME
"    --rm                容器退出时，自动将容器删除，--rm不能与-v同时使用
"    --user,-u           使用指定用户进入容器, Example: -u root 
"
" $docker exec -it ${NAMES} /bin/bash // 访问后台容器的shell
" $docker exec -it -u ${USERNAME} ${NAMES} /bin/bash // 用指定的用户后台容器的shell
" 用普通用户登陆后台容器shell
" $docker exec -it ${NAMES} /bin/bash -c "adduser --disabled-password --uid=$(id -u) --gecos '' $USER && su $USER"
"
" $docker ps [-l] [-a]                // [-a]列出所有容器,[-l]列出最近的容器
" $docker start   ${NAMES}            // 启动容器
" $docker stop    ${NAMES}            // 停止容器
" $docker restart ${NAMES}            // 重启容器
" Ctrl-p + Ctrl-q                     // 让容器在后台运行
" $docker attach  ${NAMES}            // 重新进入容器
" $docker logs -f ${NAMES}            // 查看容器日志
" // 将容器转换成镜像,转换之前先停止容器
" // -a指定用户信息；xzl_ubuntu代表容器名；zhanglongxia/ubuntu:vim指定目标镜像的用户名、仓库名和tag信息。
" $docker commit -m "ubuntu with vim" -a "zhanglongxia" xzl_ubuntu zhanglongxia/ubuntu:vim
" $docker login                            //登录https://hub.docker.com账号
" $docker push zhanglongxia/ubuntu:vim     //将镜像推送至https://hub.docker.com
" $docker run -it zhanglongxia/ubuntu:vim /bin/bash
" $docker rm ${CONTAINER ID}/${NAMES}      // 删除容器,删除之前要先停止容器
" $docker rmi [-f] ${IMAGE ID}             // 删除镜像, [-f]强制删除
"
" 从宿主机拷贝文件到container(拷贝的时候Container需要处于运行状态):
" sudo docker cp host_path ${CONTAINER ID}:container_path
"
" 从Container拷贝文件到宿主机(拷贝的时候Container需要处于运行状态):
" sudo docker cp ${CONTAINER ID}:container_path host_path
"
" 根据指定的dockerfile来创建docker
" docker build -f dockerfile .
" docker image ls
" docker run -it ${IMAGE ID} /bin/bash  // REPOSITORY 名字为none的那个IMAGE ID
"------------------------------------------------------------------------------

"-------------------vimium---------------------------------------------------
" j：向下细微滚动窗口
" k：向上细微滚动窗口
" J：下一个标签页
" K：上一个标签页
" d：向下滚动半个屏幕
" u：向上移动半个屏幕
" G：到达页面底部
" r：重新载入当前网页
" H：后退
" L：前进
" f：将当前网页上的所有可见链接/输入框分配一个快捷键，输入后就可以打开或者跳转到对应的输入框。
" F: 在新窗口中打开页面
" x：关闭当前页面
" X：恢复刚刚关闭的页面
" o：打开地址栏，在当前Tab打开网页，可以匹配历史记录、收藏夹
" O：打开地址栏，在新的Tab打开网页，可以匹配历史记录、收藏夹
" g+i：将光标 定位到输入框，如果有多个可以按Tab键切换
" g+g：回到顶部
" g+s：查看网页的源代码
"------------------------------------------------------------------------------

"-------------------plug.vim---------------------------------------------------
"plug的主要作用是安装和管理vim插件,功能和Vundle一样
"
"安装plug.vim:
"$curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

"plug.vim用法:
"PlugInstall [name ...]         : 安装插件
"PlugUpdate  [name ...]         : 安装或者更新插件
"PlugClean[!]                   : 删除没有使用的插件
"PlugUpgrade                    : 更新plug.vim自己
"PlugStatus                     : 显示插件的状态
"PlugDiff                       : 显示之前版本和将要更新版本之间差别
"PlugSnapshot[!] [output path]  : 产生一个当前已经安装了的插件的快照

"设置打开vim的时候自动安装插件
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"设置安装插件列表：
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'https://github.com/vim-scripts/minibufexpl.vim'
Plug 'https://github.com/vim-scripts/cscope.vim'
Plug 'https://github.com/vim-scripts/autoload_cscope.vim'
Plug 'https://github.com/vim-scripts/taglist.vim'
Plug 'b4n/ctags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-signify'
Plug 'Yggdroot/LeaderF'
Plug 'http://www.github.com/Yggdroot/indentLine'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'codable/diffreview'
Plug 'rhysd/vim-clang-format'

"Plug 'w0rp/ale'
call plug#end()
"------------------------------------------------------------------------------


"-------------------NERDTree---------------------------------------------------
"NEARDTree的主要作用是在vim旁边显示文件列表
"
"(1)NERDTree基本用法
"   <1> 在linux命令行界面，输入vimp
"   <2> 输入 :NERDTree ，回车
"   <3> 进入当前目录的树形界面，通过小键盘上下键，能移动选中的目录或文件
"   <4> 目录前面有+或者>号，摁Enter会展开目录，文件前面是-号，摁Enter会在右侧窗口展现该文件的内容，光标自动移到右侧文件窗口。
"   <5> ctr+w+h 光标移到左侧树形目录，ctrl+w+l光标移到右侧文件显示窗口。多次摁ctrl+w，光标自动在左右侧窗口切换
"   <6> 光标focus左侧树形窗口，摁?弹出NERDTree的帮助，再次摁？关闭帮助显示
"   <7> 输入:q回车，关闭光标所在窗口
"(2)NERDTree进阶用法
"   <1> o 打开关闭文件或者目录
"   <2> t 在标签页中打开
"   <3> T 在后台标签页中打开
"   <4> ! 执行此文件
"   <5> p 到上层目录
"   <6> P 到根目录
"   <7> K 到第一个节点
"   <8> J 到最后一个节点
"   <9> u 打开上层目录
"   <10> m 显示文件系统菜单（添加、删除、移动操作）
"   <11> ? 帮助
"   <12> q 关闭
"------------------------------------------------------------------------------


"-------------------miniBuffer-------------------------------------------------
"miniBuffer的主要作用是显示之前打开过的文件
"
"miniBuffer配置:
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapWindowNavVim = 1
"------------------------------------------------------------------------------


"-------------------cscope-----------------------------------------------------
"$cscope -Rbq  这个命令会生成三个文件：cscope.out, cscope.in.out, cscope.po.out。
"cscope.out是基本的符号索引，后两个文件是使用"-q"选项生成的，可以加快cscope的索引速度。
"
" linux 安装cscope
"$ sudo apt-get install cscope
"
"cscope命令的参数含义如下：
"-R: 在生成索引文件时，搜索子目录树中的代码
"-b: 只生成索引文件，不进入cscope的界面
"-k: 在生成索引文件时，不搜索/usr/include目录
"-q: 生成cscope.in.out和cscope.po.out文件，加快cscope的索引速度
"-i: 如果保存文件列表的文件名不是cscope.files时，需要加此选项告诉cscope到哪儿去找源文件列表。可以使用"-"，表示由标准输入获得文件列表
"-I dir: 在-I选项指出的目录中查找头文件
"-u: 扫描所有文件，重新生成交叉索引文件
"-C: 在搜索时忽略大小写
"-P path: 在以相对路径表示的文件前加上的path，这样，你不用切换到你数据库文件所在的目录也可以使用它了
"
" 生成索引文件：
":cs add cscope.out
"
" 常用命令：
":cs f s ---- 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
":cs f g ---- 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
":cs f d ---- 查找本函数调用的函数
":cs f c ---- 查找调用本函数的函数
":cs f t ---- 查找指定的字符串
":cs f e ---- 查找egrep模式，相当于egrep功能，但查找速度快多了
":cs f f ---- 查找并打开文件，类似vim的find功能
":cs f i ---- 查找包含本文件的文件
"
" 按下Ctrl + Shift + @ ,松开，然后再按下 s, 即执行cs f s 命令.
"
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>i :cs find i <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" cscope 结果输出到 quickfix窗口
set cscopequickfix=s-,c-,d-,i-,t-,e-
"------------------------------------------------------------------------------

" 有用的命令:
" Generate meta files for cscope and ctags
" Ctrl + \ + m
nmap <C-\>m :!cscope -Rqb<CR>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


"-------------------autoload_cscope--------------------------------------------
"autoload_cscope的主要作用是自动加载cscope.out文件，先从当前目录中找cscope.out，
"如果找不到继续向上层文件夹找，直到最顶层文件夹
"
"该插件也定义了一些宏和Menu，如果不用的话，打开下面这句注释即可
let g:autocscope_menus=0
"------------------------------------------------------------------------------


"-------------------quickfix---------------------------------------------------
" quickfix 是vim的一个标准插件,不需要安装。Quickfix提供一个窗口,输出可供选择的结果。

" :cw   打开quickfix窗口
" :cl   列出所有信息
" :cc   显示详细信息
" :cp   切换到上一个结果
" :cn   切换到下一个结果
" :ccl  关闭quickfix窗口
"
" Ctrl + p  切换到上一个结果
" Ctrl + n  切换到下一个结果
" Ctrl + e  关闭quickfix窗口
nmap <C-p> :cp<CR> 
nmap <C-n> :cn<CR>
nmap <C-e> :ccl<CR>
"------------------------------------------------------------------------------

"-------------------ack.vim----------------------------------------------------
" ack.vim用在在代码中搜索指定的匹配字符串，与grep的区别是，ack.vim在搜索之后会自动跳出Quickfix
" 窗口，不需要手工的打开QuickFix窗口
"
" 安装：
"     sudo apt-get install ack-grep
" 用PlugIn安装插件：
"     Plugin 'mileszs/ack.vim
" 用法:
"     Ack [options] {pattern} [{directories}]
"     Ack -nr list_append ./
"     Ack -nr list_append *.c
"------------------------------------------------------------------------------

"-------------------taglist---------------------------------------------------
"taglist的主要作用是显示当前文件中的变量和函数
"
"命令
":TlistOpen   打开taglist
":TlistClose  关闭taglist
":TlistToggle 打开或者关闭taglist
"shift + t    打开或者关闭taglist
noremap <s-t> :TlistToggle<cr>

let Tlist_Show_One_File=1       "只显示一个文件的taglist
let Tlist_Exit_OnlyWindow=1     "taglist为最后一个窗口时退出vim
let Tlist_Process_File_Always=1 "时时更新taglist
let Tlist_Use_Right_Window =1   "设置taglist在右边，默认在左边
let Tlist_WinWidth = 40         "设置taglist的宽度
"------------------------------------------------------------------------------

"-------------------clang-format-----------------------------------------------
let g:clang_format#command='clang-format-10'
let g:clang_format#detect_style_file=1
let g:clang_format#enable_fallback_style=0
"let g:clang_format#auto_format=1
let g:clang_format#auto_format=0
let g:clang_format#command='clang-format-10'
let g:clang_format#enable_fallback_style=0

"let g:clang_format#auto_format=0  // 临时关闭clang_format

"-------------------ctags------------------------------------------------------
"ctags的主要作用是提供代码自动转跳的的功能，读代码时非常方便。
"
"ctags需要手工安装：
"Mac   :
"$which ctags                             // MAC中已经安装了一个ctags，但是此ctags非彼ctags
"$brew install ctags                      // 安装ctags
"$alias ctags="`brew --prefix`/bin/ctags" // 将ctags的名字映射到我们安装的ctags上
"$alias ctags >> ~/.bashrc                // 将改名之后的ctags加入bashrc中

"Linux :
"$sudo apt-get install ctags

"ctags 用法及快捷键：
"$ctags -R          :生成tag文件默认文件名tags
"$ctags -R -f .tags :生成tag文件名为.tags，这样可以方便在gitignore中设置忽略.tags文件
"Ctrl+]             :转跳到光标当前所在函数或者变量的定义处
"Ctrl+t             :退回光标原来在的地方

"ctags配置:
set tags=tags;,./.tags;,.tags "vim在当前目录找不到tags文件时请到上层目录查找
"ctags搜索代码的时候默认转跳到第一个，如果想转跳到其它定义的地方则使用下面的配置
map <c-]> g<c-]>
"------------------------------------------------------------------------------


"-------------------vim-gutentags----------------------------------------------
"vim-gutentags的主要作用是当文件内容更改之后可以自动更新tags文件,配合ctags一起使用
"
"vim-gutentags配置:
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.vim-gutentags/cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.vim-gutentags/cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']  "ctags扫描一些c++函数声明
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']    "ctags扫描一些c函数声明

" 检测 ~/.vim-gutentags/cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
   endif
"------------------------------------------------------------------------------


"-------------------vim-signify------------------------------------------------
"vim-signify的主要作用是实时显示修改状态
"
":SignifyDiff        分屏对比显示提交前后的记录
":set signcolumn=no  关闭侧边栏显示
":set signcolumn=yes 打开侧边栏显示
"------------------------------------------------------------------------------


"-------------------LeaderF----------------------------------------------------
"LeaderF的主要作用是显示函数列表，进行模糊查找,可以代替tagbar
"
"常用命令:
"LeaderfFile     :显示当前目录下的所有文件
"LeaderfBuffer   :显示最近打开过的buffer
"LeaderfMru      :显示最近使用过的文件
"LeaderfFunction :显示当前的打开文件中所有的函数名

"快捷键:
"Shift+p  LeaderfFile
"Shift+u  LeaderfMru
"Shift+f  LeaderfFunction
"Shift+b  LeaderfBuffer

"LeaderF配置:
"快捷键设置
"Shift+p  项目目录下所有的文件
let g:Lf_ShortcutF = '<s-p>'
"Shift+u  最近使用过的文件
noremap <s-u> :LeaderfMru<cr>
"Shift+f  当前打开的文件中所有的函数
noremap <s-f> :LeaderfFunction<cr>
"Shift+b  最近使用的buffer
"noremap <s-b> :LeaderfBuffer<cr>

let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0}

let g:Lf_NormalMap = {
    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
    \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
    \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
    \ }
"------------------------------------------------------------------------------


"-------------------indentLine-------------------------------------------------
"indentLine的主要作用是显示缩进对齐线
"
"indentLine的实现是基于vim的conceal特性的，MAC自带的vim不支持该特性(可以用命令:echo has('conceal'))来
"查看vim是否支持conceal特性。如果不支持，可以用命令安装MacVim：
"$brew install macvim
"$alias vim="mvim -v"     // 将MacVim的名字映射到vim上
"$alias vim >> ~/.bashrc  // 将改名之后的vim加入bashrc中

"indentLine常用命令:
"IndentLinesReset   : 当缩进宽度改变之后，用该命令重新划线
"IndentLinesToggle  : 翻转代码缩进对齐显示
"IndentLinesEnable  : 打开代码缩进对齐显示
"IndentLinesDisable : 关闭代码缩进对齐显示

let g:indentLine_char='┆'     "设置代码缩进提示类型
let g:indentLine_enabled=0    "默认关闭代码缩进提示
"Shift+l 打开或者关闭缩进对齐显示
noremap <s-l> :IndentLinesToggle<cr>
"------------------------------------------------------------------------------


"-------------------Vundle-------------------------------------------------
"Vundle的主要作用是安装和管理vim插件，功能跟plug相同，但是稍微复杂点，推荐使用plug安装管理插件
"
"Vundle安装：
"(1)下载程序
"$git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"(2)设置vimrc
set nocompatible              " required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
"Bundle 'Valloric/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required

"(3)更新插件
"重新打开vim，输入PluginInstall，安装所有插件

"vundle用法:
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` toauto-approve removal
"------------------------------------------------------------------------------


"-------------------YouCompleteMe----------------------------------------------
"YouCompleteMe主要作用是提供代码自动补全的功能
"
"(1) 如果在Mac下安装，Mac自带的vim是不能用这个插件的，如果要用这个插件需要在Mac上安装macvim，按如下步骤安装macvim:
"$brew install macvim
"$alias vim="mvim -v"     // 将MacVim的名字映射到vim上
"$alias vim >> ~/.bashrc  // 将改名之后的vim加入bashrc中,用macvim替换Mac自带的vim

"(2) 安装CMake，用来编译YouCompleteMe
" Mac：
"$brew install CMake
" Linux：
"$sudo apt-get install cmake
"$sudo apt-get install clang
"
"(3) 利用plug将YouCompleteMe的代码下载下来
"   Plug 'Valloric/YouCompleteMe'
"   或者直接从github上面下载YCM的代码
"   cd ~/.vim/plugged
"   git clone git@github.com:ycm-core/YouCompleteMe.git
"   git submodule update --init --recursive
"
"(4) 编译YouCompleteMe
" $ cd ~/.vim/bundle/YouCompleteMe
" $./install.py --clang-completer
"
" (5) YCM安装完毕之后还不能代码补全，需要配置.ycm_extra_conf.py.可以直接使用YCM自带的.ycm_extra_conf.py文件.
" 用下面的命令指定.ycm_extra_conf.py路径即可。
" 如果时用plug安装:
"let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
" 如果使用bundle安装:
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'

let g:ycm_confirm_extra_conf=0  "关闭加载.ycm_extra_conf.py提示
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口

"关闭语法检查功能.如果不关闭会出现很多头文件找不到的错误提示,如果不怕麻烦可以改一下ycm_extra_conf.py中的flag配置
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 0 
let g:ycm_enable_diagnostic_highlighting = 0

"YCM除了提供了基本的补全功能,自动提示错误的功能外,还提供了类似tags的功能：
":GoToDefinition                  跳转到定义
":GoToDeclaration                 跳转到声明
":GoToDefinitionElseDeclaration   以及两者的合体
"nnoremap <c-l> :YcmCompleter GoToDeclaration<CR>
"nnoremap <c-i> :YcmCompleter GoToDefinition<CR>
"nnoremap <c-o> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"------------------------------------------------------------------------------


"-------------------vim-fugitive-----------------------------------------------
" diffreview依赖该插件
"------------------------------------------------------------------------------

"-------------------diffreview-------------------------------------------------
"diffreview的主要功能是显示更改后的文件和master上的文件之间的差异
"
":Greview master  比较当前文件和master上的文件之间的差异
":Greview         比较当前文件和当前分支上已经提交的文件差异，与gitdiff功能类似
"]q               切换到下一个文件
"[q               切换到上一个文件
"cw               退出Greview模式
"------------------------------------------------------------------------------

set errorformat+=%f:%l:%m

" Note that this function will lint the current SAVED version of the file.
function! s:GCppLint()
  " For some reason, I have to put this suffix into a variable, rather than
  " including it right in the system() call.
  let mysuffix = ' 2>&1 | egrep :.*:'
  cexpr system('cpplint.py ' . expand('%') . mysuffix)
endfunction
au BufNewFile,BufRead *.cc command! Lint :call s:GCppLint()
au BufNewFile,BufRead *.h command! Lint :call s:GCppLint()

" Note that this function will lint the current SAVED version of the file.
function! s:GPyLint()
  let mysuffix = ' 2>&1 | egrep :.*:'
  let a:lint = 'gpylint '
      \. '--output-format=parseable --include-ids=y'
  cexpr system(a:lint . ' ' . expand('%') . mysuffix)
endfunction
au FileType python command! Lint :call s:GPyLint()

" Convenient keybinding for linting the current file.
map <C-l> :Lint

