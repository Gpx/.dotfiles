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
Plugin 'vim-airline/vim-airline-themes'

" Simple shell prompt generator
" Plugin 'edkolev/promptline.vim'

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

" A dummy text generator
Plugin 'loremipsum'

" React JSX syntax highlighting and indenting for vim.
Plugin 'mxw/vim-jsx'

" Vim plugin for the Elm programming language
Plugin 'lambdatoast/elm.vim'

" Elixir syntax highlighting and indenting for vim.
Plugin 'elixir-lang/vim-elixir'

" Vim configuration for Rust.
Plugin 'rust-lang/rust.vim'

" one colorscheme pack to rule them all!
Plugin 'flazz/vim-colorschemes'

" A better JSON for Vim
Plugin 'elzr/vim-json'

" Vim syntax and indent files for web components
Plugin 'azakus/vim-webcomponents'

" Vim syntax and language settings for RAML
Plugin 'in3d/vim-raml'

" A Vim plugin for writing JSON with JSON Schema
Plugin 'quramy/vison'

" A vim plugin for highlighting and indenting JST/EJS syntax
Plugin 'briancollins/vim-jst'

" Vim bundle for http://styled-components.com based javascript files.
Plugin 'fleischie/vim-styled-components'

" A (Neo)vim plugin for formatting code.
Plugin 'sbdchd/neoformat'

" Typescript Syntax for Vim
Plugin 'leafgarland/typescript-vim'

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
colorscheme Green " Somehow needed to reset the colorcheme
colorscheme gruvbox " Use gruvbox theme
set nocursorline " Don't highlight current line
set timeoutlen=50 " Reduce wait for keycode -> faster Esc
set laststatus=2 " Always display the status line
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

" Print formatted code one a single page
set printoptions=paper:A4,syntax:y,wrap:y,duplex:off

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_tidy_quiet_messages = { "level" : "warnings" }

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

" Set filetype to markdown when opening a .md file
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Spell check
" Commands:
"   zg -> add word to spell file
"   z= -> word suggestions
set nospell " Disabled by default
" Enable with s
nmap s :set spell!<CR>

"Automatic spellcheck markdown files
autocmd FileType markdown setlocal spell

"Spellcheck git commits
autocmd FileType gitcommit setlocal spell

" Define location for spellfile
" You can add words to this file with `zg`
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spellcheck is on
set complete+=kspell


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

" JSX syntax
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Run autoformat on save
let g:neoformat_javascript_prettier = {
  \ 'exe': 'node_modules/.bin/prettier',
  \ 'args': ['--stdin', '--parser=flow'],
  \ 'stdin': 1,
  \ }
let g:neoformat_enabled_javascript = ['prettier']
augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END
