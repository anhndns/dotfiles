call plug#begin("~/.config/nvim/plugged")
  Plug 'voldikss/vim-floaterm'
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'powerline/powerline'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'rakr/vim-one'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'w0rp/ale'
  Plug 'easymotion/vim-easymotion'

  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'airblade/vim-rooter'
  Plug 'sheerun/vim-polyglot'
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-fugitive'
  Plug 'honza/vim-snippets'
  Plug 'mariappan/dragvisuals.vim'
  Plug 'sindrets/diffview.nvim'
  Plug 'junegunn/vim-easy-align'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'folke/todo-comments.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
  Plug 'nvim-telescope/telescope-live-grep-args.nvim'
call plug#end()
" ================================================================================================
" Raw vim setup
"" ================================================================================================
set hidden
set nobackup
set nowritebackup

set clipboard=unnamed

set foldmethod=manual
set foldnestmax=10
set nofoldenable
set foldlevel=1

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
"Duplicate everything selected
vmap D y'>p

"p Map Emacs like movement in Insert mode
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
nnoremap <Leader>ww :w<CR>
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
" nnoremap <Leader>tn :tabn<CR>
" nnoremap <Leader>tp :tabp<CR>
" nnoremap <Leader>tc :tabe<CR>
" nnoremap <Leader>tx :tabclose<CR>

" Persistent undo
" Don't forget mkdir folder $HOME/.vim/undo
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=10000

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·

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


if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
	syntax on
endif
if !has('gui_running')
  set t_Co=256
endif
" set listchars=eol:$,tab:.\ ,trail:.,extends:>,precedes:<,nbsp:_
""
"========================================================
" MAPPING FZF
"========================================================
let g:fzf_buffers_jump = 1
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path '.git/**' -prune -o -path '**/node_modules/**' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'coverage/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" nnoremap <Leader>t :BTags<CR>
" nnoremap <Leader>T :Tags<CR>
" nnoremap <silent> <Leader>` :Marks<CR>
" nnoremap <silent> <Leader>- :Buf<CR>
nnoremap <c-p> <ESC>:Files<CR>
nnoremap <silent>\  <ESC>:BLines<CR>
nnoremap <silent> <leader>f :Rg<CR>
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
" NERDTree config
"========================================================
let NERDTreeMinimalUI=1
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>e :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"========================================================
" FLOAT TERM
"========================================================
let g:floaterm_keymap_new    = '<Leader>+'
let g:floaterm_keymap_prev   = '<Leader>('
let g:floaterm_keymap_next   = '<Leader>)'
let g:floaterm_keymap_toggle = '<Leader>*'
let g:floaterm_position = 'topright'
let g:floaterm_width = 0.4
let g:floaterm_height = 0.4

" ------------------------------------------------------------------------------------
"  THEME
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


set background=dark " for the dark version
" set background=light " for the light version
colorscheme nightfox
let g:one_allow_italics = 1 " I love italic for comments
" ------------------------------------------------------------------------------------
"  NERD COMMENTER
" ------------------------------------------------------------------------------------
let g:NERDSpaceDelims = 1

map mm <Plug>NERDCommenterToggle
"========================================================
" Ale config
"========================================================
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.js
    au BufNewFile,BufRead *.js set filetype=javascript.js
    au BufNewFile,BufRead *.txml set filetype=xml
    au BufNewFile,BufRead *.tcss set filetype=css
augroup END

let g:jsx_ext_required = 0

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'jsx': ['eslint'],
\}


