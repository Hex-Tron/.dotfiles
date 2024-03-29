set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'frazrepo/vim-rainbow'
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
" Put your non-Plugin stuff after this lin

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"-----------------------------------------------------------------------------
let g:airline_theme                      = 'random'
let g:airline#extensions#tabline#enabled = 1

" air-line
let g:airline_powerline_fonts            = 1

if !exists('g:airline_symbols')
    let g:airline_symbols                = {}
endif

" unicode symbols
let g:airline_left_sep                   = '»'
let g:airline_left_sep                   = '▶'
let g:airline_right_sep                  = '«'
let g:airline_right_sep                  = '◀'
let g:airline_symbols.linenr             = '␊'
let g:airline_symbols.linenr             = '␤'
let g:airline_symbols.linenr             = '¶'
let g:airline_symbols.branch             = '⎇'
let g:airline_symbols.paste              = 'ρ'
let g:airline_symbols.paste              = 'Þ'
let g:airline_symbols.paste              = '∥'
"let g:airline_symbols.whitespace         = 'Ξ'
let g:airline_symbols.whitespace         = ''

let g:airline_left_sep                   = ''
let g:airline_left_alt_sep               = '\\'
let g:airline_right_sep                  = ''
let g:airline_right_alt_sep              = '//'
let g:airline_symbols.branch             = ''
let g:airline_symbols.readonly           = ''
let g:airline_symbols.linenr             = ''


"-----------------------------------------------------------------------------





Plugin 'megantiu/true.vim'
" enable 24bit true color
 if (has("termguicolors"))
   set termguicolors
 endif

 " enable the theme
 syntax enable
 colorscheme true

"-----------------------------------------------------------------------------
"Plug
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Plug 'francoiscabrol/ranger.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Initialize plugin system
call plug#end()

"------------------------------------------------------------------------------
"easy align
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"------------------------------------------------------------------------------
set hlsearch


"------------------------------------------------------------------------------
"fzf
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_preview_window = []

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

"# preview file with the command 

" command! -bang -nargs=? -complete=dir Files  call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)

"# Hide status line when initilize

autocmd! FileType fzf set laststatus=0 noshowmode noruler | autocmd BufLeave <buffer> set laststatus=2 showmode ruler

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)


nmap <leader><tab> :Files<CR>


"------------------------------------------------------------------------------
function Myfunc(myarg1, myarg2)
     execute ':let &colorcolumn=join(range(' . a:myarg1 . ',' . a:myarg2 . '),",")'
endfunction


com -nargs=* HilightColumn call Myfunc(<f-args>)


"------------------------------------------------------------------------------
"color bracket :
let g:rainbow_active = 1


"------------------------------------------------------------------------------
"csv plugin

Plugin 'mechatroner/rainbow_csv'


"------------------------------------------------------------------------------
"nnn config

" Set custom mappings
"#nnoremap <silent> <leader>r :Ranger<CR>
