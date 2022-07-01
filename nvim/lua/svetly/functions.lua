if vim.g.vscode then
    vim.cmd([[
        function! OpenWhichKeyInVisualMode()
            normal! gv
            let visualmode = visualmode()
            if visualmode == "V"
                let startLine = line("v")
                let endLine = line(".")
                call VSCodeNotifyRange("whichkey.show", startLine, endLine, 1)
            else
                let startPos = getpos("v")
                let endPos = getpos(".")
                call VSCodeNotifyRangePos("whichkey.show", startPos[1], endPos[1], startPos[2], endPos[2], 1)
            endif
        endfunction
    ]])

    vim.cmd([[
        function! OpenVSCodeCommandsInVisualMode()
            normal! gv
            let visualmode = visualmode()
            if visualmode == "V"
                let startLine = line("v")
                let endLine = line(".")
                call VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
            else
                let startPos = getpos("v")
                let endPos = getpos(".")
                call VSCodeNotifyRangePos("workbench.action.showCommands", startPos[1], endPos[1], startPos[2], endPos[2], 1)
            endif
        endfunction
    ]])

    vim.cmd([[hi LightspeedCursor gui=reverse]]) -- Fix for lightspeed cursor
else

end