return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            nix = { "nixfmt" },
            rust = { "rustfmt" },
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
        },

        formatters = {
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

        format_after_save = { lsp_format = "fallback" },
    },
}
