return {
    "saghen/blink.cmp",
    dependencies = {
{
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            config = function()
                vim.api.nvim_create_autocmd("ModeChanged", {
                    pattern = "*",
                    callback = function()
                        local luasnip = require("luasnip")
                        local event = vim.v.event
                        if (event.old_mode == "s" and event.new_mode == "n") or event.old_mode == "i" then
                            if luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
                                and not luasnip.session.jump_active
                            then
                                luasnip.unlink_current()
                            end
                        end
                    end,
                })
            end,
        },
    },

    version = "1.*",
    build = "nix run .#build-plugin",

    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
        keymap = { preset = "default" },

        appearance = {
            nerd_font_variant = "mono"
        },

        completion = {
            documentation = { auto_show = false },
            ghost_text = { enabled = true },
        },

        snippets = { preset = 'luasnip' },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" },
}
