local M = {}
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
    ["<leader>di"] = {
      "<cmd> DaptStepInto <CR>",
      "Step Into",
    },
    ["<leader>do"] = {
      "<cmd> DapStepOver <CR>",
      "Step Over",
    },
    ["<leader>dO"] = {
      "<cmd> DapStepOut <CR>",
      "Step Out",
    },
  }
}

M.clangformat = {
  plugin = true,
  n = {
    ["<leader>cf"] = {
      "<cmd> ClangFormat <CR>",
      "Format file using clang formatter",
    }
  }
}

M.cmaketools = {
  plugin = true,
  n = {
    ["<leader>cb"] = {
      "<cmd> CMakeBuild <CR>",
      "Build a project using CMake"
    },
    ["<leader>cr"] = {
      "<cmd> CMakeRun <CR>",
      "Run a project using CMakeTools"
    }
  }
}

M.lazygit = {
  plugin = true,
  n = {
    ["<leader>lg"] = {
      "<cmd> LazyGit <CR>",
      "Open LazyGit"
    }
  }
}

M.copilot = {
  plugin = true,
  n = {
    ["<leader>ce"]= {
      "<cmd> Copilot enable <CR>",
      "Enable Copilot inline suggestions"
    },
    ["<leader>cd"] = {
      "<cmd> Copilot disable <CR>",
      "Disable Copilot inline suggestions"
    },
    ["<leader>cp"] = {
      "<CMD> Copilot panel <CR>",
      "Open a panel with up to 10 completions"
    },
    ["<leader>cg"] = {
      "<silent><script><expr>copilot#Accept<CR>",
      "Accept a Copilot expression"
    }
  }
}
return M

