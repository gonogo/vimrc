"Use Pathogen
au VimEnter *  NERDTree
execute pathogen#infect()
"syntax on "syntax highlighting
syntax enable
set background=dark
colorscheme solarized
"colorscheme darkblue " set guifont=letter\ gothic\ std\ medium:h21
nnoremap qw :silent! normal <SPACE><SPACE><SPACE><SPACE><SPACE>mpea'<Esc>bi'<Esc>`pl 
set number
set guifont=Bloomberg\ Fixed\ Unicode\ C:h16 
"set guifont=Sauce\ Code\ Powerline:h16
set clipboard=unnamed " Yanks to clipboard - MacVim only.
"folding
set foldenable
set foldmethod=indent
set foldcolumn=4
"indenting and tabs
set autoindent
set tabstop=4
set shiftwidth=4
" run maximised
if has("gui_running") " GUI is running or is about to start
  set lines=999 columns=999 " Maximize gvim window
endif
set printoptions=portrait:n
set autochdir "sets working directory to the current file
" autocmd bufenter * silent! lcd %:p:h " sets current wd to the file you're editing
set visualbell           " don't beep
set noerrorbells         " don't beep

command! -nargs=* Wrap set wrap linebreak nolist "wrap properly when writing
" make up and down behave normally on wrapped lines.
map <Up> gk
map <Down> gj
map! <leader>§ ✗
" This one is for ticking stuff.
map! § ✓ 
" this one is for inserting the date at the cursor
"map! § <SPACE><BACKSPACE><ESC>m'A<C-R>=strftime('%H:%M:%S')<CR><CR><CR>
"because I'm too lazy to hit ctrl-w to move around different windows.
map <leader>w <C-W>
" Edit vimrc file
nmap <silent> <leader>ev :e ~/.vim/vimrc<CR> 
nmap <silent> <leader>ej :e ~/Documents/journal.txt<CR>G<ESC>m'A<C-R>=strftime('%a %d %b %Y %H:%M')<CR> 
" ... and then source it (execute each line from the file as it would on startup)
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>x :!python %<CR>
nmap <silent> <leader>X :w \| !python %<CR>
function! OpenFilesTab() "Opens netrw in new tab at txtFiles and moves cursor to below banner
	:NERDTree ~/Documents/txtFiles	
endfunction

function! HandleURL()
	  "opens a browser at the URL on the line.
	  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
	  echo s:uri
	  if s:uri != ""
	    silent exec "!open '".s:uri."'"
	  else
	    echo "No URI found in line."
	  endif
endfunction

function! Google()
	" Googles for the word under the cursor.
	  let URL = "https:\/\/www.google.co.uk\/search?q=" . getline(".")
	  let s:uri = matchstr(URL, '[a-z]*:\/\/[^ >,;]*')
	  echo URL
	  echo s:uri
	  if s:uri != ""
	    silent exec "!open '".s:uri."'"
	  else
	    echo "No URI found in line."
	  endif
endfunction

"proper experimental
function! MakeMenu()
	if input("coffee or beer\n") == "beer"
		if input("Pilsen or Bitter?\n") == "pilsen"
			echo "\nCheers!"
		endif
	endif
endfunction
function! GetUserInputSingleChar()
	let c = nr2char(getchar())
		echo c
endfunction
nmap <silent> <leader>m :call MakeMenu()<CR>
nmap <silent> <leader>M :call GetUserInputSingleChar()<CR>
nmap <silent> <leader>d :call OpenFilesSplit()<CR>
nmap <silent> <leader>D :call OpenFilesTab()<CR>
map <leader>u :call HandleURL()<cr>
map <leader>g :call Google()<cr>
autocmd VimEnter * wincmd w
