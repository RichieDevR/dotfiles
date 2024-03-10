return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
    { "zbirenbaum/copilot.lua", enabled = false },
  },
}
