" =========================================================================
" =  플러그인 설정                                                        =
" =========================================================================
call plug#begin('~/.vim/plugged') " 플러그인 시작

" Conquer Of Completion 자동완성 플러그인
" Node JS 필요함
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Vim Surround 플러그인
Plug 'tpope/vim-surround'
" nvim-treesitter 구문 파싱 하이라이팅
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Markdown 프리뷰용 플러그인
" npm install -g livedown@1.0.11
Plug 'shime/vim-livedown'
" Emmet 자동적용 플러그인
Plug 'mattn/emmet-vim'

" Tagbar 코드 뷰어 창
" Plug 'majutsushi/tagbar'
" ctags 플러그인 필요
Plug 'preservim/tagbar'

" NERDTree 코드 뷰어 창
Plug 'preservim/nerdtree'
" NERDTree Git 플러그인
Plug 'Xuyuanp/nerdtree-git-plugin'
" 컬러스킴(색상표) jellybeans, gruvbox
Plug 'nanotech/jellybeans.vim'
" Plug 'morhetz/gruvbox'

" NerdCommenter(자동주석완성)
Plug 'preservim/nerdcommenter'
" 하단에 다양한 상태(몇 번째 줄, 인코딩, etc.)를
" 표시하는 상태바 추가
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git 플러그인
Plug 'tpope/vim-fugitive'
" CScope 플러그인
Plug 'ronakg/quickr-cscope.vim'

" CtrlP 파일 탐색 플러그인
Plug 'ctrlpvim/ctrlp.vim'

" 비활성 윈도우 강조
" Plug 'blueyed/vim-diminactive'

" vim cutlass 잘라내기 명령어가 yank 에 영향을 주지 않음
Plug 'svermeulen/vim-cutlass'

" VIM GAS(GNU ASsembler) Highlighting
Plug 'Shirk/vim-gas'

" HTML 태그 자동 닫기
Plug 'alvan/vim-closetag'

" 짝 문자 자동 입력
Plug 'jiangmiao/auto-pairs'

" VIM Easymotion
Plug 'easymotion/vim-easymotion'
call plug#end()
" =========================================================================
" =  단축키 지정                                                          =
" =  n(normal mode) 명령 모드                                             =
" =  v(visual, select mode) 비주얼 모드                                   =
" =  x(visual mode only) 비주얼 모드                                      =
" =  s(select mode only) 선택 모드                                        =
" =  i(insert mode) 편집 모드                                             =
" =  t(terminal mode) 편집 모드                                           =
" =  c(commnad-line) 모드                                                 =
" =  re(recursive) 맵핑                                                   =
" =  nore(no recursive) 맵핑                                              =
" =========================================================================
" ------------------------------------
" 편집 모드 
" ------------------------------------
" jk 와 kj 를 <ESC> 키로 맵핑
inoremap jk <ESC>
inoremap kj <ESC>
" ------------------------------------
" 명령 모드 
" ------------------------------------
" <F1> 을 통해 NERDTree 와 Tagbar 열기
nnoremap <silent><F1> :NERDTreeToggle<CR><bar>:TagbarToggle <CR> 
" gn을통해 NerdTree만 따로 열기
nnoremap <silent>gn :NERDTreeToggle<CR>
" ------------------------------------
" Livedown 설정
" ------------------------------------
"  gm 누를 경우 localhost에서 Markdown 문서 열도록 설정
nnoremap <silent>gm :LivedownToggle<CR>
" ------------------------------------
" Git 설정
" ------------------------------------
nnoremap <silent>gs :Gdiffsplit<CR>
nnoremap <silent>gc :G commit -a<CR>
nnoremap <silent>gp :G push origin master<CR>
nnoremap <silent>gl :G log<CR>
" gt 누를 경우 tagbar 생성
nmap <silent>gt :TagbarToggle<CR>
" emmet 자동완성을 g<tab>으로 적용하기
imap <silent><expr> g<tab> emmet#expandAbbrIntelligent("<tab>")
" <Ctrl + h, l> 를 눌러서 이전, 다음 탭으로 이동
nnoremap <silent><C-j> :tabprevious<CR>
nnoremap <silent><C-k> :tabnext<CR>

