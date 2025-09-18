return {
  "neovim/nvim-lspconfig",
  opts = {
    autoformat = false,
    inlay_hints = { enabled = false },
    setup = {
      clangd = function(_, opts)
        opts.cmd = {"clangd", "--header-insertion=never"}
      end,
    },
  },
}
