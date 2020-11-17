if has('nvim')
	let g:powerline_loaded = 1
endif

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif   " Note: Skip initialization for vim-tiny or vim-small.

if 0
	|
endif

if &compatible
	set nocompatible               " Be iMproved
endif


set viewoptions=cursor,folds,slash,unix

set expandtab
set shiftwidth=2
set softtabstop=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
set undodir=$HOME/.local/share/nvim/undodir//
set undofile

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
let mapleader = "\<Space>"
let maplocalleader = ","
set noea

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
let g:easytags_include_members = 1
let g:netrw_browsex_viewer = "xdg-open"
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))  " Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
"NeoBundle 'tpope/vim-projectionist'
NeoBundle 'zhimsel/vim-stay'
" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'lifepillar/vim-solarized8'
NeoBundle 'arcticicestudio/nord-vim'
NeoBundle 'tibabit/vim-templates'
NeoBundle 'preservim/nerdtree'
NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'shumphfrey/fugitive-gitlab.vim'
let g:fugitive_gitlab_domains = ['http://git.damavan04.dmv']
let g:gitlab_api_keys = {'git.damavan04.dmv': 'TEvHHm_yKPFNm7xxxDyC'} 
let g:fugitive_dynamic_colors=0
let g:fugitive_git_executable='git'
"NeoBundle 'junegunn/gv.vim'
NeoBundle 'rbong/vim-flog'
let g:flog_default_arguments = { 'format': '%ai [%h] {%an}%d %s' }
"NeoBundle 'valloric/youcompleteme'

NeoBundle 'vim-scripts/a.vim'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'xolox/vim-misc'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'vhdirk/vim-cmake'
NeoBundle 'skywind3000/asyncrun.vim'
NeoBundle 'tpope/vim-dispatch'
"NeoBundle 'rdnetto/YCM-Generator'
"NeoBundle 'jceb/vim-orgmode'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
""" Markdown Previewer
NeoBundle 'godlygeek/tabular'
NeoBundle 'conornewton/vim-pandoc-markdown-preview'
NeoBundle 'plasticboy/vim-markdown'
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_math = 1
let g:md_pdf_viewer="zathura"
let g:md_args = "--data-dir ~/.config/pandoc"
"""Goyo (Document editing mostly)
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'junegunn/limelight.vim'
let g:limelight_conceal_guifg = '#4c566A'
let g:goyo_width = 81
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

NeoBundle 'vimwiki/vimwiki'
NeoBundle 'tbabej/taskwiki'
let g:vimwiki_global_ext = 0
let g:vimwiki_folding='custom'
let g:taskwiki_dont_preserve_folds="yes" 

