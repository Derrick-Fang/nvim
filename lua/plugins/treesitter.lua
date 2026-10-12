return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local parsers = {
      "lua", "vim", "vimdoc",
      "c", "cpp", "cmake", "make",
      "python", "javascript", "typescript", "tsx",
      "json", "yaml", "toml", "markdown", "markdown_inline",
      "bash", "html", "css", "regex",
    }

    -- 安装缺失的 parser
    require("nvim-treesitter").setup({})
    local installed = require("nvim-treesitter").get_installed()
    local to_install = vim.tbl_filter(function(p)
      return not vim.list_contains(installed, p)
    end, parsers)
    if #to_install > 0 then
      require("nvim-treesitter").install(to_install)
    end

    -- 打开文件时启用 treesitter 高亮
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
