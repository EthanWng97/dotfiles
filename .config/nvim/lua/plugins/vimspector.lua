vim.cmd [[
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""
    " General Setting for vimspector
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
    let g:vimspector_install_gadgets = [
        \ 'CodeLLDB',
        \ 'debugpy',
        \ ]
    nmap <A-d> <Plug>VimspectorContinue
    nmap <A-S-d> <Plug>VimspectorRestart
    nmap <A-i> <Plug>VimspectorBalloonEval
    xmap <A-i> <Plug>VimspectorBalloonEval
    nmap <A-i> :call AddToWatch()<CR>

    func! AddToWatch()
        let word = expand("<cexpr>")
        call vimspector#AddWatch(word)
    endfunction
    let g:vimspector_base_dir = expand('$HOME/.config/nvim/vimspector-config')
]]
