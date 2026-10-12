return {
  "isakbm/gitgraph.nvim",
  cmd = { "GitGraph" },
  keys = {
    {
      "<leader>gl",
      function()
        require("gitgraph").draw({}, { all = true, max_count = 5000 })
      end,
      desc = "Git Graph (all branches)",
    },
    {
      "<leader>gL",
      function()
        require("gitgraph").draw({}, { max_count = 5000 })
      end,
      desc = "Git Graph (current branch)",
    },
  },
  opts = {
    symbols = {
      merge_commit = "M",
      commit = "*",
      merge_commit_end = "M",
      commit_end = "*",
      -- Advanced symbols
      GVER = "V",
      GHOR = "H",
      GCLD = "<",
      GCRD = ">",
      GCLU = "U",
      GCRU = "U",
      GLRU = "L",
      GLRD = "L",
      GLUD = "X",
      GRUD = "X",
      GFORKU = "U",
      GFORKD = "D",
      GRUDC = "X",
      GRUCD = "X",
      GRSME = "S",
      GDLGE = "D",
      GRTSE = "T",
      GBLGE = "B",
      GELSE = "E",
      GVDE = "V",
      GHDE = "H",
    },
    format = {
      timestamp = "%H:%M:%S %d-%m-%Y",
      fields = { "hash", "timestamp", "author", "branch_name", "tag" },
    },
    hooks = {
      -- 选中提交时查看 diff：有 diffview 就用，没有则显示 commit 信息
      on_select_commit = function(commit)
        if pcall(require, "diffview") then
          vim.cmd(":DiffviewOpen " .. commit.hash .. "^!")
        else
          vim.cmd("!git show --stat " .. commit.hash)
        end
      end,
      on_select_range_commit = function(from, to)
        if pcall(require, "diffview") then
          vim.cmd(":DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
        else
          vim.cmd("!git log --stat " .. from.hash .. "~1.." .. to.hash)
        end
      end,
    },
  },
}
