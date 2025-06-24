return {
  "folke/snacks.nvim",
  opts = {
    scroll = { enabled = false },
    picker = {
      matcher = {
        fuzzy = false,
      },
      sources = {
        explorer = {
          layout = {
            layout = {
              width = 30,
            },
          },
        },
      },
    },
  },
}