" <Ctrl + j, k> 를 눌러서 이전, 다음 버퍼로 전환
nnoremap <silent><C-h> :bp<CR>
nnoremap <silent><C-l> :bn<CR>

" <Shift + h, l> 를 눌러서 현재 버퍼 삭제
nnoremap <silent><S-h> :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <silent><S-l> :bp<bar>sp<bar>bn<bar>bd<CR>

" <Ctrl + w> t 를 눌러서 커서를 NERDTree 로 옮기기
nnoremap <silent><C-w>t :NERDTreeFocus<CR>

" 우측 하단(botright)에 창 생성(new), 해당 창을 terminal 로 변경
" 크기를 10 으로 재설정(resize) 후 창 높이를 고정(winfixheight)시킴
" 줄번호는 삭제하고, 터미널 디렉터리 글자색을 변경
nnoremap <silent><F2> 
	\:botright new<CR><bar>
	\:terminal<CR><bar><ESC>
	\:resize 10<CR><bar>
	\:set winfixheight<CR><bar>
	\:set nonu<CR><bar>
	\iLS_COLORS=$LS_COLORS:'di=1;33:ln=36'<CR>
" ------------------------------------
" 터미널 모드 
" ------------------------------------
" 터미널 모드에서 <Ctrl + w> 누르면 명령 모드로 전환하고 <Ctrl + w> 입력
tmap <silent><C-w> <ESC><C-w>

" jk 혹은 kj 를 누르면 <ESC> 를 실행
tmap <silent>jk <ESC>
tmap <silent>kj <ESC>

" <ESC> 입력 시 <C-\><C-n> 실행 => 터미널 모드에서 기본 모드로 전환
tnoremap <silent><ESC> <C-\><C-n>

" ------------------------------------
" 명령, 비주얼 모드
" ------------------------------------
" iamroot 자동 주석
map <F9> <ESC>o/*<CR> * IAMROOT, <C-R>=strftime("%Y.%m.%d")<CR>
	\: <CR>*/<CR><ESC><UP><UP><END>
" =========================================================================
" =  vim 설정                                                             =
" =========================================================================
" 탭 정지 = 8 칸마다
" 쉬프트 (<< 혹은 >>) 이동거리 8 칸

" 줄 번호를 표시한다.
set number

" 괄호 짝을 강조한다.
set showmatch

" 하위 디렉터리를 모두 path 에 추가한다.
" gf 명령어 사용 시 파일을 인식 가능
set path+=**

" 탐색 문자열 강조
set hlsearch

" 항상 상단에 탭 라인을 출력한다.
set showtabline=2

" 행 표시선 출력
set colorcolumn=80

if has('nvim')			" nvim 을 사용 중이라면
	set inccommand=nosplit	" nvim live %s substitute (실시간 강조)
endif

" vim 과 OS 의 클립보드 동기화
set clipboard=unnamedplus

" GUI-Color 를 사용 가능하도록 설정 (TrueColor)
" cterm 혹은 term 대신 gui 를 통해 색상을 설정할 수 있고
" 16,777,216 종류의 색상 표현 가능(기존 256)
set termguicolors

" 모든 마우스 기능을 사용
set mouse=a

" mkview 명령어가 저장하는 요소 중
" 하나인 `options` 를 제거
set viewoptions-=options

" 문법이 존재하면
if has("syntax")
	" 문법 강조를 수행
	syntax on	
endif

" 컬러스킴(문법 강조 색상) - 현재 jellybeans
colorschem jellybeans
" colorschem gruvbox

" =========================================================================
" =  하이라이트 정의                                                      =
" =========================================================================
" 버퍼(창)과 버퍼의 끝(창의 끝)을 투명하게
highlight Normal guibg=NONE
highlight EndOfBuffer guibg=NONE

" 줄번호 배경색은 투명(NULL)하게, 
" 글자는 굵게(bold), 글자색은 하얗게(White)
highlight LineNr guibg=NONE gui=bold guifg=white

" 행 표시선 색상
highlight ColorColumn guibg=White
" =========================================================================
" =  함수 정의                                                            =
" =========================================================================
" tabsize 를 size 로 변경
function SetTab(size)
	execute "set shiftwidth=".a:size
	execute "set tabstop=".a:size
	execute "set softtabstop=".a:size
