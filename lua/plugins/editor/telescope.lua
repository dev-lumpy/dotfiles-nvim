
-- ~/.config/nvim/lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { 
    "nvim-lua/plenary.nvim" 
  },
  config = function()
    -- Carga la configuración separada cuando el plugin esté listo
    require("config.telescope")
  end,
}

