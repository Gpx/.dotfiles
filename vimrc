set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" CTRL-P
Plugin 'kien/ctrlp.vim'

" NERD tree
Plugin 'scrooloose/nerdtree'

" CoffeeScript support
Plugin 'kchmck/vim-coffee-script'

" Solarized Colorscheme
Plugin 'altercation/vim-colors-solarized'

" Trailing whitespaces
Plugin 'ntpeters/vim-better-whitespace'

" RABL support
Plugin 'yaymukund/vim-rabl'

" git diff in the gutter
Plugin 'airblade/vim-gitgutter'

" SuperTab
Plugin 'ervandew/supertab'

" EasyMotion
Plugin 'Lokaltog/vim-easymotion'

" Rename current file
Plugin 'danro/rename.vim'

" Fugitive - git in vim
Plugin 'tpope/vim-fugitive'

" Vim plugin for intensely orgasmic commenting
Plugin 'scrooloose/nerdcommenter'

" Lean & mean status/tabline for vim that's light as air
Plugin 'bling/vim-airline'

" Simple tmux statusline generator
Plugin 'edkolev/tmuxline.vim'

" Simple shell prompt generator
Plugin 'edkolev/promptline.vim'

" True Sublime Text style multiple selections for Vim
Plugin 'terryma/vim-multiple-cursors'

" Vim plugin to visualize your Vim undo tree.
Plugin 'sjl/gundo.vim'

" Vastly improved Javascript indentation and syntax support in Vim
Plugin 'pangloss/vim-javascript'

" Seamless navigation between tmux panes and vim splits
Plugin 'christoomey/vim-tmux-navigator'

" Vim script for text filtering and alignment
Plugin 'godlygeek/tabular'

" mustache and handlebars mode for vim http://mustache.github.io
Plugin 'mustache/vim-mustache-handlebars'

" Use CTRL-A/CTRL-X to increment dates, times, and more
Plugin 'tpope/vim-speeddating'

" All 256 xterm colors with their RGB equivalents, right in Vim!
Plugin 'guns/xterm-color-table.vim'

" Syntax checking hacks for vim
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let mapleader="," " Leader is comma

syntax enable " Pretty obvious
let g:solarized_termcolors = 256 " Enable 256 colors support for solarized
set background=dark " Use solarized dark theme
colorscheme solarized " Use solarized theme
let g:airline_powerline_fonts = 1 " Use powerline fonts (eg an arrow instead of >)
let g:airline_theme = "light" " Use light them for airline
set cursorline " Highlight current line
set timeoutlen=50 " Reduce wait for keycode -> faster Esc
set laststatus=2 " Always display the status line
set textwidth=80
set colorcolumn=+1 " Highlight column 81
highlight ColorColumn ctermbg=red " Highlight color is red

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop', 'mri']

" Soft tabs of 4 characters
set expandtab " Tabs are spaces
set tabstop=2 " A tab is 2 spaces
set softtabstop=2 " When pressing tab use 2 spaces instead
set shiftwidth=2 " Indenting by 2 spaces (eg when using >>)

" Those two commands enable an hybrid mode
set relativenumber " Show relative line numbers
set number " Show line numbers
set numberwidth=5 " Number lane is 5 char width

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Tab-complete for Ex Commands
set wildmenu
set wildmode=full

set ruler " Display row, col number

set encoding=utf-8 " Set default encoding to UTF-8

set nowrap " Don't wrap lines

set backspace=indent,eol,start " Backspace through everything in insert mode

" List chars
set listchars=""
" Display tab as "  "
set listchars=tab:\ \
" Display trailing spaces ad dots
set listchars+=trail:.
" Display > and < for lines out of the screen
set listchars+=extends:>
set listchars+=precedes:<

" Searching
set incsearch  " incremental search
set ignorecase " search is case insensitive...
set smartcase  " ...unless there's a capital letter
nmap <Leader><Space> :nohlsearch<Bar>:echo<CR>
" Use EasyMotion to search
map f <Plug>(easymotion-s)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1

" Center current line with <space>
nmap <space> zz

" Enable spell check
set nospell
nmap s :set spell!<CR>

" Move to beginning/end of line with B/E
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Wild settings

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Backup and swap files
set noswapfile
set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.

" gitgutter update time
let g:gitgutter_realtime = 750
let g:gitgutter_eager = 750

" Open diff horizontal
set diffopt+=vertical

" Run RSpec
map <c-o> :call RunCurrentTest()<CR>
map <c-i> :call RunCurrentLineInTest()<CR>

"" ============================
"" Rspec w/zeus - Thanks B. Orenstein
"" ============================
function! RunCurrentTest()
  let g:spec_directory = expand('%:p:h')
  let g:in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1

  if g:in_test_file
    call SetTestFile()
    call ChangeDirectory(b:rails_root)
    call SetTestRunner("!zeus rspec --format doc ")
    exec g:bjo_test_runner g:bjo_test_file
    call ChangeDirectory(g:spec_directory)
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let g:spec_directory = expand('%:p:h')
  let g:in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if g:in_test_file
    call SetTestFileWithLine()
    call ChangeDirectory(b:rails_root)
    let g:cmd = "!FULL=1 zeus rspec --format doc " . g:bjo_test_file . ":" . g:bjo_test_file_line
    echo g:cmd
    exec g:cmd
    call ChangeDirectory(g:spec_directory)
  end
endfunction

function! SetTestFile()
  let g:bjo_test_file=expand('%:p')
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=expand('%:p')
  let g:bjo_test_file_line=line(".")
endfunction

function! ChangeDirectory(directory)
  exec "cd " . a:directory
endfunction

function! OpenURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction

"" ============================
"" Code Folding
"" ============================
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

"" ============================
"" Cache Files in CTRL-P using git ls-files
"" ============================
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

"" ============================
"" Gundo
"" ============================
nnoremap <leader>u :GundoToggle<CR> " Toggle Gundo

" Save session
nnoremap <leader>s :mksession<CR>
