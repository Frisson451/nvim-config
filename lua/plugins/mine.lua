return {

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
  },
  {
    "CRAG666/betterTerm.nvim",
    opts = {
      -- your options
    },
  },
  {
    "CRAG666/code_runner.nvim",
    config = function()
      require("code_runner").setup({
        -- Choose default mode (valid modes: tab, float, toggle)
        mode = "float",
        -- Floating window options
        float = {
          -- Key that closes the code runner window
          close_key = "<ESC>",
          -- Floating window border (see ':h nvim_open_win')
          border = "rounded",
          -- Num from 0 - 1 for measurements
          width = 0.8,
          height = 0.8,
          x = 0.5,
          y = 0.5,
        },
        -- File runner commands
        filetype = {
          java = {
            "cd $dir &&",
            "javac $fileName &&",
            "java $fileNameWithoutExt",
          },
          python = "python3 $file",
          typescript = "deno run $file",
          javascript = "node $file",
          rust = {
            "cd $dir &&",
            "rustc $fileName &&",
            "$dir/$fileNameWithoutExt",
          },
          c = function(...)
            local c_base = {
              "cd $dir &&",
              "gcc $fileName -o $fileNameWithoutExt &&",
              "$dir/$fileNameWithoutExt",
            }
            return c_base
          end,
          cpp = {
            "cd $dir &&",
            "g++ $fileName -o $fileNameWithoutExt &&",
            "$dir/$fileNameWithoutExt",
          },
          go = "go run $file",
          sh = "bash $file",
          lua = "lua $file",
          ruby = "ruby $file",
          php = "php $file",
          perl = "perl $file",
          r = "Rscript $file",
        },
        -- Additional project-level runners
        project = {
          ["package.json"] = "npm start",
          ["Cargo.toml"] = "cargo run",
          ["go.mod"] = "go run .",
          ["Makefile"] = "make",
          ["pyproject.toml"] = "python -m pip install -e . && python",
          ["requirements.txt"] = "python",
        },
      })
    end,
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/vaults/personal",
        },
        {
          name = "work",
          path = "~/vaults/work",
        },
      },

      -- see below for full list of options 👇
    },
  },

  -- Tabout plugin - similar to VSCode's tabout extension
  {
    "abecodes/tabout.nvim",
    lazy = false,
    config = function()
      require("tabout").setup({
        tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = "<C-d>", -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = false, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
        },
        ignore_beginning = true, -- if the cursor is at the beginning of a filled element it will rather tab out than shift the content
        exclude = {}, -- tabout will ignore these filetypes
      })
    end,
    dependencies = { -- These are optional
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp",
    },
  },
}
