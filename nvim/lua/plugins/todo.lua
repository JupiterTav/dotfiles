local _colors = require("koda").get_palette("dark")

return
{
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    colors = {
    error = { "DiagnosticError", "ErrorMsg", _colors.red },
    warning = { "DiagnosticWarn", "WarningMsg", _colors.yellow },
    info = { "DiagnosticInfo", _colors.blue},
    hint = { "DiagnosticHint", _colors.green },
    default = { "Identifier", _colors.purple },
    test = { "Identifier", _colors.pink }
  },
  },
}