let g:ale_fixers = {
\   'jsx': ['eslint', 'prettier'],
\   'javascript': ['eslint', 'prettier'],
\   'less': ['stylelint', 'prettier'],
\   'css': ['stylelint', 'prettier'],
\   'scss': ['stylelint', 'prettier'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
" let g:ale_javascript_prettier_options = '--no-semi --single-quote --trailing-comma none'

"========================================================
" Vim easymotion
"========================================================
nmap <silent> ;; <Plug>(easymotion-overwin-f)
nmap <silent> ;l <Plug>(easymotion-overwin-line)

"========================================================
" Vim rooter
"========================================================
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['package.json','.git/']

"========================================================
"Airline Config
"========================================================
let g:airline_powerline_fonts = 0
let g:airline_theme='deus'
let g:airline_section_b = '%{getcwd()}' " in section B of the status line display the CWD

"========================================================
" TABLINE:
"========================================================

let g:airline#extensions#tabline#enabled = 1           " enable airline tabline
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
" COC:
"========================================================
" augroup filetype_jsx
    " autocmd!
    " autocmd FileType javascript set filetype=javascriptreact
" augroup END
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:coc_status_error_sign=" "
let g:coc_status_warning_sign=" "
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break ndo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
map <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1):
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()
inoremap <silent><expr> <c-j>
    \ coc#pum#visible() ? coc#pum#next(1):
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()
inoremap <silent><expr> <c-n>
    \ coc#pum#visible() ? coc#pum#next(1):
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <expr><c-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <c-space> coc#refresh()

hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A
"========================================================
" UltiSnips
"========================================================

"========================================================
"  THEME extra
"========================================================
highlight VertSplit cterm=NONE
highlight EasyMotionTargetDefault guifg=#ff4081
highlight NonText guifg=#333333
highlight VertSplit guifg=#8BC34A
highlight WildMenu guibg=NONE guifg=#03A9F4
highlight CursorLineNr guifg=#ffffff
highlight Cursor ctermfg=Red ctermbg=Yellow cterm=bold guifg=red guibg=yellow gui=bold
highlight Normal ctermfg=Gray ctermbg=darkblue
highlight Visual guifg=White guibg=#6c7c6c ctermbg=darkblue gui=none
highlight clear SignColumn
set cursorline
set signcolumn=yes
set tw=72 fo=cqt wm=0


"========================================================
"  Hexokinase
"========================================================
let g:Hexokinase_highlighters = ['foreground']
let g:Hexokinase_optInPatterns = 'full_hex,triple_hex,rgb,rgba,hsl,hsla,colour_names'
let g:Hexokinase_ftEnabled = ['less', 'css', 'html', 'javascript']


"========================================================
"  Save session
"========================================================
fu! SaveSess()
    execute 'mksession! ~/.session.vim'
endfunction

fu! RestoreSess()
if filereadable('~/.session.vim')
    execute 'so ~/.session.vim'
    if bufexists(1)
        for l in range(1, bufnr('$'))
            if bufwinnr(l) == -1
                exec 'sbuffer ' . l
            endif
        endfor
    endif
endif
endfunction

command SaveSession call SaveSess()
nnoremap <leader>cr :RestoreSession<CR>
set wildmenu
set wildmode=full
" Save session on quitting Vim
" autocmd VimLeave * NERDTreeClose
" autocmd VimLeave * call SaveSess()

" Restore session on starting Vim
" autocmd VimEnter * nested call RestoreSess()
" autocmd VimEnter * nnoremap <silent> <expr> <leader>f (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Rg\<cr>"
"
"========================================================
" Trace log
"========================================================
" git log --pretty=format:"%h" -- Dockerfile
" let jsconfig_file = findfile('jsconfig.json', '.;')
" if len(jsconfig_file)
    " let jsconfig_data = json_decode(join(readfile(jsconfig_file)))
    " let compiler_options = get(jsconfig_data, 'compilerOptions', {})
    " let &l:path = &path . ',' . substitute(substitute(get(compiler_options, 'baseUrl', '.'), '/$', '', ''), '$', '/', '')
" endif

"========================================================
" EasyAlign
"========================================================
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"========================================================
" Todo comment
"========================================================
nnoremap <Leader>t :TodoTelescope<CR>
nnoremap ` <cmd>:lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>

lua << EOF
  require('telescope').setup({
    defaults = {
      layout_config = {
        vertical = { width = 0.5 }
        -- other layout configuration here
      },
      -- other defaults configuration here
    },
    -- other configuration values here
  })
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    keywords = {
      FIX = {
        icon = " ", -- icon used for the sign, and in search results
        color = "error", -- can be a hex color, or a named color (see below)
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
        -- signs = false, -- configure signs for some keywords individually
      },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED" } },
    },
  }
EOF
