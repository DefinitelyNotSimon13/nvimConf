local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "cpplint",
        "cpptools",
        "codelldb",
        "cmakelang",
        "cmake-language-server",
        "cmakelint",
      }
    }
  },
  {
    "rhysd/vim-clang-format",
    ft = { "cpp", "c" },
    config = function(_, _)
      require("core.utils").load_mappings("clangformat")
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "folke/neodev.nvim",
    opts = {},
    config = function()
      local neodev = require("neodev")
      neodev.setup({
        library = { plugins = { "nvim-dap-ui" }, types = true }
      })
    end,
  },
  {
    'Civitasv/cmake-tools.nvim',
    config = function()
      require("custom.configs.cmake-toolsconfig")
      require("core.utils").load_mappings("cmaketools")
    end,
    event = "VeryLazy",
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    config = function()
      require("custom.configs.oil-config")
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
  },
  {
    "kdheepak/lazygit.nvim",
    config = function()
      require("core.utils").load_mappings("lazygit")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy"
  },
  {
    "zbirenbaum/copilot.lua",
    cnmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("core.utils").load_mappings("copilot")
      require("copilot.suggestion").toggle_auto_trigger()
      require("custom.configs.copilot-config")
    end,
  },
  {
    "wakatime/vim-wakatime",
    lazy = false
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    config = function()
      require("core.utils").load_mappings("vimTmuxNavigator")
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("custom.configs.noice-config")
    end
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "epwalsh/pomo.nvim"
    },
    opts = {
      workspaces = {
        {
          name = "Notes",
          path = "~/4_Notes",
        },
      },
    },
  },
  {
    "z0mbix/vim-shfmt",
    lazy = true,
    ft = "sh",
    config = function()
      require("custom.configs.shfmt-config")
      require("core.utils").load_mappings("shfmt")
    end,
  },
  {
    "itspriddle/vim-shellcheck",
    lazy = true,
    ft = "sh",
    config = function ()
      require("custom.configs.shellcheck-config")
      require("core.utils").load_mappings("shellcheck")
    end
  },
  {
    "Fymyte/rasi.vim",
    ft = "rasi",
    run = "TSInstall rasi",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  }
}
return plugins
