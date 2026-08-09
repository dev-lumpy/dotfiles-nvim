vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = false,

    signs = false,
    underline = true,

    update_in_insert = true,

    severity_sort = true,

    float = {
        border = "rounded",
        focusable = true,
        source = "if_many",
    },
})


vim.api.nvim_set_hl(0, "DiagnosticFloatingError", {
    bg = "NONE",
})

vim.api.nvim_set_hl(0, "NormalFloat", {
    bg = "NONE",
})

vim.api.nvim_set_hl(0, "FloatBorder", {
    fg = "#89b4fa",
    bg = "NONE",
})

