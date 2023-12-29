return {
  -- Create annotations with one keybind, and jump your cursor in the inserted annotation
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>cc",
        function()
          require("neogen").generate({})
        end,
        desc = "Neogen Comment",
      },
    },
    opts = { snippet_engine = "luasnip" },
  },

  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  -- Refactoring tool
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor()
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {},
  },

  -- Go forward/backward with square brackets
  {
    "echasnovski/mini.bracketed",
    event = "BufReadPost",
    config = function()
      local bracketed = require("mini.bracketed")
      bracketed.setup({
        file = { suffix = "" },
        window = { suffix = "" },
        quickfix = { suffix = "" },
        yank = { suffix = "" },
        treesitter = { suffix = "n" },
      })
    end,
  },

  -- Better increase/descrease
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.constant.new({ elements = { "let", "const" } }),
        },
      })
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    cmd = "SymbolsOutline",
    opts = {
      position = "right",
    },
  },

  {
    "nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- Surrounding
  -- {
  --   "echasnovski",
  --   keys = function(_, keys)
  --     -- Populate the keys based on the user's options
  --     local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
  --     local opts = require("lazy.core.plugin").values(plugin, "opts", false)
  --     local mappings = {
  --       { opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
  --       { opts.mappings.delete, desc = "Delete surrounding" },
  --       { opts.mappings.find, desc = "Find right surrounding" },
  --       { opts.mappings.find_left, desc = "Find left surrounding" },
  --       { opts.mappings.highlight, desc = "Highlight surrounding" },
  --       { opts.mappings.replace, desc = "Replace surrounding" },
  --       { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
  --     }
  --     mappings = vim.tbl_filter(function(m)
  --       return m[1] and #m[1] > 0
  --     end, mappings)
  --     return vim.list_extend(mappings, keys)
  --   end,
  --   opts = {
  --     mappings = {
  --       add = "gsa", -- Add surrounding in Normal and Visual modes
  --       delete = "gsd", -- Delete surrounding
  --       find = "gsf", -- Find surrounding (to the right)
  --       find_left = "gsF", -- Find surrounding (to the left)
  --       highlight = "gsh", -- Highlight surrounding
  --       replace = "gsr", -- Replace surrounding
  --       update_n_lines = "gsn", -- Update `n_lines`
  --     },
  --   },
  -- },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
}
