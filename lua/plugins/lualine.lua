return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
        local c = {
            bg = '#090B10', fg = '#c5cdda',
            green = '#00ae6b', yellow = '#ffc200', red = '#f2283c',
            violet = '#875afb', blue = '#277dff',
        }
        local hypersubatomic = {
            normal = {
                a = { fg = c.bg, bg = c.green, gui = 'bold' },
                b = { fg = c.fg, bg = c.bg },
                c = { fg = c.fg, bg = 'NONE' },
            },
            insert = { a = { fg = c.bg, bg = c.yellow, gui = 'bold' } },
            visual = { a = { fg = c.bg, bg = c.violet, gui = 'bold' } },
            replace = { a = { fg = c.bg, bg = c.red, gui = 'bold' } },
            command = { a = { fg = c.bg, bg = c.blue, gui = 'bold' } },
            inactive = {
                a = { fg = c.fg, bg = c.bg },
                b = { fg = c.fg, bg = c.bg },
                c = { fg = c.fg, bg = 'NONE' },
            },
        }

        local noice_component = {
            {
                require("noice").api.status.message.get_hl,
                cond = require("noice").api.status.message.has,
            },
            {
                require("noice").api.status.command.get,
                cond = require("noice").api.status.command.has,
                color = { fg = c.fg },
            },
        }

        require('lualine').setup {
            options = {
                component_separators = '',
                section_separators = '',
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = noice_component,
                lualine_y = { 'filetype' },
                lualine_z = { 'location' },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {},
            },
            extensions = {
                'oil'
            },
            theme = hypersubatomic,
        }
    end,
}