endfunction
" =========================================================================
" =  자동 실행 (autocmd)                                                  =
" =========================================================================
" terminal buffer 에 진입했을 때 mode 를 normal 에서 terminal 모드로 변경
" 또한 줄번호를 없앤다.
autocmd BufEnter term://* start " do nothing
autocmd TermOpen term://* execute ":set nonu"

" 파일 명이 *.S 로 시작하면 GAS 문법 강조 사용
autocmd BufRead,BufNew *.S execute ":set ft=gas"

" 버퍼를 저장할때 파일 이름이 .c, .h 와 같다면 ctags 명령어를 실행
" autocmd BufWritePost *.c,*.h silent! !ctags -R &

" 윈도우를 나갈 때 뷰를 저장하고,
autocmd BufWinLeave *.c,*.h mkview

" 윈도우에 들어갈 땐 뷰를 로드한다. (커서위치 저장)
" silent! 는 loadview 중 발생하는 에러를 억압(suppress) 한다.
autocmd BufWinEnter *.c,*.h silent! loadview

" 활성화된 버퍼만 라인 번호 표시 (단, 확장자는 .c 혹은 .h 일때만 동작)
autocmd BufEnter * if (&filetype == 'c' || &filetype == 'cpp')
	\| set number
\| endif

" 버퍼에서 나갈 땐 줄 번호를 지운다.
autocmd BufLeave * if (&filetype == 'c' || &filetype == 'cpp')
	\| set nonumber
\| endif
" =========================================================================
" =  플러그인 설정                                                        =
" =========================================================================
" ------------------------------------
" coc 설정
" ------------------------------------
"  nvim 버전이 0.5.0 이상이며, 패치가 8.1.1564 이상이라면
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " 사인(sign column) 열을 숫자 열과 합침
  set signcolumn=number
endif
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" coc extensions
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-import-cost', 'coc-eslint', 'coc-html', 'coc-css', 'coc-emmet', 'coc-pyright', 'coc-phpls', 'coc-angular', 'coc-git', 'coc-clangd']
let g:coc_global_extensions += ['https://github.com/andys8/vscode-jest-snippets']
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" 코드 탐색 단축키

" 커서 아래의 토큰을 강조
autocmd CursorHold * silent call CocActionAsync('highlight')
" ------------------------------------
" nvim-treesitter 설정
" ------------------------------------
" ------------------------------------
" tagbar 설정
" ------------------------------------
" tagbar 생성 시 우측 하단에 위치하게끔 생성
let g:tagbar_position = 'rightbelow'
" F12 누를 경우 tagbar 생성
nmap gt :TagbarToggle<CR>
" ------------------------------------
" ConqueTerm 설정
" 창 전환 시 ConqueTerm 에 Insert 상태로 활성화
" let g:ConqueTerm_InsertOnEnter = 1
" ConqueTerm 이 Insert 모드인 상태에서도 <Ctrl>+w, W 를 사용 가능하게
" let g:ConqueTerm_CWInsert = 1
" ------------------------------------
" vim-airline 설정
" ------------------------------------
" powerline-font 활성화
let g:airline_powerline_fonts = 1
" luna 테마 사용
let g:airline_theme = 'luna'
" tabline 에 파일명만 출력 되도록 설정
let g:airline#extensions#tabline#formatter = 'unique_tail'
" 창의 상단에 표시되도록 설정
" let g:airline_statusline_ontop = 1
" 탭라인 허용
let g:airline#extensions#tabline#enabled = 1
" 항상 tabline 을 표시
let g:airline#extensions#tabline#show_tabs = 1
" ------------------------------------
" NERDTree 설정
" ------------------------------------
" 창 크기(가로)를 20 으로 설정
let g:NERDTreeWinSize=30

syntax on
set background=dark
set nu                                                                                           
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline

" 한글 인코딩 사용
set fencs=ucs-bom,utf-8,cp949

" 언어 강제로 영어로 세팅
set langmenu=en_US.UTF-8
language messages en_US.UTF-8
