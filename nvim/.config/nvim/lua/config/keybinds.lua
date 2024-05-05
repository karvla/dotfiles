-- Stolen from https://github.com/miklhh/.dotfiles    
---- Map tab to the above tab complete functions
--vim.api.nvim_set_keymap('i', '<C-n>', 'v:lua.tab_complete()', { expr = true })
--vim.api.nvim_set_keymap('s', '<C-n>', 'v:lua.tab_complete()', { expr = true })
--vim.api.nvim_set_keymap('i', '<C-p>', 'v:lua.s_tab_complete()', { expr = true })
--vim.api.nvim_set_keymap('s', '<C-p>', 'v:lua.s_tab_complete()', { expr = true })
--
---- Map compe confirm and complete functions
--vim.api.nvim_set_keymap('i', 'ii', 'v:lua.on_ii()', { expr = true })
--vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })
--
--vim.api.nvim_set_keymap('i', '<C-h>', 'v:lua.jump_prev()', { expr = true })
--vim.api.nvim_set_keymap('s', '<C-h>', 'v:lua.jump_prev()', { expr = true })
--vim.api.nvim_set_keymap('i', '<C-l>', 'v:lua.jump_next()', { expr = true })
--vim.api.nvim_set_keymap('s', '<C-l>', 'v:lua.jump_next()', { expr = true })

local function lsp_set_keymap(...) vim.api.nvim_set_keymap(...) end
local lsp_opts =  { noremap=true, silent=true }
-- See `:help vim.lsp.*` for documentation on any of the below functions
lsp_set_keymap('n', '<leader>i', '<cmd>lua vim.lsp.buf.hover()<CR>', lsp_opts)
lsp_set_keymap('n', '<leader>lw', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', lsp_opts)
lsp_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', lsp_opts)
lsp_set_keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', lsp_opts)
lsp_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', lsp_opts)
lsp_set_keymap('n', '<leader>lj', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', lsp_opts)
lsp_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', lsp_opts)
lsp_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', lsp_opts)
lsp_set_keymap('n', '<leader>lJ', '<cmd>Telescope lsp_workspace_symbols<CR>', lsp_opts)

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.scrolloff = 15
vim.opt.updatetime = 50
require("flutter-tools").setup{} -- use defaults
--lsp_set_keymap('i', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', lsp_opts)
