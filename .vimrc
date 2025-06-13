
" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'bfrg/vim-cpp-modern'
Plug 'tpope/vim-obsession'
Plug 'erietz/vim-terminator', {'branch': 'main'}
Plug 'liuchengxu/vim-clap'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end() 

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

noremap cls :noh<CR>
noremap J mzJ`z

noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

nnoremap y "+y
vnoremap y "+y

nnoremap p "+p
vnoremap p "+p

nnoremap Y "+Y

nnoremap d "+d
vnoremap d "+d

nnoremap D "+D
vnoremap D "+D

nnoremap x "+x
vnoremap x "+x

nnoremap c "+c
vnoremap c "+c

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

set nocompatible
set relativenumber
set number
set noantialias
set guifont=Menlo\ Bold:h28 
set background=light
set equalprg=xmllint\ --format\ -

let mapleader = " "

syntax on

colorscheme rosepine

set cursorline

set shiftwidth=4

set tabstop=4

set expandtab

set nobackup

set scrolloff=10

set nowrap

set incsearch

set ignorecase

set smartcase

set showcmd

set showmode

set showmatch

set hlsearch

set history=1000

filetype on

filetype plugin on

filetype indent on

set wildmenu

set wildmode=list:longest

set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" CP CREATE TEMPLATE FILE

function! CreateAndMove(param)
    " Save the current working directory
    let l:current_directory = getcwd()

    " Assume the file is always 'main.cpp' for simplicity
    let l:filename = './main.cpp'

    " Change the current working directory to the directory of the current buffer
    execute 'lcd %:p:h'

    " Generate the message with filename, date, time, and author's name
    let l:message = "/*\n\tFile: " . a:param . "\n\tDate and Time Created: " . strftime("%Y-%m-%d %H:%M:%S") . "\n\tAuthor: Rahul M. Navneeth\n*/\n"

    " Read the existing content of the file
    let l:existing_content = join(readfile(l:filename), "\n")

    " Concatenate the message and existing content
    let l:new_content = l:message . "\n" . l:existing_content

    " Write the new content to the file
    call writefile(split(l:new_content, "\n"), a:param)

    " Edit the new file
    execute 'e ' . a:param

    " Move the cursor (the example moves it to line 93)
    execute 'normal! 93G'

    " Restore the original working directory
    execute 'lcd ' . l:current_directory
endfunction

set autoread

command! -nargs=1 C call CreateAndMove(<f-args>)

function! OpenFile(filename)
    " Use grep to find the files that match the given filename pattern
    let l:cmd = "grep -rl " . a:filename . " *"
    let l:files = split(system(l:cmd), "\n")

    " Filter out empty lines
    let l:files = filter(l:files, 'v:val != ""')

    if len(l:files) == 0
        echo "No files found."
    elseif len(l:files) == 1
        " If only one file is found, open it directly
        execute 'edit ' . l:files[0]
    else
        " If multiple files are found, let the user select
        let i = 0
        let l:choices = []
        for f in l:files
            let i += 1
            call add(l:choices, i . '. ' . f)
        endfor
        let l:choice = inputlist(l:choices)
        if l:choice >= 1 && l:choice <= len(l:files)
            execute 'edit ' . l:files[l:choice - 1]
        endif
    endif
endfunction

command! -nargs=1 O call OpenFile(<q-args>)

set guioptions=

function! RunCppProgram()
    let filename = expand('%:p')
    let basename = fnamemodify(filename, ':t:r')

    if filename =~ '\.cpp$'
        let compile_command = 'g++ -std=c++17 ' . filename . ' -o main 2> output.txt'
        let compile_result = system(compile_command)
        if bufexists("output.txt")
            checktime output.txt
        endif
        if v:shell_error == 0
            let timeout_command = 'ulimit -t 5 && (./main || echo "TLE" > output.txt)'
            call system(timeout_command)
            if bufexists("output.txt")
                checktime output.txt
            endif
        else
            echo 'Compilation failed'
        endif
    else
        echo 'Current file is not a C++ source file.'
    endif
endfunction

command! Com call RunCppProgram()

set tabpagemax=99

function! CloseWindowOrQuit()
    if winnr('$') == 1
        quit
    else
        close
    endif
endfunction

nnoremap <D-w> :call CloseWindowOrQuit()<CR>
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}