""" IndentLine configuration
NeoBundle 'Yggdroot/indentLine'
let g:indentLine_char = ''
let g:indentLine_fileTypeExclude = [
\  'json',
\  'markdown',
\  'yaml',
\  'startify',
\  'tagbar']
let g:indentLine_concealcursor = 'nc'

"let g:indentLine_setColors = 0


if !has('nvim')
	NeoBundle 'jeaye/color_coded'
else
        let $VISUAL="nvr -cc split --remote-wait +'setlocal bufhidden=wipe'"
	"NeoBundle 'arakashic/chromatica.nvim'
	NeoBundle 'jackguo380/vim-lsp-cxx-highlight'
	NeoBundle 'neoclide/coc.nvim', 'release', { 'build': { 'others': 'git checkout release' } }

	""" Vim Airline
	NeoBundle 'vim-airline/vim-airline'
	NeoBundle 'vim-airline/vim-airline-themes'
	let g:airline_left_sep=''
	let g:airline_right_sep=''
	let g:airline_left_alt_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_inactive_collapse=0
	let g:airline_skip_empty_sections = 1
	let airline#extensions#coc#error_symbol = ':'
	let airline#extensions#coc#warning_symbol = ':'
	let g:airline#extensions#whitespace#enabled = 0

	NeoBundle 'kevinhwang91/rnvimr'
	""" Debugger gdb
	NeoBundle 'puremourning/vimspector'
	sign define vimspectorBP text= texthl=SpellBad
	sign define vimspectorBPDisabled text= texthl=SpellBad
	sign define vimspectorPC text= texthl=Function
endif
NeoBundle 'jiangmiao/auto-pairs'

""" Vim Startify
NeoBundle 'mhinz/vim-startify'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Recent Files']            },
          \ { 'type': 'dir',       'header': ['   Recent Files of '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
let g:startify_session_dir = '$HOME/.local/share/nvim/sessions'
let g:startify_session_before_save = [
        \ 'echo "Cleaning up before saving.."',
        \ 'silent! tabdo NERDTreeClose',
	\ 'silent! tabdo TagbarClose',
	\ 'silent! tabdo cclose',
	\ 'silent! tabdo lclose',
        \ ]
let g:startify_session_savevars = [
        \ 'g:startify_session_savevars',
        \ 'g:startify_session_savecmds',
	\ 'g:cmake_usr_args',
	\ 'g:cmake_build_type'
        \ ]
let g:startify_session_persistence = 1
let g:startify_session_sort = 1

NeoBundle 'ryanoasis/vim-devicons'
let g:DevIconsEnableFoldersOpenClose = 1

call neobundle#end()
" Required:
filetype plugin indent on
syntax on
set hidden

set number
set relativenumber
set mouse=a
set nocursorline
set clipboard=unnamedplus
set scrolloff=5
set splitbelow
set splitright
set ignorecase
set smartcase
set sessionoptions-=blank
set sessionoptions-=buffers

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

set t_Co=256
set background=dark
set completeopt=menuone
"let g:solarized_use16 = 1
let g:cmake_export_compile_commands = 1
let g:cmake_ycm_symlinks = 1
"initialisation des variable souvent utilisée de CMAKE
let g:cmake_usr_args = ""
let g:cmake_build_type= ""
set makeprg=make\ -C\ ./build
let g:easytags_async = 1
let g:easytags_auto_highlight = 0
let g:nord_italic = 1
let g:nord_italic_comments = 1
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

let g:nord_cursor_line_number_background = 1
let g:vim_markdown_new_list_item_indent = 2
colorscheme nord
hi LineNr guibg=NONE
hi Normal guibg=NONE
hi SignColumn guibg=NONE
hi CursorLineNr guibg=NONE

nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F2> :TagbarToggle<CR>
nnoremap <F4> :A<CR>
nmap <C-LeftMouse> <Plug>(coc-definition) 
nmap <leader>r <Plug>(coc-references)
nmap <leader>g <Plug>(coc-definition)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>cs :noh<CR>
nnoremap <leader>tn :tabnew
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>tc :tabc<CR>
nnoremap <leader>cn :cn<CR>
nnoremap <leader>cp :cp<CR>
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)
nmap <silent> <leader>tw <Plug>(coc-cursors-word)
nmap <silent> <leader>tr  <Plug>(coc-cursors-operator)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
"Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open'<CR>

" navigate chunks of current buffer as fugitive does
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap <leader>gs <Plug>(coc-git-chunkinfo)

inoremap  ii <ESC>
vnoremap  ii <ESC>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-Down>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-Up>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


augroup mygroup
  autocmd!
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" AutoCommand used for always having the quickfix/location list in fullwidth
" bottom side of Vim

if has('nvim')
	tnoremap ii <C-\><C-n>
	au TermOpen * setlocal nonumber conceallevel=0 norelativenumber nocursorline signcolumn=no
	au TermOpen * startinsert
	let g:python3_host_prog = '/usr/bin/python3.8'
	let g:chromatica#libclang_path = "/usr/lib/llvm-6.0/lib"
	let g:chromatica#enable_at_startup=1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_theme='nord'
	"let g:airline_solarized_bg='dark'
	let g:airline_powerline_fonts = 1
endif


function! SynStack ()
	for i1 in synstack(line("."), col("."))
		let i2 = synIDtrans(i1)
		let n1 = synIDattr(i1, "name")
		let n2 = synIDattr(i2, "name")
		echo n1 "->" n2
	endfor
endfunction
map gm :call SynStack()<CR>

set concealcursor=nc
au Filetype markdown setlocal nofoldenable
au Filetype floggraph setlocal ea
au BufEnter *.md setlocal conceallevel=2
