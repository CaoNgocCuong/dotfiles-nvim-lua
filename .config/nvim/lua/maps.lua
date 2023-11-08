local keymap = vim.keymap

local opts = { noremap = true, silent = true }

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Move text up and down
keymap.set('n', '<A-j>', '<Esc>:m .+1<CR>', opts)
keymap.set('n', '<A-k>', '<Esc>:m .-2<CR>', opts)
keymap.set('v', '<A-j>', ':m .+1<CR>', opts)
keymap.set('v', '<A-k>', ':m .-2<CR>', opts)
keymap.set('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
keymap.set('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)

-- Map a key combination to copy the full relative path to the clipboard
vim.api.nvim_set_keymap('n', 'Z', [[:lua vim.fn.setreg('+', vim.fn.expand('%:~:.'))<CR>]],
  { noremap = true, silent = true })
