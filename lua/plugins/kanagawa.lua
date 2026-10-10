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
          -- 取消下面两行的注释，背景变成纯黑
          -- Normal = { bg = "#000000" },
          -- NormalFloat = { bg = "#000000" },
        }
      end,
      theme = "dragon",
      background = {
        dark = "dragon",   -- darker variant
        light = "lotus",
      },
    })
    vim.cmd.colorscheme("kanagawa")
  end,
}
