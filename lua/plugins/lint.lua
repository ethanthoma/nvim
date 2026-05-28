return {
    "mfussenegger/nvim-lint",
    event = "BufWritePost",
    config = function()
        require("lint").linters_by_ft = {
            javascript = { "oxlint" },
            rust = { "clippy" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                local lint = require("lint")
                local ft = vim.bo.filetype
                local linters = lint.linters_by_ft[ft] or {}
                local available = vim.tbl_filter(function(name)
                    local linter = lint.linters[name]
                    local cmd = type(linter) == "table" and linter.cmd or nil
                    if type(cmd) == "function" then cmd = cmd() end
                    if type(cmd) ~= "string" then cmd = name end
                    return vim.fn.executable(cmd) == 1
                end, linters)
                if #available > 0 then lint.try_lint(available) end
            end,
        })
    end,
}
