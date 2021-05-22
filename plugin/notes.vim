if !executable('rg')
  echoerr '`rg` is not installed. See https://github.com/BurntSushi/ripgrep for installation instructions.'
  finish
endif

if !exists('g:notes_path')
  echoerr '`g:notes_path` is not defined.'
  finish
endif

let s:path = get(g:, 'notes_path', '')
let s:notes_daily_extension = get(g:, 'notes_daily_extension', '.md')

function! s:newFile() abort
  let filename = input('File name: ')
  if trim(filename) ==# ''
    return
  endif
  let filepath = s:path.'/'.filename
  execute 'edit '.filepath
endfunction

command! NotesNew :call <SID>newFile()

command! NotesDaily :execute 'edit '.s:path.'/'.strftime("%F").s:notes_daily_extension

command! -bang -nargs=* NotesSearch
      \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,
      \ fzf#vim#with_preview({'dir': s:path}), <bang>1)

command! NotesFiles :execute 'Files! '.s:path
