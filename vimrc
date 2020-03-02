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
" My Bundles here: 
" Refer to |:NeoBundle-examples|. 
" Note: You don't set neobundle setting in .gvimrc! 
NeoBundle 'lifepillar/vim-solarized8'  
NeoBundle 'tibabit/vim-templates' 
NeoBundle 'preservim/nerdtree' 
NeoBundle 'tpope/vim-fugitive' 
NeoBundle 'junegunn/gv.vim' 
NeoBundle 'valloric/youcompleteme' 
NeoBundle 'vim-scripts/a.vim' 
NeoBundle 'xolox/vim-easytags' 
NeoBundle 'xolox/vim-misc' 
NeoBundle 'majutsushi/tagbar' 
NeoBundle 'vhdirk/vim-cmake' 
NeoBundle 'skywind3000/asyncrun.vim' 
NeoBundle 'tpope/vim-dispatch' 
NeoBundle 'rdnetto/YCM-Generator' 
NeoBundle 'jceb/vim-orgmode' 
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'

if !has('nvim') 	
	NeoBundle 'jeaye/color_coded' 	
else 	
	NeoBundle 'arakashic/chromatica.nvim' 	 
	NeoBundle 'vim-airline/vim-airline' 	
	NeoBundle 'vim-airline/vim-airline-themes' 
endif 
NeoBundle 'jiangmiao/auto-pairs' 
call neobundle#end()  
" Required: 
filetype plugin indent on 
syntax on 
set hidden

set number 
set relativenumber 
set mouse=a 
set cursorline 
set clipboard=unnamedplus  

" If there are uninstalled bundles found on startup, 
" this will conveniently prompt you to install them. 
NeoBundleCheck 

set t_Co=256 
set background=dark 
set completeopt=menuone 
let g:solarized_use16 = 1 
let g:cmake_export_compile_commands = 1 
let g:cmake_ycm_symlinks = 1 
set makeprg=make\ -C\ ./build 
let g:easytags_async = 1 
let g:easytags_auto_highlight = 0 
colorscheme solarized8 
hi CursorLine gui=underline guibg=NONE
hi Normal guibg=NONE

nnoremap <F3> :NERDTreeToggle<CR> 
nnoremap <F2> :TagbarToggle<CR> 
nnoremap <F5> :Make<CR> 
nnoremap <F6> :CMake<CR> 
nnoremap <F4> :A<CR> 
nnoremap <C-LeftMouse> :YcmCompleter GoTo<CR>
nnoremap <Leader>r :YcmCompleter GoToReferences<CR>
nnoremap <leader>vr :vsplit \| YcmCompleter GoToReferences<CR>
nnoremap <leader>sr :split \| YcmCompleter GoToReferences<CR>
nnoremap <leader>vg :vsplit \| YcmCompleter GoTo<CR>
nnoremap <leader>sg :split \| YcmCompleter GoTo<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>cs :noh<CR>
nnoremap <leader>tn :tabnew
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>tc :tabc<CR>
nnoremap <leader>cn :cn<CR>
nnoremap <leader>cp :cp<CR>
nnoremap <leader>lne :lne<CR>
nnoremap <leader>lp :lp<CR>

inoremap  ii <ESC>
vnoremap  ii <ESC>

if has('nvim')
	tnoremap ii <C-\><C-n> 
	au TermOpen * startinsert
	let g:chromatica#libclang_path = "/usr/lib/llvm-6.0/lib"
	let g:chromatica#enable_at_startup=1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_theme='solarized'
	let g:airline_solarized_bg='dark'
	let g:airline_powerline_fonts = 1
endif
