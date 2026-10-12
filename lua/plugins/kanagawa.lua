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

          -- 成员变量/属性: obj.attr / self.x  (waveAqua1)
          ["@variable.member"] = { fg = colors.palette.waveAqua1 },
          ["@property"] = { link = "@variable.member" },
          ["@lsp.type.property"] = { link = "@variable.member" },

          -- 类名出现在任意位置 (a = Node() 的 Node) 与类型声明同色
          ["@lsp.type.class"] = { link = "@type" },
          ["@lsp.type.type"] = { link = "@type" },
          ["@lsp.type.enum"] = { link = "@type" },
          ["@constructor"] = { link = "@type" },
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
