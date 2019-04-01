call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'easymotion/vim-easymotion'
"Plug 'othree/xml.vim'
Plug 'acarapetis/vim-colors-github'
call plug#end()


set hidden
set encoding=UTF-8

tnoremap <Esc> <C-\><C-n>
tnoremap <M-[> <Esc>

nnoremap <F7>      :bp<CR>
inoremap <F7> <ESC>:bp<CR>
nnoremap <F8>      :bn<CR>
inoremap <F8> <ESC>:bn<CR>

nnoremap <F9> :NERDTreeToggle<CR>
nnoremap <Space> i_<Esc>r

set pastetoggle=<F3>

set mouse=a

imap jj <Esc>
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set autowrite

highlight ExtraWhitespace ctermbg=darkgreen
match ExtraWhitespace /\s\+$/

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set keymap=russian-jcukenwin
set imsearch=0
set iminsert=0
inoremap <F4> <C-^>

colo github

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nn <silent><buffer> <C-l> :call CocLocations('ccls','$ccls/navigate',{'direction':'D'})<cr>
nn <silent><buffer> <C-k> :call CocLocations('ccls','$ccls/navigate',{'direction':'L'})<cr>
nn <silent><buffer> <C-j> :call CocLocations('ccls','$ccls/navigate',{'direction':'R'})<cr>
nn <silent><buffer> <C-h> :call CocLocations('ccls','$ccls/navigate',{'direction':'U'})<cr>
nn <silent> K :call CocActionAsync('doHover')<cr>
