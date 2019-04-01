call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/deoplete.nvim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'easymotion/vim-easymotion'
Plug 'othree/xml.vim'
call plug#end()

set hidden
set encoding=UTF-8

nnoremap <silent> gd :LspDefinition <CR>
nnoremap <silent> gD :LspDeclaration <CR>
nnoremap <silent> <F2> :LspRename <CR>

tnoremap <Esc> <C-\><C-n>
tnoremap <M-[> <Esc>

nnoremap <F7>      :bp<CR>
inoremap <F7> <ESC>:bp<CR>
nnoremap <F8>      :bn<CR>
inoremap <F8> <ESC>:bn<CR>

nnoremap <F9> :NERDTreeToggle<CR>
nnoremap <Space> i_<Esc>r

set pastetoggle=<F3>

function FindProjectRoot(bufpath)
    let t1=lsp#utils#find_nearest_parent_file(a:bufpath, 'compile_commands.json')
    let t2=lsp#utils#find_nearest_parent_file(a:bufpath, 'compile_flags.txt')
    return strlen(t1) > 0 ? t1 : t2
endfunction

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'clangd']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(FindProjectRoot(lsp#utils#get_buffer_path()))},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/vim-lsp.log')
"let g:asyncomplete_log_file = expand('~/asyncomplete.log')

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete_delay', 250)
set completeopt-=preview

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
