call plug#begin()
"j EditorConfig
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
" Language support things
Plug 'sheerun/vim-polyglot'
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ap/vim-css-color'
" LSP support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Fancy UI stuff
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/powerline'

Plug 'ryanoasis/vim-devicons'
Plug 'tyrannicaltoucan/vim-quantum'

" Auto root folder switcher
Plug 'airblade/vim-rooter'
" Moving around easier
Plug 'easymotion/vim-easymotion'
" Improving editing experience
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
" Fzf file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'honza/vim-snippets'
Plug 'cocopon/iceberg.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'APZelos/blamer.nvim'
Plug 'zivyangll/git-blame.vim'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mikelue/vim-maven-plugin'
Plug 'voldikss/vim-floaterm'
Plug 'rhysd/nyaovim-popup-tooltip'
Plug 'rakr/vim-one'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'rhysd/ghpr-blame.vim'
Plug 'thanthese/tortoise-typing'
Plug 'rhysd/vim-healthcheck'
call plug#end()

" ================================================================================================
" Raw vim setup
"" ================================================================================================
set hidden
set nobackup
set nowritebackup

set clipboard=unnamed
set foldmethod=indent
set foldlevel=99

let g:is_posix = 1

set noswapfile
set nojoinspaces
set nowrap
set number
set ttyfast
set laststatus=2
set ttimeout
set ttimeoutlen=10
set ignorecase
" I don't use recording, don't judge me
" inoremap <esc> <nop>
inoremap jk <ESC>
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>
"Duplicate everything selected
vmap D y'>p

" Map Emacs like movement in Insert mode
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^

" Remap scrolling
nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>

" Key binding
let mapleader=" "
nnoremap <Leader>w :w<CR>
nnoremap <Leader>l :vsplit<CR>
nnoremap <Leader>k :split<CR>
nnoremap <Leader>wh :wincmd h<CR>
nnoremap <Leader>wl :wincmd l<CR>
nnoremap <Leader>wk :wincmd k<CR>
nnoremap <Leader>wj :wincmd j<CR>
nnoremap <Leader>w= :wincmd =<CR>
nnoremap <Leader>wb :e#<CR>
nnoremap <silent>qq :bp <BAR> bd #<CR>
"Buffer
nnoremap <Leader>tn :tabn<CR>
nnoremap <Leader>tp :tabp<CR>
nnoremap <Leader>tc :tabe<CR>
nnoremap <Leader>tx :tabclose<CR>

" Persistent undo
" Don't forget mkdir folder $HOME/.vim/undo
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=10000

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
set nolist

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

set autoindent
set smartindent
set splitright
silent! set splitvertical
au FocusGained,BufEnter * :checktime
" ================================================================================================

filetype plugin indent on
nnoremap n <nop>
" Auto remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e


" Tweak for Markdown mode
" Config of devicons
set encoding=UTF-8
set fileencoding=UTF-8

set nolist
" set listchars=eol:$,tab:.\ ,trail:.,extends:>,precedes:<,nbsp:_

" Custom icon for coc.nvim statusline
let g:coc_status_error_sign=" "
let g:coc_status_warning_sign=" "

" ------------------------------------------------------------------------------------
"  THEME SET UP
" ------------------------------------------------------------------------------------
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


colorscheme one
set background=light        " for the light version
let g:one_allow_italics = 1 " I love italic for comments
" ------------------------------------------------------------------------------------

setlocal foldmethod=marker
setlocal foldmarker={,}

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
	syntax on
endif

let g:NERDSpaceDelims = 1
map mm <Plug>NERDCommenterToggle

map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

noremap ;' :%s:::g<Left><Left><Left>
noremap ;" :%s:::cg<Left><Left><Left><Left>

" NERDTree config
let NERDTreeMinimalUI=1
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>e :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Vim easymotion
nmap <silent> ;; <Plug>(easymotion-overwin-f)
nmap <silent> ;l <Plug>(easymotion-overwin-line)
" Turn off whitespaces compare and folding in vimdiff
if &diff
" set diffopt+=iwhite
" set diffopt+=vertical
" nnoremap <Leader>1 :diffget 1<CR>:diffupdate<CR>
" nnoremap <Leader>2 :diffget 2<CR>:diffupdate<CR>
    set cursorline
    hi DiffAdd    ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
    hi DiffChange ctermbg=white  guibg=#ececec gui=none   cterm=none
    hi DiffText   ctermfg=233  ctermbg=yellow  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
endif

set clipboard=unnamed

" Auto change root of the project
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['package.json','.git/']
" Multiple Cursor

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Some custom style
" highlight Normal guibg=NONE
highlight EasyMotionTargetDefault guifg=#ff4081
highlight NonText guifg=#333333
highlight VertSplit guifg=#8BC34A
highlight WildMenu guibg=NONE guifg=#03A9F4
highlight CursorLineNr guibg=NONE
highlight Cursor ctermfg=Red ctermbg=Yellow cterm=bold guifg=red guibg=yellow gui=bold
highlight Normal ctermfg=DarkGrey ctermbg=darkblue
highlight Visual guifg=White guibg=LightBlue gui=none
highlight clear SignColumn
highlight clear LineNr
" colorscheme onedark

