if has('nvim')
	let g:powerline_loaded = 1
endif

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif   " Note: Skip initialization for vim-tiny or vim-small.

if &compatible
	set nocompatible               " Be iMproved
endif


set viewoptions=cursor,folds,slash,unix

set expandtab
set shiftwidth=2
set softtabstop=2
set ww=<,>,[,],b,h,l
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
set undodir=$HOME/.local/share/nvim/undodir//
set undofile
set breakindent

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
let mapleader = "\<Space>"
let maplocalleader = ","
set noea

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
let g:netrw_browsex_viewer = "xdg-open"
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))  " Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
"NeoBundle 'tpope/vim-projectionist'
NeoBundle 'zhimsel/vim-stay'
NeoBundle 'akinsho/bufferline.nvim'
" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
"NeoBundle 'lifepillar/vim-solarized8'
NeoBundle 'lambdalisue/suda.vim'
let g:suda_smart_edit = 1

let g:nord_uniform_diff_background = 1
NeoBundle 'tibabit/vim-templates'
let g:tmpl_search_paths = ['~/.vim/templates']
NeoBundle 'preservim/nerdtree'
NeoBundle 'kyazdani42/nvim-web-devicons'
NeoBundle 'honza/vim-snippets'
NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'shumphfrey/fugitive-gitlab.vim'
let g:fugitive_git_executable='git'
"NeoBundle 'junegunn/gv.vim'
NeoBundle 'rbong/vim-flog'
let g:flog_default_arguments = { 'format': '%ai [%h] {%an}%d %s' }
"NeoBundle 'valloric/youcompleteme'


NeoBundle 'hkupty/iron.nvim'

NeoBundle 'vim-scripts/a.vim'
NeoBundle 'xolox/vim-misc'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'vhdirk/vim-cmake'
"vim-cmake dependencie
NeoBundle 'skywind3000/asyncrun.vim'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'rcarriga/nvim-notify'
"NeoBundle 'rdnetto/YCM-Generator'
"NeoBundle 'jceb/vim-orgmode'
NeoBundle 'tpope/vim-surround'
NeoBundle 'dhruvasagar/vim-table-mode'
let g:table_mode_syntax = 0
NeoBundle 'tpope/vim-repeat'
""" Markdown Previewer
NeoBundle 'godlygeek/tabular'
"NeoBundle 'conornewton/vim-pandoc-markdown-preview'
NeoBundle 'vim-pandoc/vim-pandoc-syntax'
NeoBundle 'vim-pandoc/vim-pandoc'
"NeoBundle 'plasticboy/vim-markdown'
let g:vim_markdown_frontmatter = 1
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#folding#fdc = 0
let g:pandoc#spell#enabled = 0
let g:vim_markdown_math = 1
let g:md_pdf_viewer="zathura"
let g:md_args = "--data-dir ~/.config/pandoc"

NeoBundle 'lervag/vimtex'
let g:vimtex_fold_enabled=1

let g:vimtex_quickfix_open_on_warning=0

let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : 'build'
    \ }
let g:vimtex_toc_config = {
    \ 'split_pos' : ':vert botright'
    \ }


let g:vimtex_view_method = 'zathura'

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

NeoBundle 'fannheyward/telescope-coc.nvim'
"Désactivé pour l'instant si pas de besoin + il faudrait désactiver sa source
"via coc-snippets et activer coc-ultisnips
"NeoBundle 'SirVer/ultisnips'
"NeoBundle 'fhill2/telescope-ultisnips.nvim'
NeoBundle 'vimwiki/vimwiki'
NeoBundle 'folke/which-key.nvim'
NeoBundle 'nvim-lua/plenary.nvim'
NeoBundle 'nvim-telescope/telescope.nvim'
NeoBundle 'tbabej/taskwiki'
let g:vimwiki_global_ext = 0
let g:vimwiki_folding='custom'
let g:taskwiki_dont_preserve_folds="yes" 

""" IndentLine configuration
NeoBundle 'lukas-reineke/indent-blankline.nvim'
"NeoBundle 'Yggdroot/indentLine'
let g:indentLine_char = '│'
let g:indentLine_fileTypeExclude = [
\  'json',
\  'markdown',
\  'tex',
\  'pandoc',
\  'yaml',
\  'startify',
\  'tagbar',
\  'coctree',
\  'nerdtree']
let g:indent_blankline_buftype_exclude = ["terminal", "help"]
let g:indent_blankline_show_trailing_blankline_indent = v:false

let $VISUAL="nvr -cc split --remote-wait +'setlocal bufhidden=wipe'"
"NeoBundle 'arakashic/chromatica.nvim'
"TODO A ENLEVER -> NE MARCHE PLUS BATARD
NeoBundle 'jackguo380/vim-lsp-cxx-highlight'
NeoBundle 'neoclide/coc.nvim', 'release', { 'build': { 'others': 'git checkout release' } }
let g:coc_default_semantic_highlight_groups = 1

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
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_splits = 0
"""""""""
"A TESTER
"""""""""
"let g:airline#extensions#hunks#coc_git = 1 
let g:airline#extensions#tabline#ignore_bufadd_pat = '!|defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'

