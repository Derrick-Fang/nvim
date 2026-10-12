return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>um", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle markdown render" },
  },
  opts = {
    -- 渲染模式：normal 下渲染，insert 下显示原文方便编辑
    render_modes = { "n", "c", "t" },
    heading = {
      enabled = true,
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      -- 标题背景色宽度: full=整行, block=文本宽度
      width = "block",
    },
    code = {
      enabled = true,
      style = "full",       -- 代码块背景 + 语言标识
      width = "block",
      right_pad = 1,
    },
    bullet = {
      enabled = true,
      icons = { "●", "○", "◆", "◇" },
    },
    checkbox = {
      enabled = true,
      unchecked = { icon = "󰄱 " },
      checked = { icon = "󰱒 " },
      custom = {
        todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
      },
    },
    quote = { enabled = true, icon = "▋" },
    pipe_table = {
      enabled = true,
      style = "full",       -- 表格按列宽对齐渲染
    },
    link = {
      enabled = true,
      hyperlink = "󰌹 ",
    },
    callout = {
      -- GitHub/Obsidian 风格的 > [!NOTE] 提示块
      note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
      tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownHint" },
      warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
      important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownError" },
    },
    -- 与 conceallevel 配合，隐藏 markdown 语法符号
    win_options = {
      conceallevel = { default = 0, rendered = 3 },
    },
  },
}
