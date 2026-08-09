vim.keymap.set("n", "<leader>d", function()
    vim.diagnostic.open_float(nil, {
        border = "rounded",
        focusable = true,
        source = "if_many",
    })
end, {
    desc = "Mostrar diagnóstico"
})
