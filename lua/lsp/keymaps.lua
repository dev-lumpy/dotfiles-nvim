vim.keymap.set("n", "<leader>d", function()
    vim.diagnostic.open_float(nil, {
        border = "rounded",
        focusable = true,
        source = "if_many",
    })
end, {
    desc = "Mostrar diagnóstico"
})

-- Atajos de ADB (solo cuando jdtls está activo)
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == "jdtls" then
            local buf = args.buf
            vim.keymap.set("n", "<leader>ad", ":!adb devices<CR>",
                { buffer = buf, desc = "Listar dispositivos" })
            vim.keymap.set("n", "<leader>ai", ":!./gradlew assembleDebug && adb install -r app/build/outputs/apk/debug/app-debug.apk<CR>",
                { buffer = buf, desc = "Build + instalar" })
            vim.keymap.set("n", "<leader>ar", ":!adb shell am start -n com.example.asistencia/.MainActivity<CR>",
                { buffer = buf, desc = "Lanzar app" })
            vim.keymap.set("n", "<leader>al", ":!adb logcat -b crash<CR>",
                { buffer = buf, desc = "Logs de crash" })
        end
    end,
})
