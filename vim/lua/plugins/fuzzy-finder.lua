local config = function ()
  require('telescope').setup{
    pickers = {
      buffers = {
        initial_mode = 'normal',
        sort_mru = true,
        ignore_current_buffer = true,
        theme = "dropdown",
        previewer = false,
        mappings = {
          n = {
            ["d"] = "delete_buffer",
          }
        }
      }
    }
  }
end

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { 'nvim-lua/plenary.nvim' }
    },
    config = config,
    cmd = "Telescope",
		event = { "BufReadPre", "BufNewFile" },
  }
}
