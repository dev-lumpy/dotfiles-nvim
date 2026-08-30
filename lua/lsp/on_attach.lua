vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach-keymaps", { clear = true }),
  callback = function(args)
    local bufnr = args.buf

    vim.keymap.set("n", "gd", function()
      local params = vim.lsp.util.make_position_params()
      vim.lsp.buf_request(0, "textDocument/definition", params, function(err, result, ctx, _)
        if err or not result or vim.tbl_isempty(result) then
          print("No se encontró la definición")
          return
        end

        -- Manejar si la respuesta es una lista o un elemento único
        local target = vim.islist(result) and result[1] or result
        local uri = target.uri or target.targetUri
        if not uri then return end

        local target_bufnr = vim.uri_to_bufnr(uri)

        -- ESCANEO DE VENTANAS: Buscamos si el archivo ya está abierto en alguna pantalla dividida
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          if vim.api.nvim_win_get_buf(win) == target_bufnr then
            vim.api.nvim_set_current_win(win) -- Saltamos a la ventana donde ya existía
            vim.lsp.util.show_document(target, "utf-8", { focus = true })
            return
          end
        end

        -- Si no está abierto en ninguna parte, lo abrimos normalmente en la ventana actual
        vim.lsp.util.show_document(target, "utf-8", { focus = true })
      end)
    end, { buffer = bufnr, desc = "Ir a definición inteligentemente" })

    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Ir a referencias" })
    vim.keymap.set("n", "gh", function()
        vim.lsp.buf.hover({ border = "rounded" })
    end, { buffer = bufnr, desc = "Documentación flotante" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Ir a implementación" })
  end,
})
