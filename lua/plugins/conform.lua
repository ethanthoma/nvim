return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            nix = { "nixfmt" },
            rust = function(bufnr)
                for _, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)) do
                    if line:match("verus!") then return { "verusfmt" } end
                end
                return { "rustfmt" }
            end,
            gleam = { "gleam" },
            json = { "jq" },
            javascript = { "biome" },
            typescript = { "biome" },
            html = { "superhtml" },
            python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
            nickel = { "nickel" },
            zig = { "zigfmt" },
            inko = { "inko" },
            typst = { "typstyle" },
            go = { "gci", "gofumpt" },
            markdown = { "mdformat" },
            templ = { "templ", "rustywind" },
            php = { "mago_format", "mago_lint" },
            kdl = { "kdlfmt" },
            toml = { "taplo" },
            bzl = { "buildifier" },
            wgsl = { "wgslfmt" },
            yaml = { "yamlfmt" },
            terraform = { "tofu_fmt" },
        },

        formatters = {
            verusfmt = {
                command = "verusfmt",
                args = { "$FILENAME" },
                stdin = false,
            },
            typstyle = {
                command = "typstyle",
                stdin = true,
                args = { "-l", "80", "--wrap-text" },
            },
            wgslfmt = {
                command = "wgslfmt",
                stdin = true,
            },
            nickel = {
                command = "nickel",
                stdin = true,
                args = { "format" },
            },
            mdformat = {
                command = "mdformat",
                args = { "--wrap", "80", "--number", "-" },
            },
            mago_format = {
                command = "mago",
                args = { "format", "-i" },
            },
            mago_lint = {
                command = "mago",
                args = { "lint", "--fix", "$FILENAME" },
            },
            kdlfmt = {
                args = { "format", "--kdl-version", "v2", "-" },
            },
            typstfmt = {
                command = "typstfmt",
            },
        },

        default_format_opts = {
            lsp_format = "fallback",
        },

        format_on_save = { lsp_format = "fallback" },
    },
}
