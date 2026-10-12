-- 边打边自动补全（LSP 来源），类似 VSCode 体验
return {
  {
    "saghen/blink.cmp",
    version = "*",
    event = { "InsertEnter" },
    opts = {
      keymap = {
        preset = "enter", -- Enter 确认；Tab/S-Tab、Ctrl-n/p 选择；Ctrl-Space 手动触发
      },
      completion = {
        -- 输入时自动弹出
        trigger = { show_on_keyword = true, show_on_trigger_character = true },
        menu = { auto_show = true },
        documentation = { auto_show = true, auto_show_delay_ms = 300 },
        ghost_text = { enabled = true }, -- 灰色预览文字，类似 Copilot
      },
      sources = { default = { "lsp", "path", "buffer", "snippets" } },
      appearance = { nerd_font_variant = "mono" },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
  },
}
