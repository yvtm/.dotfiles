local M = {}

M.setup = function()
  require("catppuccin").setup({
    transparent_background = true,
    dim_inactive = {
      enabled = true,
      shade = "dark",
      percentage = 0.60,
    },
    integrations = {
      cmp = true,
      gitsigns = true,
      treesitter = true,
      telescope = true,
    },
  })
  vim.cmd.colorscheme("catppuccin-mocha")
end

return M