" highlight Normal ctermbg=None
" highlight LineNr ctermfg=DarkGrey

if !has('gui_running')
  set t_Co=256
endif


set shortmess+=c
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! ToggleVerbose()
    if !&verbose
        set verbosefile=~/.log/vim/verbose.log
        set verbose=15
    else
        set verbose=0
        set verbosefile=
    endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break ndo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
map <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use L to highlight the symbol under the cursor
nnoremap <silent> L :call CocActionAsync('highlight')<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Remap for format selected region
xmap <leader><leader>f  <Plug>(coc-format-selected)
nmap <leader><leader>f  <Plug>(coc-format-selected)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>ar  <Plug>(coc-rename)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{StatusDiagnostic()}
"========================================================
" MAPPING FZF
"========================================================
let g:fzf_buffers_jump = 1
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path '.git/**' -prune -o -path '**/node_modules/**' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'coverage/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>
nnoremap <c-p> <ESC>:Files<CR>
nnoremap <silent>\  <ESC>:BLines<CR>
" nnoremap <silent> <leader>f :GGrep<CR>
nnoremap <silent> <leader>f :Rg<CR>
nnoremap <silent> <Leader>` :Marks<CR>
nnoremap <silent> <Leader>- :Buf<CR>
nnoremap <silent> t :bnext<CR>
nnoremap <silent> T :bprev<CR>

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
" Prevent FZF open file in NERDTree
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)
" autocmd VimEnter * nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
autocmd VimEnter * nnoremap <silent> <expr> <leader>f (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Rg\<cr>"
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.png

"========================================================
" Terminal config
"========================================================
" :tnoremap <Esc> <C-\><C-n>
" :tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" :tnoremap <A-h> <C-\><C-N><C-w>h
" :tnoremap <A-j> <C-\><C-N><C-w>j
" :tnoremap <A-k> <C-\><C-N><C-w>k
" :tnoremap <A-l> <C-\><C-N><C-w>l
" :inoremap <A-h> <C-\><C-N><C-w>h
" :inoremap <A-j> <C-\><C-N><C-w>j
" :inoremap <A-k> <C-\><C-N><C-w>k
" :inoremap <A-l> <C-\><C-N><C-w>l
" :nnoremap <A-h> <C-w>h
" :nnoremap <A-j> <C-w>j
" :nnoremap <A-k> <C-w>k
" :nnoremap <A-l> <C-w>l
"========================================================
"Ale config
"========================================================
let g:ale_sign_error = ' '
let g:ale_sign_warning = ' '
let g:ale_fix_on_save = 1
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

"========================================================
"Blamer Config
"========================================================
let g:blamer_delay = 1000
noremap <silent> <leader>g :BlamerToggle<CR>
let g:blamer_prefix = ' 💀  '
let g:blamer_date_format = '%d/%m/%y'
let g:blamer_relative_time = 1
let g:blamer_template = '🦸 <committer-mail> 📌 <commit-short> 🕐 <committer-time> 📝 <summary>'
highlight Blamer guifg='#cc8e35'

"========================================================
"Git Blame Config
"========================================================
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
nnoremap <Leader>b :GHPRBlame<CR>


"========================================================
"Airline Config
"========================================================
let g:airline_powerline_fonts = 0
let g:airline_theme='one'
let g:airline_section_b = '%{getcwd()}' " in section B of the status line display the CWD

"========================================================
" TABLINE:
"========================================================

let g:airline#extensions#tabline#enabled = 0           " enable airline tabline
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)
let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab
" " let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right
" " let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline
let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline



"========================================================
" FLOAT TERM
"========================================================
let g:floaterm_keymap_new    = '<Leader>+'
let g:floaterm_keymap_prev   = '<Leader>('
let g:floaterm_keymap_next   = '<Leader>)'
let g:floaterm_keymap_toggle = '<Leader>*'

" let g:floaterm_keymap_kill   = '<Leader>$'
" let g:floaterm_keymap_show   = '<Leader>^'
" let g:floaterm_keymap_hide   = '<Leader>&'
" g:floaterm_keymap_new
" g:floaterm_keymap_prev
" g:floaterm_keymap_next
" g:floaterm_keymap_hide
" g:floaterm_keymap_show
" g:floaterm_keymap_kill
" g:floaterm_keymap_toggle
"========================================================
" JAVA + MAVEN
"========================================================

compiler ant
set makeprg=maven\ -q\ -f\ project.xml\ jar:install
"========================================================
" JS Doc
"========================================================
" nnoremap jsd :<C-u>call JSDocAdd()<CR>
"========================================================
" Markdown preivew
"========================================================
nnoremap <Leader>V :MarkdownPreview<CR>
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
"========================================================
" EOF
"========================================================
