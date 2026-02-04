return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        skip_confirm_for_simple_edits = true,
        delete_to_trash = true,
        view_options = {
            show_hidden = true,
        },
        watch_for_changes = true,
    },
    config = function(_, opts)
        require("oil").setup(opts)
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

        require("nvim-web-devicons").setup({
            override_by_extension = {
                ["ncl"] = {
                    icon = "󰆧",
                    color = "#E0C3FC",
                    cterm_color = "189",
                    name = "nickel",
                },
            },
        })
    end
}
