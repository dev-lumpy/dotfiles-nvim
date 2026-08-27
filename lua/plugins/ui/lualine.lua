return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        opts = {
            options = {
                theme = function()
                    local auto = require("lualine.themes.auto")
                    auto.inactive = {
                        a = { bg = "#36454F", fg = "#D3D3D3" },
                        b = { bg = "NONE", fg = "#a0a0a0" },
                        c = { bg = "NONE", fg = "#a0a0a0" },
                        x = { bg = "NONE", fg = "#a0a0a0" },
                        y = { bg = "NONE", fg = "#a0a0a0" },
                        z = { bg = "NONE", fg = "#a0a0a0" },
                    }
                    return auto
                end,
                component_separators = { left = "", right = "" },
                section_separators = { left = " ", right = " " },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        },
    },
}
