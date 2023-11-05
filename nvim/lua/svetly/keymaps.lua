if vim.g.vscode then
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap

    -- Better Navigation
    keymap("n", "<C-l>", ":call VSCodeNotify('workbench.action.navigateRight')<CR>", opts)
    keymap("x", "<C-l>", ":call VSCodeNotify('workbench.action.navigateRight')<CR>", opts)
    keymap("n", "<C-h>", ":call VSCodeNotify('workbench.action.navigateLeft')<CR>", opts)
    keymap("x", "<C-h>", ":call VSCodeNotify('workbench.action.navigateLeft')<CR>", opts)
    keymap("n", "<C-j>", ":call VSCodeNotify('workbench.action.navigateDown')<CR>", opts)
    keymap("x", "<C-j>", ":call VSCodeNotify('workbench.action.navigateDown')<CR>", opts)
    keymap("x", "<C-k>", ":call VSCodeNotify('workbench.action.navigateUp')<CR>", opts)
    keymap("n", "<C-k>", ":call VSCodeNotify('workbench.action.navigateUp')<CR>", opts)

    keymap("n", "gr", "<Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>", { noremap = true })

    keymap("n", "<C-w>-", ":call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>", opts)

    keymap("n", "<Space>", ":call VSCodeNotify('whichkey.show')<CR>", opts)
    keymap("x", "<Space>", ":call OpenWhichKeyInVisualMode()<CR>", opts)

    keymap("x", "<C-P>", ":call OpenVSCodeCommandsInVisualMode()<CR>", opts)

    keymap("n", "gc", "<Plug>VSCodeCommentary", {})
    keymap("x", "gc", "<Plug>VSCodeCommentary", {})
    keymap("o", "gc", "<Plug>VSCodeCommentary", {})
    keymap("n", "gcc", "<Plug>VSCodeCommentaryLine", {})

    -- Simulate same TAB behavior in VSCode
    keymap("n", "<Tab>", ":Tabnext<CR>", opts)
    keymap("n", "<S-Tab>", ":Tabprev<CR>", opts)

    -- Stay in indent mode
    keymap("v", "<", "<gv", opts)
    keymap("v", ">", ">gv", opts)
    keymap("v", "p", '"_dP', opts)

    -- Stay in normal mode when inserting new line
    keymap("n", "oo", 'm`o<Esc>``', opts)
    keymap("n", "OO", 'm`O<Esc>``', opts)

    -- Move text up and down in visual block
    -- Kinda wonky cause no native implementation
    -- fix this
    keymap("x", "<S-j>", ":move '>+1<CR>gv-gv", opts)
    keymap("x", "<S-k>", ":move '<-2<CR>gv-gv", opts)

    -- Workaround for moving over folds
    keymap("n", "j", "gj", {})
    keymap("n", "k", "gk", {})
else
    local opts = { noremap = true, silent = true }
    local term_opts = { silent = true }

    local keymap = vim.api.nvim_set_keymap

    --Remap space as leader key
    keymap("", "<Space>", "<Nop>", opts)
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    -- Modes
    --   normal_mode = "n",
    --   insert_mode = "i",
    --   visual_mode = "v",
    --   visual_block_mode = "x",
    --   term_mode = "t",
    --   command_mode = "c",

    -- Normal --
    -- Better window navigation
    keymap("n", "<C-h>", "<C-w>h", opts)
    keymap("n", "<C-j>", "<C-w>j", opts)
    keymap("n", "<C-k>", "<C-w>k", opts)
    keymap("n", "<C-l>", "<C-w>l", opts)

    -- Navigate buffers
    keymap("n", "<S-l>", ":bnext<CR>", opts)
    keymap("n", "<S-h>", ":bprevious<CR>", opts)

    -- Navigate tabs
    keymap("n", "<Tab>", ":tabn<CR>", opts)
    keymap("n", "<S-Tab>", ":tabp<CR>", opts)

    -- Toggle explorer
    keymap("n", "<leader>e", ":Lex 30<cr>", opts)

    -- Resize with arrows
    keymap("n", "<C-Up>", ":resize -2<CR>", opts)
    keymap("n", "<C-Down>", ":resize +2<CR>", opts)
    keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
    keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

    -- Insert --
    -- Press jk fast to enter
    keymap("i", "jk", "<ESC>", opts)

    -- Visual --
    -- Stay in indent mode
    keymap("v", "<", "<gv", opts)
    keymap("v", ">", ">gv", opts)

    -- Move text up and down
    keymap("v", "<A-j>", ":m .+1<CR>==", opts)
    keymap("v", "<A-k>", ":m .-2<CR>==", opts)
    keymap("v", "p", '"_dP', opts)

    -- Visual Block --
    -- Move text up and down
    keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
    keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
    keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
    keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

    -- Terminal --
    -- Better terminal navigation
    keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
    keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
    keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
end
