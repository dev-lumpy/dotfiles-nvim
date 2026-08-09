-- ~/.config/nvim/init.lua
-- Punto de entrada principal de Neovim

-- <leader> = Space
vim.g.maplocalleader = " "
vim.g.mapleader = " "

-- ============================================
-- 1. CONFIGURACIÓN BÁSICA DE LAZY.NVIM
-- ============================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ============================================
-- 2. CONFIGURACIÓN DE LAZY.NVIM
-- ============================================

require("lazy").setup({
  -- Especifica dónde están tus plugins
  spec = {
    -- Importa TODOS los plugins de la carpeta lua/plugins/
    { import = "plugins" },
  },
  
  -- Configuración adicional de lazy.nvim
  defaults = {
    lazy = false,    -- Los plugins se cargan al inicio (puedes cambiar a true para carga perezosa)
    version = false, -- Siempre usa la última versión
  },
  
  -- Instalar plugins automáticamente
  install = {
    colorscheme = { "catppuccin" },  -- Tu tema por defecto
  },
  
  -- Rendimiento
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  
  -- Interfaz de lazy.nvim
  ui = {
    border = "rounded",  -- Bordes redondeados
    icons = {
      ft = "",
      lazy = "鈴",
      loaded = "",
      not_loaded = "",
    },
  },
  
  -- Mostrar progreso al instalar
  progress = {
    enabled = true,
  },
  
  -- Checkear actualizaciones automáticamente
  checker = {
    enabled = false,
    notify = false,
    frequency = 86400,  -- Una vez al día
  },
})

-- ============================================
-- 3. CARGAR LA CONFIGURACIÓN BASE
-- ============================================

-- Carga tu configuración principal
require("core")

-- ============================================
-- 4. CONFIGURACIÓN ADICIONAL (opcional)
-- ============================================
