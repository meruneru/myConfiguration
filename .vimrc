" 基本設定
"###################################################
set nocompatible
set fileformats=unix,dos,mac
"クリップボードをtmuxで利用するための設定
set clipboard=unnamed
" バックスペースでの削除指定
" (indent:行頭の空白、eol:改行、start:手前の文字)
set backspace=indent,eol,start
"###################################################
" バックアップ
"###################################################
set nobackup
set writebackup
"###################################################
" 表示
"###################################################
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
"-----------------
" vi との互換性OFF
set nocompatible
" ファイル形式の検出を無効にする
filetype off

" Vundle を初期化して
" Vundle 自身も Vundle で管理
set rtp+=/home/meruneru/.vim/bundle/vundle/
call vundle#rc()
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/neomru.vim'
"tmuxでクリップボードを使うため
Bundle 'git://github.com/kana/vim-fakeclip.git' 
" ファイル形式検出、プラグイン、インデントを ON
filetype plugin indent on 

"------------------------------------
" neocomplcache
"------------------------------------
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
let g:vimfiler_as_default_explorer = 1
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
"" vimrc再読み込み
"------------------------------------
augroup source-vimrc
	autocmd!
	autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
	autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

