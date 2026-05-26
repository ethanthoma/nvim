return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        local ts = require("nvim-treesitter")
        local installing = {}

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(ev)
                local lang = vim.treesitter.language.get_lang(ev.match) or ev.match
                if not vim.tbl_contains(ts.get_available(), lang) then return end

                local function start()
                    if not vim.api.nvim_buf_is_valid(ev.buf) then return end
                    pcall(vim.treesitter.start, ev.buf, lang)
                    vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end

                if vim.tbl_contains(ts.get_installed(), lang) then
                    start()
                elseif not installing[lang] then
                    installing[lang] = true
                    ts.install({ lang }):await(function(err)
                        installing[lang] = nil
                        if not err then vim.schedule(start) end
                    end)
                end
            end,
        })
    end,
}
