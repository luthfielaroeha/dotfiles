local config = function()
  require("neo-tree").setup({
    enable_normal_mode_for_inputs = true,
    close_if_last_window = true,
    event_handlers = {
      {
        event = "neo_tree_popup_input_ready",
        ---@param args { bufnr: integer, winid: integer }
        handler = function(args)
          vim.cmd("stopinsert")
          vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
        end,
      }
    },
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
