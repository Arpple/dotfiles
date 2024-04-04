return {
  "ahmedkhalf/project.nvim",
  keys = {
    { "<leader>pp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
    {
      "<leader>pa",
      function()
        require("project_nvim.project").add_project_manually()
      end,
      desc = "Add",
    },
  },
}
