return {
  "amrbashir/nvim-docs-view",
  lazy = true,
  cmd = "DocsViewToggle",
  keys = {
    n = {
      ["<leader>cd"] = "<cmd>DocsViewToggle<cr>",
    },
  },
  opts = {
    position = "bottom",
  },
}
