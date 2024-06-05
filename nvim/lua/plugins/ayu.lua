return {
    "Shatur/neovim-ayu",
    priority = 1000,
    lazy = false,
    config = function()
        vim.cmd(
            [[colorscheme ayu]])
    end,
}
