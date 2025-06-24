return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<A-h>", "<cmd>BufferLineCyclePrev<cr>" },
      { "<A-l>", "<cmd>BufferLineCycleNext<cr>" },
    },
    opts = {
      options = {
        always_show_bufferline = true,
        indicator = {
          style = 'underline'
        }
      }
    }
  },
}
