" vim basic setup
set nocompatible              
filetype off                  

 "Reload files changed outside vim
set autoread 

" Set statusbar preferences
set laststatus=2
set ruler

" Turn on line Numbers
set number

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Set this so themes load properly, especially with tmux
if $TERM == "xterm-256color" || has("gui_running")
  set t_Co=256
endif

" Set vertical bar as cursor in insert mode
if exists('$TMUX')
  let &t_SI = "\<esc>Ptmux;\<esc>\<esc>]50;CursorShape=1\x7\<esc>\\"
  let &t_EI = "\<esc>Ptmux;\<esc>\<esc>]50;CursorShape=0\x7\<esc>\\"
else
  let &t_SI = "\<esc>]50;CursorShape=1\x7"
  let &t_EI = "\<esc>]50;CursorShape=0\x7"
endif

" Our color theme with syntax highlighting turned on
colo spacegray
syntax on
let g:spacegray_underline_search = 1
let g:spacegray_use_italics = 1
let g:spacegray_use_dark = 1

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Add vim-ruby
Plugin 'vim-ruby/vim-ruby'

" Add vim-go
Plugin 'fatih/vim-go'

" Add nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Vim Gutter
Plugin 'airblade/vim-gitgutter'

" Light Line
Plugin 'itchyny/lightline.vim'

" Markdown highlighting
Bundle 'gabrielelana/vim-markdown'

" Allow ag to work in vim
Plugin 'mileszs/ack.vim'

" Protobuf highlighting"
Bundle 'uarun/vim-protobuf'

" Linter manager
Plugin 'dense-analysis/ale'

" Highlight brackets with different colors
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1

" Status bar blame
Plugin 'zivyangll/git-blame.vim'
nnoremap <leader>b :<C-u>call gitblame#echo()<CR>

" Clang-format stuff like protofiles
Plugin 'rhysd/vim-clang-format'
" example :ClangFormat

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

" Go Autocomplete
setlocal omnifunc=go#complete#Complete

" Ignore case when searching
:set ignorecase
:set smartcase

" Make backspace work as normal
set backspace=indent,eol,start

" NERDTree settings
map <leader>n :NERDTreeToggle <Esc>
let NERDTreeQuitOnOpen = 0
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" force nerdtree as a window so it keeps open when using vim .
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p

" close nerdtree if its the only thing open
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" disable allow preview popups
set completeopt-=preview

" Use Ag over Grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ackprg = 'ag --vimgrep' "Use ag to search in vim
endif

" Fuzzy Open File
set rtp+=~/.fzf
nnoremap <leader>f :FZF<CR>
nnoremap <leader>F :Ack! '<c-r><c-w>'<CR>
nnoremap F :Ack! ''<LEFT>

" Easier nav buttons
noremap L w
noremap H b
noremap K {
noremap J }

" Shortcut for wrapping something in quotes
noremap <leader>" ciw""<Esc>P
noremap <leader>' ciw''<Esc>P

" Prevent vim from cutting everything
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

" Make vim able to cut with <leader>
nnoremap <leader>x ""x
nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

" Disable K mapping from vim-go
let g:go_doc_keywordprg_enabled = 0

" Disable K mapping from jedi
let g:jedi#documentation_command = "-"

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Make vim follow the middle of the screen
set noshowmode
set scrolloff=999

" Make fun colors for the vim line at the bottom
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
      \ }
      \ }

" Tabs to spaces
set expandtab

" Enable go syntax highlighting
helptags ~/.vim/bundle/vim-go/doc
let g:go_fmt_command = "goimports"
let g:go_highlight_function_parameters = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
au BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl

" Explicitly use gopls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Make ctrl space the autocomplete popup hotkey
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>

" Make f search
noremap f /

" Map the go compile check to a hotkey
nnoremap gv :GoVet<CR>
nnoremap gr :GoRef<CR>
nnoremap gb :GoBuild<CR>

" Make us more compact
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smartindent
set smarttab

" Ale linter settings
nmap <silent> <c-9> <Plug>(ale_next_previous)
nmap <silent> <c-0> <Plug>(ale_next_wrap)
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
