
return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    border = "rounded", -- Bordes redondeados en la interfaz de :Mason
                },
            })
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason-lspconfig").setup({
                -- Aseguramos que tus nuevos servidores web se instalen solos
                ensure_installed = {
                    "html",
                    "cssls",
                    "ts_ls",
                    "jdtls",
                },
            })
        end,
    },
}

