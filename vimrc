" No es compatible amb vi
set nocompatible
filetype off

"Mapear la tecla <ESC> a jj al mode insert
"imap jj <Esc>
"map <C-n> :NERDTreeToggle<CR>

" Mapejar els tabs al mode normal
map ,t :tabnew
map ,1 :tabprevious
map ,2 :tabnext
map ,f :tabfind
map ,m :tabmove
map ,n :tabnew

" Encoding UTF-8
set encoding=utf-8

"Ignorar Mayúsculas/minúsculas en Búsquedas
"set ic

" Ressalta colors a la sintaxi 
syntax on

" Ignorar aquests tipus de fitxers
set wildignore=*.swp,*.bak,*.pyc,*.pyo,*.class,*.tmp,*~

" Autoi-indent
set autoindent
set smartindent
set copyindent
set smarttab
set shiftround

" Automáticamente llaves guión (c/c++,Java,JavaScript):
set cindent

" Definir els tabs com 4 espais 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Autocompletat de Python
"filetype plugin on
"let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
"let g:pydiction_menu_height = 20

" Fer que l'esborrat funciona com a la resta d'aplicacions
"set backspace=2

" Mostrar sempre la barra d'estat
set laststatus=2

" No destacar els textos buscats al fitxer
" set nohlsearch
set hlsearch

" Buscara a mesura que es tecleja el text
set incsearch

" Indica quins moviments fan que el cursor canviï de línia
"set whichwrap+=<,>,h,l,[,]

" Sense avisos visuals ni sonors
"set vb t_vb=
set novisualbell
set noerrorbells

" Mostrar el parèntesi oposat
set showmatch

" Guarda les 500 últimes comandes
set history=500

" Undo gairebé infinit
set undolevels=1000

" Mostrar comandes parcials a la línia de comandes
set showcmd

" Mostra si s'està en mode inserció o comanda
set showmode

set sidescroll=5

" Mostra les possibilitats d'una comanda
set wildmenu
set wildmode=list:longest,full

" Ignorar majúscules i minúscules a les cerques
"set ignorecase
"set smartcase

" Mostra la línia i el caràcter a on està el cursor a la barra d'estat
set ru

" Posa el número de línia
"set number

" Fa que es puguin veure 256 colors diferents al vim
set t_Co=256

" Posa l'esquema de colors solarized per defecte
colorscheme Monokai

" Ressalta la línia a on es troba el cursor
" set cursorline
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'

" Pathogen - Per gestionar els plugins de vim
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
filetype plugin indent on

let g:airline#extensions#tabline#enabled = 1

" Posar al títol de la finestra el path del fitxer que estem editant
let &titlestring = expand("%:pwd")
if &term == "screen" || &term == "xterm"
	set title
endif

" Mantenir la posició del cursor quan obres un fitxer al mateix lloc a on el tenies al tancar-lo
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview

" Sintaxi per python
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checker_args='--ignore=E501'
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Sintaxi generica
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Sintaxi per php
let g:php_syntax_extensions_enabled = 1
set g:phpcomplete_index_composer_command = composer

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Autocomplete per php
autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
