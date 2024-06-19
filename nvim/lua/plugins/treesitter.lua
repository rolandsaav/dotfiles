return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "go",
                "lua",
                "python",
                "javascript",
                "typescript",
                "gitignore",
                "gomod",
                "json",
                "proto",
                "html",
                "css"
            },
            sync_install = false,
            highlight = { enable = true},
            indent = { enable = true },
        })
    end
}