NeoBundle 'kevinhwang91/rnvimr'
NeoBundle 'mbbill/undotree'
""" Debugger gdb
NeoBundle 'puremourning/vimspector'
sign define vimspectorBP text= texthl=SpellBad
sign define vimspectorBPDisabled text= texthl=SpellBad
sign define vimspectorPC text= texthl=Function
let g:vimspector_sign_priority = {
      \    'vimspectorBP':         20,
      \    'vimspectorBPCond':     20,
      \    'vimspectorBPLog':      20,
      \    'vimspectorBPDisabled': 20,
      \    'vimspectorPC':         999,
      \ }
'}
" NeoBundle 'jiangmiao/auto-pairs'

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
        \ 'g:startify_session_saveicmds',
        \ 'g:cmake_usr_args',
        \ 'g:cmake_build_type'
        \ ]
let g:startify_session_persistence = 1
let g:startify_session_sort = 1
let g:startify_fortune_use_unicode = 1

NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'arcticicestudio/nord-vim'
NeoBundle 'da-h/AirLatex.vim'
" your login-name
let g:AirLatexUsername="cookies"

" optional: set server name
let g:AirLatexDomain="www.overleaf.com"

let g:DevIconsEnableFoldersOpenClose = 1

call neobundle#end()
"
" Required:
filetype plugin indent on
syntax on
set hidden

set number
set relativenumber
set mouse=a
set nocursorline
set timeoutlen=400
set clipboard=unnamedplus
set scrolloff=5
set sidescroll=5
set listchars=extends:↪,precedes:↩
set fillchars=vert:▕,foldopen:▾,foldclose:▸
set showbreak=↪\ 
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
let g:nord_italic = 1
let g:nord_italic_comments = 1
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

let g:nord_cursor_line_number_background = 1
let g:vim_markdown_new_list_item_indent = 2
" Custom Highlights -> I have to take nord color variable to ease up
colorscheme nord_mine

lua << EOF
local iron = require("iron.core")

iron.setup {
  config = {
  -- If iron should expose `<plug>(...)` mappings for the plugins
    should_map_plug = false,
  -- Whether a repl should be discarded or not
    scratch_repl = true,
  -- Your repl definitions come here
    repl_definition = {
      sh = {
        command = {"zsh"}
      },
    python = require("iron.fts.python").ipython
    },
    repl_open_cmd = require('iron.view').right(80),
    -- how the REPL window will be opened, the default is opening
    -- a float window of height 40 at the bottom.
  },
-- Iron doesn't set keymaps by default anymore. Set them here
-- or use `should_map_plug = true` and map from you vim files
  keymaps = {
    send_motion = "<space>sc",
    visual_send = "<space>sc",
    send_line = "<space>sl",
    send_mark = "<space>s.",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>scc",
  }
}

vim.notify = require("notify")
require("telescope").setup()
require("telescope").load_extension('coc')
--require('telescope').load_extension('ultisnips')
require("bufferline").setup{
  highlights = {
    fill = {
      guibg = '#191c23',
    },
    background ={
      guibg = '#222730',
       },
    buffer_visible ={
      guibg = '#2E3440',
       },
     separator_visible ={
guifg = '#191c23',
        guibg = '#2E3440'
        },
     separator_selected ={
guifg = '#191c23',
        guibg = '#2E3440'
        },
      close_button_visible = {
           guibg = "#2E3440"
           },
     separator ={
        guifg = '#191c23',
        guibg = '#222730'
        },
      close_button = {
           guibg = "#222730"
           }

  },
options={
    separator_style = "slant",
    diagnostics = false,
    enforce_regular_tabs = true,
    offsets = {
      {
        filetype = "nerdtree",
        text = "File Explorer", 
        text_align = "center", 
        highlight="Number",
        padding = 1},
        {
          filetype = 'undotree',
          text = 'Undotree',
          highlight = 'Number',
          padding = 1,
        },
        {
          filetype = 'vimspectorVariable',
          text = 'Vimspector',
          highlight = 'Number',
          padding = 1,
        },
        {
          filetype = 'vimspectorTerm',
          text = 'Output term',
          highlight = 'Number',
        },
        {
          filetype = 'coctree',
          text = 'Outline',
          highlight = 'Number',
        
        }
        }
  }
}
require("which-key").setup {
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k", "i", "<leader>" },
    v = { "j", "k" },
  },
  operators = {
   [" a"] = "Code Actions",
   [" f"] = "Format (coc)",
   [" x"] = "Coc cursor"
  }
}

local wk =  require("which-key")
wk.register({
   ["<C-L>"] = "refresh screen", 
   --["gc"] = "Comments",
   ["y<C-G>"] = "Yank git object",
   ["ys"] = "Create surround (operator + surround)",
   ["yS"] = "Create Surround (operator + surround)",
   ["cs"] = "Change surround (+a surrounding)",
   ["cS"] = "Change Surround (+a surrounding)",
   ["ds"] = "Delete surround (+a surrounding)",
   [" a"] = "Code Actions",
   [" f"] = "Format (coc)",
   [" x"] = "Coc cursor"
})
EOF
 
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


function! s:map_normal()
  silent! nunmap <F1>
  silent! nunmap <F2>
  silent! nunmap <F3>
  silent! nunmap <F4>
  silent! nunmap <F5>
  silent! nunmap <F6>
  silent! nunmap <F8>
  silent! nunmap <leader><F8>
  silent! nunmap <leader><F9>
  silent! nunmap <F10>
  silent! nunmap <F11>
  silent! nunmap <F12>
  silent! nunmap <leader>di
  silent! xunmap <leader>di

  nnoremap <F3> :NERDTreeToggle<CR>
  nnoremap <F2> :CocOutline<CR>
  nnoremap <F4> :A<CR>
  nnoremap <F1> :UndotreeToggle<CR>
  nnoremap  <silent><F5> :call vimspector#Continue()<CR>:call <SID>map_debug()<CR>
endfunction

augroup texFiles 
  autocmd!
  autocmd BufEnter *.tex nnoremap <F2> :VimtexTocToggle<CR>
  autocmd BufLeave *.tex nnoremap <F2> :TagbarToggle<CR>
augroup end

augroup vimspectorFiles
  autocmd!
  autocmd BufEnter vimspector.Variables setlocal ft=vimspectorVariable
  au BufEnter term://*/\d\+:/bin/sh setlocal ft=vimspectorTerm
augroup end

function! s:map_debug()
  silent! nunmap <F1>
  silent! nunmap <F2>
  silent! nunmap <F3>
  silent! nunmap <F4>
  silent! nunmap <F5>
  silent! nunmap <F6>
  silent! nunmap <F8>
  silent! nunmap <leader><F8>
  silent! nunmap <leader><F9>
  silent! nunmap <F10>
  silent! nunmap <F11>
  silent! nunmap <F12>

  nmap <silent><F3> :VimspectorReset<CR>:call <SID>map_normal()<CR>
  nmap <F4> <Plug>VimspectorRestart
  nmap <F5> <Plug>VimspectorContinue
  nmap <F6> <Plug>VimspectorPause
  nmap <F8> <Plug>VimspectorAddFunctionBreakpoint
  nmap <leader><F8> <Plug>VimspectorRunToCursor
  nmap <leader><F9> <Plug>VimspectorToggleConditionalBreakpoint
  nmap <F10> <Plug>VimspectorStepOver
  nmap <F11> <Plug>VimspectorStepInto
  nmap <F12> <Plug>VimspectorStepOut
  " for normal mode - the word under the cursor
  nmap <Leader>di <Plug>VimspectorBalloonEval
  " for visual mode, the visually selected text
  xmap <Leader>di <Plug>VimspectorBalloonEval
endfunction

call s:map_normal()
nmap <F9> <Plug>VimspectorToggleBreakpoint
silent! iunmap <leader>is

" changer pour telescope (au moins pour references)
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
nmap <silent> <C-c> <Plug>(coc-cursors-position)
nmap <silent> <C-x> <Plug>(coc-cursors-word)
xmap <silent> <C-x> <Plug>(coc-cursors-range)
" use normal command like `<leader>xi(`
nmap <leader>x  <Plug>(coc-cursors-operator)

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
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)


" navigate chunks of current buffer as fugitive does
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap <leader>cc <Plug>(coc-git-chunkinfo)

inoremap  ii <ESC>
vnoremap  ii <ESC>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
nnoremap <leader>abc :call CocAction('showIncomingCalls')


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#expandable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use <leader>s for convert visual selected code to snippet
xmap <leader>s  <Plug>(coc-convert-snippet)

augroup mygroup
  autocmd!
  " Update signature help on jump placeholder.
  " how to update for cpp bracket expansion ?
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  "autocmd CompleteDone * call CocActionAsync('showSignatureHelp')
augroup end

if has('nvim')
	tnoremap ii <C-\><C-n>
	au TermOpen * setlocal nonumber conceallevel=0 norelativenumber nocursorline signcolumn=no
	au TermOpen * startinsert
	let g:python3_host_prog = '/usr/bin/python3.8'
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
set foldlevel=99
au Filetype floggraph setlocal ea
au FileType c,cpp,h,hpp setlocal foldmethod=syntax
"On évite à pandoc de refoutre la merde
au FileType coctree,airlatex setlocal nowrap

" Config lsp (surtout pour telescope)
sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=
sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=
sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=
