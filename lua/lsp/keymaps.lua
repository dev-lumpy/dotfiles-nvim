vim.keymap.set("n", "<leader>d", function()
    vim.diagnostic.open_float(nil, {
        border = "rounded",
        focusable = true,
        source = "if_many",
    })
end, {
    desc = "Mostrar diagnóstico"
})

-- Atajos de ADB ahora en core/keymaps.lua (globales)
