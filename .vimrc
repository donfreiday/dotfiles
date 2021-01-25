"Install plugin management via vim-plug if not already installed
"https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" PLUGINS
call plug#begin('~/.vim/plugged')

"Auto-completion via vim-lsc with added features from VimCompleteMe, 
"run :PlugInstall to install (handled by above command upon initial install)
Plug 'natebosch/vim-lsc'
Plug 'ajh17/VimCompletesMe'

" Initialize plugin system
call plug#end()

" Use all the default keymaps for autocomplete
let g:lsc_auto_map = v:true

" Don't forget to install the relevant language servers
" npm i -g bash-language-server
" https://github.com/bash-lsp/bash-language-server
"
"
"
"
" Map a filetype to the command that starts the language server for that
" filetype in your vimrc:
let g:lsc_server_commands = {'bash': 'bash-language-server'}
