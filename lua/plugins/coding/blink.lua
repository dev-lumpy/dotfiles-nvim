return {
    "saghen/blink.cmp",

    dependencies = {
        "rafamadriz/friendly-snippets",
    },

    version = "1.*",

    opts = {
        completion = {
            documentation = {
                auto_show = true,
            },
        },

        sources = {
            default = {
                "lsp",
                "path",
                "snippets",
                "buffer",
            },
        },

        keymap = {
            preset = "default",

            ["<Tab>"] = {
                "select_next",
                "fallback",
            },

            ["<S-Tab>"] = {
                "select_prev",
                "fallback",
            },

            ["<CR>"] = {
                "accept",
                "fallback",
            },
        },
    },
}
