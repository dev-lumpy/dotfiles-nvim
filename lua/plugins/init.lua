-- ~/.config/nvim/lua/plugins/init.lua
-- Configuración MÍNIMA para que no dé error

return {
  -- Aquí irán tus plugins cuando los agregues

    { import = "plugins.editor" },  -- Carga todo editor/

    -- Aqui iran los estilos de colores
    { import = "plugins.ui" },

    -- Aqui serian para el analizador semantico
    { import = "plugins.lsp" },

    -- Plugins de codificacion: autocompletado, pares, delimitadores
    { import = "plugins.coding" }
}
