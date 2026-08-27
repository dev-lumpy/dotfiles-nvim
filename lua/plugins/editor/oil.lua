return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("oil").setup({
            columns = {
                "icon",
            },
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-s>"] = { "actions.select", opts = { vertical = true } },
                ["<C-v>"] = { "actions.select", opts = { horizontal = true } },
                ["<C-p>"] = "actions.preview",
                ["q"] = "actions.close",
                ["-"] = "actions.parent",
                ["<BS>"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["<C-r>"] = "actions.refresh",
                ["gs"] = "actions.change_sort",
                ["g."] = "actions.toggle_hidden",
                ["gx"] = "actions.open_external",
                ["g\\"] = "actions.toggle_trash",
            },
            view_options = {
                show_hidden = true,
            },
            float = {
                enabled = true,
                max_width = 60,
                max_height = 30,
                border = "rounded",
            },
            skip_confirm_for_simple_edits = true,
        })

        -- Abrir Oil en el directorio del archivo actual
        vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Abrir Oil (explorador)" })
        vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Abrir Oil (explorador)" })
    end,
}
