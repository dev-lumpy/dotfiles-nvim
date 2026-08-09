return {
    "j-hui/fidget.nvim",
    config = function()
        require("fidget").setup({
            notification = {
                window = {
                    winblend = 0,
                    border = "rounded",
                },
            },
            progress = {
                display = {
                    done_icon = "✓",
                    progress_icon = { pattern = "dots", period = 1 },
                },
            },
        })
    end,
}
