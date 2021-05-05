if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/meruneru/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/meruneru/.vim/bundles')
  call dein#begin('/Users/meruneru/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/meruneru/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neocomplcache'                   )
  call dein#add('Shougo/unite.vim'                       )
  call dein#add('Shougo/vimfiler'                        )
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('Shougo/neomru.vim'                      )
  call dein#add('Shougo/neoinclude.vim')
  call dein#add('Shougo/deoplete-clangx')
  call dein#add('fatih/vim-go'                      )
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  "C++ complete
  call dein#add('lighttiger2505/deoplete-vim-lsp.git')
  call dein#add('prabirshrestha/vim-lsp.git')
  call dein#add('mattn/vim-lsp-settings.git')
  let g:deoplete#enable_at_startup = 1 

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" " General Settings
set nobackup
set writebackup
set clipboard=unnamed
" Configuration of showing
syntax on
set title
set nonumber
set showcmd
set laststatus=2
set number
"カッコの表示、表示時間
set showmatch
set matchtime=2
set hlsearch
set wildmenu

set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
"colorscheme molokai
let g:molokai_original = 1

let g:python_host_prog = system('echo -n $(which python2)')
let g:python3_host_prog = system('echo -n $(which python3)')
"------------------------------------
" neocomplcache
"------------------------------------
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
let g:vimfiler_as_default_explorer = 1

"OpenGL
set path+=$HOME/works/opengl/learnopengl/glad/include
set path+=/usr/local/Cellar/glfw/3.3.2/include/GLFW
set path+=/usr/local/include/GLFW

"vimfiler 関連付け
let g:vimfiler_safe_mode_by_default=0
nnoremap <Space>f :<C-u>VimFiler<CR>
"------------------------------------
" unite.vim
"------------------------------------
let g:unite_enable_start_insert = 0
let g:unite_enable_split_vertically = 0
let g:unite_winwidth = 40
"ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
"最近使ったファイル一覧
nnoremap <silent> ,um :<C-u>Unite  file_mru <CR>
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite  buffer <CR>
nnoremap <silent> ,urc :<C-u>Unite file_rec/async:app/controllers/ <CR>
nnoremap <silent> ,urfc :<C-u>Unite file file/new -input=app/controllers/ <CR>
nnoremap <silent> ,urm :<C-u>Unite file_rec/async:app/models/ <CR>
nnoremap <silent> ,urfm :<C-u>Unite file file/new -input=app/models/ <CR>
nnoremap <silent> ,urv :<C-u>Unite file_rec/async:app/views/ <CR>
nnoremap <silent> ,urfv :<C-u>Unite file file/new -input=app/views/ <CR>
nnoremap <silent> ,urs :<C-u>Unite file_rec/async:app/assets/stylesheets/ <CR>
nnoremap <silent> ,urfs :<C-u>Unite file file/new -input=app/assets/stylesheets/ <CR>
nnoremap <silent> ,urj :<C-u>Unite file_rec/async:app/assets/javascripts/ <CR>
nnoremap <silent> ,urfj :<C-u>Unite file file/new -input=app/assets/javascripts/ <CR>
nnoremap <silent> ,uro :<C-u>Unite file_rec/async:config/ <CR>
nnoremap <silent> ,urfo :<C-u>Unite file file/new -input=config/ <CR>
nnoremap <silent> ,url :<C-u>Unite file_rec/async:lib/ <CR>
nnoremap <silent> ,urfl :<C-u>Unite file file/new -input=lib/ <CR>
nnoremap <silent> ,urr :<C-u>Unite file_rec/async:spec/ <CR>
nnoremap <silent> ,urfr :<C-u>Unite file file/new -input=spec/ <CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" ファイル形式検出、プラグイン、インデントを ON
filetype plugin indent on
"
"ファイルの編集中に評価する
"map <Leader>r <Esc>:!gosh -l %:p<CR>
"-----------------------------------
"<TAB>で補完
"------------------------------------
" {{{ Autocompletion using the TAB key
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function! InsertTabWrapper()
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
                return "\<TAB>"
        else
                if pumvisible()
                        return "\<C-N>"
                else
                        return "\<C-N>\<C-P>"
                end
        endif
endfunction
"" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" }}} Autocompletion using the TAB key
"------------------------------------
"" タブ機能
"------------------------------------
nnoremap <silent> tf :<c-u>tabfirst<cr>
nnoremap <silent> tl :<c-u>tablast<cr>
nnoremap <silent> tn :<c-u>tabnext<cr>
nnoremap <silent> tN :<c-u>tabNext<cr>
nnoremap <silent> tb :<c-u>tabprevious<cr>
nnoremap <silent> te :<c-u>tabedit<cr>
nnoremap <silent> tc :<c-u>tabnew<cr>
nnoremap <silent> tq :<c-u>tabclose<cr>
nnoremap <silent> to :<c-u>tabonly<cr>
nnoremap <silent> ts :<c-u>tabs<cr>

"------------------------------------
"" vimgrep
"------------------------------------
autocmd QuickFixCmdPost *grep* cwindow
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

"------------------------------------
"" go-vim
"------------------------------------
let g:go_def_mode = 'godef'

set completeopt-=preview

"------------------------------------
"" For mac
"------------------------------------
set backspace=indent,eol,start


"------------------------------------
"" deoplete
"------------------------------------
let g:deoplete#sources#clang#libclang_path = system("llvm-config --prefix")[:-2] . '/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = system("llvm-config --prefix")[:-2] . '/lib/clang'
let g:deoplete#sources#clang#sort_algo = 'priority'
let g:deoplete#sources#clang#clang_complete_database="./build/"

call deoplete#enable()
" No display of the number of competion list
set shortmess+=c

" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
" <C-e>: popup cancel
inoremap <expr><C-e>       deoplete#cancel_popup()

call deoplete#custom#source('_', 'matchers', ['matcher_head'])
call deoplete#custom#source('_', 'converters', [
      \ 'converter_remove_paren',
      \ 'converter_remove_overlap',
      \ 'matcher_length',
      \ 'converter_truncate_abbr',
      \ 'converter_truncate_menu',
      \ 'converter_auto_delimiter',
      \ ])
call deoplete#custom#option('keyword_patterns', {
      \ '_': '[a-zA-Z_]\k*\(?',
      \ 'tex': '[^\w|\s][a-zA-Z_]\w*',
      \ })
call deoplete#custom#option('camel_case', v:true)


let g:dein#auto_recache = 1
