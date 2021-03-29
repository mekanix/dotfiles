function! MyQuit(shouldwrite)
  execute ':let buffernumstr = len(filter(range(1, bufnr("$")), "buflisted(v:val)"))'
  execute ':let buffernum = str2nr(buffernumstr)'
  if a:shouldwrite == 'write'
    if &modifiable == '1'
      execute ':w'
    endif
  endif
  if buffernum < 2
    execute ':q'
  else
    call SpaceVim#mapping#close_current_buffer()
  endif
endfunction


function! myconfig#after() abort
  nnoremap ZQ :call MyQuit("nowrite")<CR>
  nnoremap ZZ :call MyQuit("write")<CR>

  let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = '~/.SpaceVim.d/UltiSnips'
  set foldmethod=indent
  set foldlevel=99
  set tabstop=2
  set expandtab
endfunction
