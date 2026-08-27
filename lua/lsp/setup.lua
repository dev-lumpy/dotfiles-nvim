-- Cargando la configuración de diagnostics
require("lsp.diagnostics")

-- Cargando la configuración de keymaps
require("lsp.keymaps")

-- Cargando keymaps por buffer (LspAttach)
require("lsp.on_attach")

local servers = {
    rust_analyzer = "rust",
    lua_ls = "lua_ls",
    html          = "html",  -- Añadido
    cssls         = "css",   -- Añadido (El servidor se llama cssls, tu archivo css.lua)
    ts_ls         = "ts",
    jdtls         = "jdtls", -- Java / Kotlin / Android
    pyright       = "pyright"
    -- kotlin_language_server = "kotlin", -- Dormido hasta que tenga soporte Android
}

local capabilities = require("lsp.capabilities")

for server, module in pairs(servers) do
    local config = require("lsp.servers." .. module)

    config.capabilities = capabilities

    vim.lsp.config(server, config)
    vim.lsp.enable(server)
end
