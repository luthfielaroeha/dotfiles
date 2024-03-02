local config = function()
  require("neo-tree").setup({
    window = {
      position = "right",
      width = 40,
      mappings = {
        ["/"] = "noop",
        ["w"] = "noop",
      },
    }
  })
end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    config = config,
  }
}