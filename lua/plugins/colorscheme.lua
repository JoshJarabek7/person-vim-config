return {
  { "kepano/flexoki-neovim", name = "flexoki" },
  { "nyoom-engineering/oxocarbon.nvim", name = "oxocarbon" },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        transparent = true,
        italic_comments = false,
        hide_fillchars = false,
        borderless_telescope = true,
        terminal_colors = true,
        theme = {
          variant = "default",
        },
      })
    end,
  },
}
