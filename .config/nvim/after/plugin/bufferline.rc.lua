local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    show_tab_indicators = true,
  },
  highlights = {
    separator = {
      fg = '#073642', -- Color of Solarized theme
      bg = '#002b36',
    },
    separator_selected = {
      fg = '#073642',
    },
    background = {
      fg = '#657b83',
      bg = '#002b36'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true,
    },
    fill = {
      bg = '#073642'
    }
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
vim.keymap.set('n', '<Leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', {})
vim.keymap.set('n', '<Leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', {})
vim.keymap.set('n', '<Leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', {})
vim.keymap.set('n', '<Leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', {})
vim.keymap.set('n', '<Leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', {})
vim.keymap.set('n', '<Leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>', {})
vim.keymap.set('n', '<Leader>9', '<Cmd>BufferLineGoToBuffer -1<CR>', {})
