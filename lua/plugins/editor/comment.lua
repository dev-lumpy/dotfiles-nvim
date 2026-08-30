return {
    -- Plugin principal
    'numToStr/Comment.nvim',
    lazy = false, -- Se carga siempre
    dependencies = {
        -- Para detección de contexto avanzada (opcional pero recomendado)
        'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
        require('Comment').setup({
            -- Configuración básica
            toggler = {
                line = 'gc',   -- Atajo para comentar/descomentar línea
                block = 'gb',  -- Atajo para comentario de bloque
            },
            opleader = {
                line = 'gc',
                block = 'gb',
            },
            extra = {
                above = 'gcO', -- Comentar línea de arriba
                below = 'gco', -- Comentar línea de abajo
                eol = 'gcA',   -- Comentar hasta el final de línea
            },
            
            -- Hook para contexto avanzado con Treesitter
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        })
        
        -- Opcional: Configuración extra para Rust
        vim.api.nvim_create_autocmd('FileType', {
            pattern = 'rust',
            callback = function()
                vim.bo.commentstring = '// %s'
            end
        })
    end,
    -- Atajos de teclado adicionales (opcional)
    keys = {
        { 'gc', mode = { 'n', 'v' }, desc = 'Toggle comment' },
        { 'gb', mode = { 'n', 'v' }, desc = 'Toggle block comment' },
        { 'gcc', mode = 'n', desc = 'Comment current line' },
        { 'gcO', mode = 'n', desc = 'Comment above' },
        { 'gco', mode = 'n', desc = 'Comment below' },
    }
}
