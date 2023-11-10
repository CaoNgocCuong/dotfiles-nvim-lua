local status, nvim_tree = pcall(require, 'nvim-tree')

if not status then
  return
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function on_attach_custom(bufnr)
  local api = require "nvim-tree.api"

  -- default mappings here
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '?', api.tree.toggle_help)
  vim.keymap.set('n', '<C-p>', api.node.open.preview)

  -- Open new buffer
  vim.keymap.set('n', 'T', api.node.open.tab)

  -- Close parent buffer
  vim.keymap.set('n', ';', function()
    if vim.bo.filetype == 'NvimTree' then
      api.node.navigate.parent_close()
    else
      -- Perform your custom here in non-NvimTree
    end
  end)

  -- changed to current working directory
  vim.keymap.set('n', 't', function()
    local node = api.tree.get_node_under_cursor()

    if node and node.type == 'directory' then
      vim.fn.execute(':cd ' .. vim.fn.fnameescape(node.absolute_path))
    end
  end)
end

nvim_tree.setup({
  on_attach = on_attach_custom,
  disable_netrw = true,
  reload_on_bufenter = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    centralize_selection = true,
    width = 50,
    side = "left",
  },
})

vim.keymap.set('n', '<Space>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', ':NvimTreeFocus<CR>', { noremap = true, silent = true })

-- Auto close NvimTree when last buffer closed
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
  pattern = "NvimTree_*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then
      vim.cmd("confirm quit")
    end
  end
})
