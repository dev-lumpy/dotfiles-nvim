return {
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            check = {
                command = "clippy",
            },
            checkOnSave = {
                enable = true,
            },

            lens = {
                enable = true,
            },

            completion = {
                postfix = {
                    enable = true,
                },
            },
        },
    },
}
