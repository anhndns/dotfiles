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
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
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
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'cocopon/iceberg.vim'
Plug 'jiangmiao/auto-pairs'
call plug#end()

filetype plugin indent on
nnoremap n <nop>
" Auto remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e


" Tweak for Markdown mode
" Config of devicons
set encoding=UTF-8
" Custom icon for coc.nvim statusline
let g:coc_status_error_sign=" "
let g:coc_status_warning_sign=" "

set background=dark
set termguicolors
colorscheme quantum

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
	syntax on
endif

let g:NERDSpaceDelims = 1
map mm <Plug>NERDCommenterToggle

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

noremap ;' :%s:::g<Left><Left><Left>
noremap ;" :%s:::cg<Left><Left><Left><Left>

source ~/.vim/vim.tmpl
let $NVIMRC = $HOME . "/.config/nvim/init.vim"
" nnoremap <leader><leader>n :vsp $NVIMRC<cr>
" nnoremap <leader>sn :source $NVIMRC<cr>


" NERDTree config
let NERDTreeMinimalUI=1
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>e :NERDTreeFind<CR>

" Vim easymotion
nmap <silent> ;; <Plug>(easymotion-overwin-f)
nmap <silent> ;l <Plug>(easymotion-overwin-line)
" Turn off whitespaces compare and folding in vimdiff

set diffopt+=iwhite
set diffopt+=vertical
nnoremap <Leader>1 :diffget 1<CR>:diffupdate<CR>
nnoremap <Leader>2 :diffget 2<CR>:diffupdate<CR>

set clipboard=unnamed

function! DrawGitBranchInfo()
  let branch = fugitive#head()
  return len(branch) > 0 ? " " . branch : ""
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : '') : ''
endfunction

function! LightLineFilename()
  let name = ""
  let subs = split(expand('%'), "/")
  let i = 1
  for s in subs
    let parent = name
    if  i == len(subs)
      let name = len(parent) > 0 ? parent . '/' . s : s
    elseif i == 1
      let name = s
    else
      let part = strpart(s, 0, 10)
      let name = len(parent) > 0 ? parent . '/' . part : part
    endif
    let i += 1
  endfor
  return name
endfunction

let g:lightline = {
      \ 'colorscheme': 'quantum',
      \ 'active': {
      \   'left': [ ['fileicon'], [ 'cocstatus' ], [ 'filename' ] ],
      \   'right': [ [ 'icongitbranch' ], [ 'lineinfo' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [], ['fileicon'], [ 'filename' ] ],
      \   'right': []
      \ },
      \ 'component': { 'lineinfo': ' %2p%% %3l:%-2v' },
      \ 'component_function': {
      \   'fileicon': 'MyFiletype',
      \   'icongitbranch': 'DrawGitBranchInfo',
      \   'iconline': 'DrawLineInfo',
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'filename': 'LightLineFilename',
      \ },
      \ }

" Auto change root of the project
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['Cargo.tom', 'package.json', '.git/']
" Multiple Cursor

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Some custom style
highlight Normal guibg=NONE
highlight EasyMotionTargetDefault guifg=#ffb400
highlight NonText guifg=#354751
highlight VertSplit guifg=#212C32
highlight WildMenu guibg=NONE guifg=#87bb7c
highlight CursorLineNr guibg=NONE
highlight Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
highlight Normal ctermfg=grey ctermbg=darkblue
highlight clear SignColumn
highlight clear LineNr
"========================================================
"" lightline-bufferline config
"========================================================
if !has('gui_running')
  set t_Co=256
endif

let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
nnoremap <Leader>` :bnext<CR>
nnoremap <Leader>- :bprev<CR>
set showtabline=2

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

set shortmess+=c
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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
imap <C-l> <Plug>(coc-snippets-expand)

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
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path '**/node_modules/**' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'coverage/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
map <c-p> <ESC>:Files<CR>
nnoremap <silent>\  <ESC>:BLines<CR>
nnoremap <silent> <leader>f :GGrep<CR>
nnoremap <silent> <leader>g :Rg<CR>

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
" Prevent FZF open file in NERDTree
" autocmd VimEnter * nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.png

"========================================================
"Ale config
"========================================================
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
