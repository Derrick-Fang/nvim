return {
  "rebelot/kanagawa.nvim",
  lazy = false,     -- load at startup
  priority = 1000,  -- load before other UI plugins
  config = function()
    require("kanagawa").setup({
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      colors = {
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors)
        return {
          -- 深蓝偏黑背景
          Normal = { bg = "#0a0e14" },
          NormalFloat = { bg = "#0a0e14" },
          NormalNC = { bg = "#0a0e14" },
        }
      end,
      theme = "wave",
      background = {
        dark = "wave",     -- default variant
        light = "lotus",
      },
    })
    vim.cmd.colorscheme("kanagawa")
  end,
}
