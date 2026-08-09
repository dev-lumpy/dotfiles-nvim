# Neovim Config

Leader key: `<Space>`

## Archivos

| Tecla | Acción |
|-------|--------|
| `<leader>ff` | Buscar archivo por nombre (Telescope) |
| `<leader>fg` | Buscar texto en todo el proyecto (ripgrep) |
| `<leader>fb` | Buscar en buffers abiertos |
| `<leader>e` o `-` | Abrir explorador de archivos (oil.nvim) |

## Código (LSP)

| Tecla | Acción |
|-------|--------|
| `gd` | Ir a definición |
| `gr` | Buscar referencias |
| `gi` | Ir a implementación |
| `K` | Ver documentación (hover) |
| `<leader>d` | Diagnóstico de la línea actual |
| `<leader>fd` | Todos los diagnósticos del proyecto |
| `<leader>fs` | Listar funciones/símbolos del archivo |

## Ventanas

| Tecla | Acción |
|-------|--------|
| `<leader>vv` | Split vertical |
| `<leader>ss` | Split horizontal |
| `<leader>cc` | Cerrar split actual |
| `<A-h/j/k/l>` | Navegar entre splits |
| `<C-flechas>` | Redimensionar splits |

## Oil.nvim (explorador)

| Tecla | Acción |
|-------|--------|
| `<CR>` | Abrir archivo / entrar carpeta |
| `-` o `<BS>` | Subir al directorio padre |
| `q` | Cerrar |
| `g.` | Mostrar/ocultar archivos ocultos |
| `gs` | Cambiar orden |
| `o` | Crear archivo/carpeta (luego `<C-s>` para guardar) |
| `dd` + `p` | Mover archivo (cortar y pegar, luego `<C-s>`) |
| `ciw` | Renombrar (cambiar palabra bajo cursor, luego `<C-s>`) |

## Android (solo con jdtls activo)

| Tecla | Acción |
|-------|--------|
| `<leader>ad` | Listar dispositivos |
| `<leader>ai` | Build + instalar APK |
| `<leader>ar` | Lanzar app |
| `<leader>al` | Logs de crash |

## General

| Tecla | Acción |
|-------|--------|
| `<C-s>` | Guardar archivo |
| `<leader>fh` | Buscar ayuda de Neovim |
| `<leader>ll` | Abrir LSP log |
| `<leader>lm` | Volcar :messages a buffer |
