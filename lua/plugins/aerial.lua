return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>o", "<cmd>AerialToggle!<cr>", desc = "Symbol outline (aerial)" },
    { "{", "<cmd>AerialPrev<cr>", desc = "Previous symbol" },
    { "}", "<cmd>AerialNext<cr>", desc = "Next symbol" },
  },
  opts = {
    -- Prefer LSP, fall back to treesitter
    backends = { "lsp", "treesitter", "markdown", "man" },
    layout = {
      max_width = { 40, 0.2 },
      min_width = 20,
      default_direction = "right",
    },
    -- Attach aerial nav keymaps inside the outline window
    on_attach = function(bufnr)
      vim.keymap.set("n", "{", "<cmd>AerialPrev<cr>", { buffer = bufnr })
      vim.keymap.set("n", "}", "<cmd>AerialNext<cr>", { buffer = bufnr })
    end,
    -- Highlight the symbol under cursor in the source buffer
    highlight_on_hover = true,
    show_guides = true,
    filter_kind = false, -- show all symbol kinds
  },
}
