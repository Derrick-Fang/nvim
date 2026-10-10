return {
  -- LSP server installer
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- clangd uses the one from Xcode Command Line Tools (/usr/bin/clangd)
      ensure_installed = { "pyright" },
    },
  },
  -- LSP config
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Jump-to-definition / references / hover doc on LSP attach
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf, silent = true }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
          vim.keymap.set("n", "gr", function()
            require("telescope.builtin").lsp_references()
          end, vim.tbl_extend("force", opts, { desc = "Find references" }))
          vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
        end,
      })

      -- Diagnostic display (disabled)
      vim.diagnostic.config({
        virtual_text = false,
        signs = false,
        underline = false,
        severity_sort = true,
      })
      -- 彻底关闭所有诊断提示
      vim.diagnostic.enable(false)

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      vim.lsp.config("pyright", { capabilities = capabilities })
      vim.lsp.config("clangd", { capabilities = capabilities })
      vim.lsp.enable({ "pyright", "clangd" })
    end,
  },
}
