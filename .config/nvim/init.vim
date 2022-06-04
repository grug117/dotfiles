" plugins
call plug#begin()
Plug 'tomasiser/vim-code-dark'
Plug 'numtostr/FTerm.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'OmniSharp/omnisharp-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go'
Plug 'neovim/nvim-lspconfig'
call plug#end()

" plugin config
lua require('FTerm').setup({ border = 'double' })

lua require('lspconfig').terraformls.setup{}

let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-go',
  \ 'coc-python',
  \ 'coc-docker'
  \ ]

let g:mkdp_browserfunc = 'g:OpenNewWindow'

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <c-space> to trigger completion.
inoremap <expr> <c-space> coc#refresh()


" mappings
" FTerm mappings
nnoremap <silent><leader>t <CMD>lua require("FTerm").toggle()<CR>
tnoremap <silent><leader>t <C-\><C-n><CMD>lua require("FTerm").toggle()<CR>

" fzf.vim mappings
nnoremap <silent><C-c> <CMD>Files ./<CR>
nnoremap <silent><C-p> <CMD>GFiles ./<CR>

" MarkdownPreview mappings
nnoremap <silent>[m <CMD>MarkdownPreview<CR>
nnoremap <silent>]m <CMD>MarkdownPreviewStop<CR>

" misc
tnoremap <silent><ESC> <C-\><C-n>
nnoremap <silent><S-t> <CMD>tabnew<CR>
nnoremap <silent><C-l> <CMD>tabnext<CR>
nnoremap <silent><C-h> <CMD>tabprevious<CR>
nnoremap <silent><C-k> <CMD>tabfirst<CR>
nnoremap <silent><C-j> <CMD>tablast<CR>
nnoremap <silent><leader><space> I<CR><ESC>kI
nnoremap <silent><C-n> <CMD>:noh<CR>

" settings
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set nocompatible
set wildmode=longest,list
set showcmd		         "Show (partial) command in status line.
set showmatch	             "Show matching brackets.
set hidden		             "Hide buffers when they are abandoned
set completeopt-=preview 	 "Disables scratch preview
set softtabstop=4
set tabstop=4                "show existing tab with 4 spaces width
set shiftwidth=4             "when indenting with '>', use 4 spaces width
set expandtab                "On pressing tab, insert 4 spaces

autocmd BufNewFile,BufRead *.js* set tabstop=2  "If js file show existing tab with 2 spaces width
autocmd BufNewFile,BufRead *.js* set shiftwidth=2  "If js file when indenting with '>', use 2 spaces width
autocmd BufNewFile,BufRead *.ts* set tabstop=2  "If js file show existing tab with 2 spaces width
autocmd BufNewFile,BufRead *.ts* set shiftwidth=2  "If js file when indenting with '>', use 2 spaces width
autocmd BufNewFile,BufRead *css set tabstop=2  "If css, scss file show existing tab with 2 spaces width
autocmd BufNewFile,BufRead *css set shiftwidth=2  "If css, scss file when indenting with '>', use 2 spaces width
au BufNewFile,BufRead *.ejs.t set filetype=html

set updatetime=100
set termguicolors
colorscheme codedark

if has("autocmd")
  filetype plugin indent on
endif

if has("syntax")
  syntax on
endif

" functions
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! g:OpenNewWindow(url)
    silent exe 'silent !open -na "Brave Browser" ' . a:url
endfunction
