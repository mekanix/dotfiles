function! MyQuit(shouldwrite)
  if a:shouldwrite == 'write'
    if &modifiable == '1'
      execute ':w'
    endif
  endif
  call SpaceVim#mapping#close_current_buffer()
  execute ':let buffernum = str2nr(len(filter(range(1, bufnr("$")), "buflisted(v:val)")))'
  if buffernum == 0
    execute ':q'
  endif
endfunction

function! myconfig#after() abort
  nnoremap ZQ :call MyQuit("nowrite")<CR>
  nnoremap ZZ :call MyQuit("write")<CR>

  set clipboard+=unnamed
  set clipboard+=unnamedplus
  set colorcolumn=80
  set foldmethod=syntax
  set foldlevel=99

  augroup Mine
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType make setlocal tabstop=8
  augroup END
endfunction
