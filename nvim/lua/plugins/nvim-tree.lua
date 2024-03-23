return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        view = {
            float = {
                enable = true
            },
            side = "right"
        }
    }
}
