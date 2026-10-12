return {
  "brianhuster/live-preview.nvim",
  ft = { "markdown", "html", "asciidoc" },
  keys = {
    { "<leader>lp", "<cmd>LivePreview start<cr>", desc = "Live preview start" },
    { "<leader>lc", "<cmd>LivePreview close<cr>", desc = "Live preview close" },
  },
  opts = {
    port = 5500,         -- 本地服务端口
    autokill = true,     -- 关闭 buffer 时自动停止服务
    browser = "default", -- 使用系统默认浏览器
    dynamic_root = true, -- 预览其他文件时以该文件所在目录为根
    sync_scroll = true,  -- 编辑器与浏览器滚动同步
  },
}
