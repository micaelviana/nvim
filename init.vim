"=======================================================================
  "_   _ ______ ______      _______ __  __ 
 "| \ | |  ____/ __ \ \    / /_   _|  \/  |
 "|  \| | |__ | |  | \ \  / /  | | | \  / |
 "| . ` |  __|| |  | |\ \/ /   | | | |\/| |
 "| |\  | |___| |__| | \  /   _| |_| |  | |
 "|_| \_|______\____/   \/   |_____|_|  |_|
"=======================================================================
call plug#begin('~/.vim/plugged')
"-----Basico----
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Autocomplete
Plug 'jiangmiao/auto-pairs' "Insert parens in pair
Plug 'ctrlpvim/ctrlp.vim' "Fuzzy file finder
Plug 'preservim/nerdtree' "Sidebar
Plug 'itchyny/lightline.vim' "Lightline statusbar
Plug 'preservim/nerdcommenter' "Assistant to insert comments
Plug 'sheerun/vim-polyglot' "Syntax of various languages for VIM
"-----Snippets----
Plug 'SirVer/ultisnips' "Create new snippets
Plug 'honza/vim-snippets' "Collection of snippets for various languages
"-----Temas----
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'rakr/vim-one'
"-----Extras----
Plug 'christoomey/vim-tmux-navigator' "More friendly navigation between splits
Plug 'mg979/vim-visual-multi', {'branch': 'master'} "Multiple cursors
Plug 'mhinz/vim-startify' "Start screen
Plug 'psliwka/vim-smoothie' "Smooth scrolling for Vim done right
Plug 'ryanoasis/vim-devicons' "Icons for VIM
call plug#end()

"----------CONFIGURACOES GERAIS----------
set hidden "Keep multiple buffers open
set number relativenumber "Display line numbers
set cursorline "highlit cursor line
set mouse=a "enable mouse interaction
set ignorecase "disable case sensitive in search and commands
set inc=split "command preview
set splitright splitbelow "define which way the splits open
syntax enable "colorir corretamente a sintaxe de linguagens
set clipboard=unnamedplus "clipboard entre o neovim e os outros progranas
set expandtab shiftwidth=4 autoindent "tabs expandem para 4 espacos, manter indentacao da linha anterior
if has('termguicolors')  "habilitar cores do terminal
    set termguicolors  
endif

autocmd BufEnter *.png,*.jpg,*gif exec "! xdg-open ".expand("%" ) | :bw "Abrir arquivos de imagens a partir do Vim no Linux

"definicao de tema
"let g:material_terminal_italics = 1
"let g:material_theme_style = 'darker'
" colorscheme material

colorscheme one
set background=dark " for the dark version
" set background=light " for the light version
let g:one_allow_italics = 1 " I love italic for comments

"----------DEFINICAO DE TECLAS DE ATALHO ----------
"leader+s para salvar, ctrl+x para fechar, ctrl+a seleciona tudo
nnoremap <leader>s :w <cr>
nnoremap <silent> <c-x> :x <cr>
map <C-a> <esc>ggVG<CR>
"atalhos para splits (de YADR dotfiles)
nnoremap <silent> ss <C-w>s
nnoremap <silent> vv <C-w>v
"recarregar o Vim File 
nnoremap <leader>rv :source $HOME/.config/nvim/init.vim <cr>

"----------CONFIGURACOES DE PLUGINS----------
"NERDTree: ativar e desativar a barra
map <C-t> :NERDTreeToggle<CR>

"lightline
set noshowmode "pra nao ficar redundante no modo de insercao
"definicao de tema
let g:lightline = { 'colorscheme': 'one' }

"NERDCommenter: comentar e descomentar linhas
map // <plug>NERDCommenterToggle

"UltiSnips: habilitar split para edicao de snippet
let g:UltiSnipsEditSplit='vertical'

"Preferências do Startify
"Baseado em: https://github.com/benbrastmckie/.config/

let g:startify_custom_header = [
 \ '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
 \ '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
 \ '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
 \ '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
 \ '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
 \ '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
 \]
 
 let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ '~/repo',
            \ ]
            
let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   Files']            },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ ]            
                                                  
let g:webdevicons_enable_startify = 1
function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

    
"=============================================================================================================
"FROM CONQUER OF COMPLETION
if has('unix')
    source $HOME/.config/nvim/coc.vim
else
    source C:/Users/Micael/AppData/Local/nvim/coc.vim
endif
