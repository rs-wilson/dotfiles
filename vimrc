" vim basic setup
set nocompatible              
filetype off                  

" Set statusbar preferences
set laststatus=2
set ruler

" Turn on line Numbers
set number

" Set this so themes load properly, especially with tmux
if $TERM == "xterm-256color"
  set t_Co=256
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

" Jedi (Python)
Plugin 'davidhalter/jedi-vim'

" Markdown highlighting
Bundle 'gabrielelana/vim-markdown'

" Allow ag to work in vim
Plugin 'mileszs/ack.vim'

" Protobuf highlighting"
Bundle 'uarun/vim-protobuf'

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

" NERDTree Toggle
map <leader>n :NERDTreeToggle <Esc>

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag to search in vim
  let g:ackprg = 'ag --vimgrep'
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

" Disable auto-doc showing in jedi
autocmd FileType python setlocal completeopt-=preview
" Just kidding lets just disable it completely for everything
set completeopt-=preview

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
