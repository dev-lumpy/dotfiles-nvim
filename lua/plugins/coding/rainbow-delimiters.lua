return {
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            -- Activa para todos los buffers automáticamente
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.fn["rainbow_delimiters#enable"])
                end,
            })
        end,
    },
}
