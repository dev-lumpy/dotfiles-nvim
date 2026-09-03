<div align="center">

# 🚀 Neovim Config

Configuración personal de **Neovim**, modular, rápida y basada en **[lazy.nvim](https://github.com/folke/lazy.nvim)**.

Tema **Catppuccin Mocha** · Autocompletado con **blink.cmp** · LSP con la **API nativa de Neovim 0.11+** · Explorador de archivos con **oil.nvim**

</div>

---

## 📦 Requisitos

| Herramienta | Versión | Notas |
|-------------|---------|-------|
| **Neovim** | `0.11+` | Necesario por el uso de `vim.lsp.config()` / `vim.lsp.enable()` |
| **Git** | cualquiera | Para clonar lazy.nvim y los plugins |
| **Nerd Font** | JetBrainsMono | Recomendada para los iconos (`guifont`) |
| **Java 21** | OpenJDK | Solo si usas `jdtls` (Java / Kotlin / Android) |

---

## ⚙️ Instalación

```bash
# Clonar el repositorio dentro de ~/.config/nvim
git clone <tu-repo-url> ~/.config/nvim

# Abrir Neovim (lazy.nvim se instala solo y descarga los plugins)
nvim
```

Al primer arranque, lazy.nvim se auto-clona, instala los plugins y aplica el tema. Puedes ver el estado con `:Lazy`.

---

## 🗂️ Estructura del proyecto

```
~/.config/nvim/
├── init.lua                  # Punto de entrada: leader, lazy.nvim, carga core/
├── lazy-lock.json            # Versiones fijadas de los plugins (commiteado)
├── lua/
│   ├── core/                 # Configuración base de Neovim
│   │   ├── init.lua          # Orden de carga: globals → options → keymaps → autocmds
│   │   ├── options.lua       # vim.opt.* (números, tabs, scroll, etc.)
│   │   ├── keymaps.lua       # Atajos globales (splits, terminal, ADB)
│   │   ├── globals.lua       # Ajustes globales (switchbuf)
│   │   └── autocmds.lua      # Autocomandos (treesitter, terminal)
│   ├── plugins/              # Especificaciones de lazy.nvim, por categoría
│   │   ├── editor/           # telescope, oil, treesitter, indent-blankline…
│   │   ├── ui/               # catppuccin, lualine, which-key, dressing…
│   │   ├── lsp/              # lspconfig, mason, mason-lspconfig, fidget
│   │   └── coding/           # blink.cmp, autopairs, rainbow-delimiters…
│   ├── lsp/                  # Configuración de los servidores LSP
│   │   ├── setup.lua         # Registra y habilita cada servidor (API nativa)
│   │   ├── capabilities.lua  # Capacidades desde blink.cmp
│   │   ├── diagnostics.lua   # Estilo de los diagnósticos (flotantes)
│   │   ├── on_attach.lua     # Keymaps por buffer al conectar un LSP
│   │   ├── keymaps.lua       # Atajos globales de LSP
│   │   └── servers/          # Un archivo por servidor (rust, lua, ts, jdtls…)
│   └── config/               # Configuración compleja de plugins (telescope)
├── ftplugin/                 # Ajustes por tipo de archivo (lua, python, markdown, tex)
└── themes/                   # Definiciones de temas (por ahora vacíos)
```

---

## 🧩 Plugins

### Editor

| Plugin | Función |
|--------|---------|
| [oil.nvim](https://github.com/stevearc/oil.nvim) | Explorador de archivos (editable, flotante) |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Buscador difuso (archivos, texto, buffers, ayuda) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Resaltado de sintaxis por árbol |
| [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) | Contexto pegajoso (función/clase actual) |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Guías de indentación |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Comentarios con `gc`/`gb` y treesitter context |
| [smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim) | Animación suave del cursor |

### UI

| Plugin | Función |
|--------|---------|
| [catppuccin](https://github.com/catppuccin/nvim) | Tema (flavour **mocha**, fondo transparente) |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Barra de estado |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Muestra los atajos disponibles |
| [dressing.nvim](https://github.com/stevearc/dressing.nvim) | Mejora los diálogos nativos (input/select) |

### LSP

| Plugin | Función |
|--------|---------|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Configuración de servidores LSP |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | Gestor de servidores LSP |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Puente mason ↔ lspconfig |
| [fidget.nvim](https://github.com/j-hui/fidget.nvim) | Indicador de progreso del LSP |

### Coding

| Plugin | Función |
|--------|---------|
| [blink.cmp](https://github.com/saghen/blink.cmp) | Autocompletado |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Colección de snippets |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Cierre automático de pares |
| [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim) | Delimitadores con colores por nivel |
| [codecompanion.nvim](https://github.com/olimorris/codecompanion.nvim) | Chat e inline AI con DeepSeek |

### Terminal

| Plugin | Función |
|--------|---------|
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Terminal flotante con múltiples sesiones |

### DAP

| Plugin | Función |
|--------|---------|
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debugger (Python/Django) |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | Interfaz gráfica para DAP |
| [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python) | Adaptador Python para DAP |
| [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) | Muestra valores de variables inline |

---

## ⌨️ Atajos de teclado

> `<leader>` = `Space` · `<localleader>` = `Space`

### Generales

| Tecla | Modo | Acción |
|-------|------|--------|
| `<C-s>` | `n` / `v` / `i` | Guardar (`:w!`) |
| `<C-a>` | `n` | Seleccionar todo |
| `<C-c>` | `v` | Copiar al portapapeles |
| `<C-v>` | `n` | Pegar del portapapeles |
| `yy` | `n` | Copiar línea a Nvim y portapapeles |
| `sv` | `n` | Split vertical |
| `q!` | `n` | Salir de todo (`:qall!`) |
| `<leader>?` | `n` | Mostrar todos los atajos (which-key) |
| `<leader>ll` | `n` | Abrir el log del LSP |
| `<leader>lm` | `n` | Volcar `:messages` a un buffer |
| `*` | `n` | Buscar palabra sin mover el cursor |
| `<Esc>` | `n` | Limpiar resaltado de búsqueda si está activo |
| `vaf` | `n` | Seleccionar función/elemento/CSS rule con treesitter |

### Ventanas / Splits

| Tecla | Acción |
|-------|--------|
| `<leader>vv` | Dividir verticalmente (mitad) |
| `<leader>vh` | Dividir horizontalmente |
| `<leader>cc` | Cerrar ventana actual |
| `<A-h>` / `<A-j>` / `<A-k>` / `<A-l>` | Navegar entre splits |
| `<C-↑>` / `<C-↓>` | Redimensionar altura |
| `<C-←>` / `<C-→>` | Redimensionar ancho |
| `J` / `K` | Scroll abajo / arriba (3 líneas, cursor fijo) |
| `H` / `L` | Scroll izquierda / derecha (3 columnas) |

### Edición / Visual

| Tecla | Modo | Acción |
|-------|------|--------|
| `>` | `v` | Indentar y mantener selección |
| `<` | `v` | Dedentar y mantener selección |
| `<leader>i` | `v` | Reindentar selección con ancho específico |

### Búsqueda (Telescope)

| Tecla | Acción |
|-------|--------|
| `<leader>ff` | Buscar archivos |
| `<leader>fg` | Buscar texto (live grep) |
| `<leader>fb` | Buscar buffers abiertos |
| `<leader>fh` | Buscar ayuda de Neovim |
| `<leader>fd` | Todos los diagnósticos del proyecto |
| `<leader>fs` | Listar símbolos/funciones del archivo |
| `<leader>fE` | Solo errores |
| `<leader>fW` | Solo advertencias |
| `<leader>fI` | Solo información |
| `<leader>fH` | Solo hints |

### LSP

| Tecla | Acción |
|-------|--------|
| `gd` | Ir a definición (reutiliza ventanas abiertas) |
| `gr` | Ir a referencias |
| `gi` | Ir a implementación |
| `gh` | Documentación flotante (hover) |
| `<leader>d` | Diagnóstico de la línea actual |

### Comentarios (Comment.nvim)

| Tecla | Modo | Acción |
|-------|------|--------|
| `gc` | `n` / `v` | Toggle comment de línea |
| `gb` | `n` / `v` | Toggle comment de bloque |
| `gcc` | `n` | Comentar línea actual |
| `gcO` | `n` | Comentar línea de arriba |
| `gco` | `n` | Comentar línea de abajo |

### Autocompletado (blink.cmp)

| Tecla | Acción |
|-------|--------|
| `<Tab>` | Siguiente sugerencia |
| `<S-Tab>` | Sugerencia anterior |
| `<CR>` | Aceptar sugerencia |
| `<C-j>` | Desplazar documentación hacia abajo |
| `<C-k>` | Desplazar documentación hacia arriba |

### Terminal

| Tecla | Acción |
|-------|--------|
| `<leader>tt` | Abrir/cerrar terminal (elige posición: `h`/`j`/`k`/`l`) |
| `<C-\>` | Toggle terminal flotante (toggleterm) |
| `<C-1>` a `<C-5>` | Abrir/cerrar terminal 1 a 5 |
| `<leader>dd` | Terminal Django |
| `<Esc>` | Salir de terminal a modo normal (dentro de la terminal) |
| `jk` | Salir de terminal a modo normal (alternativa) |
| `<C-h/j/k/l>` | Navegar entre splits desde la terminal |
| `<C-w>` | Prefix de ventanas desde la terminal |

### Explorador (oil.nvim)

| Tecla | Acción |
|-------|--------|
| `-` o `<leader>e` | Abrir oil.nvim en el directorio actual |
| `<CR>` | Abrir archivo / entrar carpeta |
| `<C-s>` | Abrir en split vertical |
| `<C-v>` | Abrir en split horizontal |
| `<C-p>` | Vista previa |
| `<BS>` | Subir al directorio padre |
| `_` | Abrir el cwd |
| `q` | Cerrar |
| `g.` | Mostrar/ocultar ocultos |
| `gs` | Cambiar orden |
| `gx` | Abrir con app externa |
| `<C-r>` | Refrescar |
| `g?` | Mostrar ayuda de oil |

### AI (CodeCompanion)

| Tecla | Acción |
|-------|--------|
| `<leader>ac` | Toggle chat AI |
| `<leader>cd` | Abrir chat AI |
| `<leader>cg` | Inline AI |

### Debug (DAP)

| Tecla | Acción |
|-------|--------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Continue / Start |
| `<leader>do` | Step Over |
| `<leader>di` | Step Into |
| `<leader>dO` | Step Out |
| `<leader>dq` | Terminar debugging |
| `<leader>du` | Toggle interfaz DAP UI |

### Android / ADB

| Tecla | Acción |
|-------|--------|
| `<leader>ad` | Listar dispositivos |
| `<leader>ai` | Build + instalar APK |
| `<leader>ar` | Lanzar app |
| `<leader>al` | Logs de crash |

---

## 🔍 Servidores LSP

Los servidores se registran con la **API nativa de Neovim** (`vim.lsp.config()` + `vim.lsp.enable()`), no con `lspconfig[server].setup()`.

| Servidor | Lenguaje | Archivo |
|----------|----------|---------|
| `rust_analyzer` | Rust | `lua/lsp/servers/rust.lua` |
| `lua_ls` | Lua | `lua/lsp/servers/lua_ls.lua` |
| `ts_ls` | TypeScript / JavaScript | `lua/lsp/servers/ts.lua` |
| `html` | HTML | `lua/lsp/servers/html.lua` |
| `cssls` | CSS | `lua/lsp/servers/css.lua` |
| `jdtls` | Java / Kotlin / Android | `lua/lsp/servers/jdtls.lua` |
| `pyright` | Python | `lua/lsp/servers/pyright.lua` |

Los servidores `html`, `cssls`, `ts_ls`, `jdtls`, `kotlin_language_server` y `pyright` se instalan automáticamente vía Mason (`ensure_installed`). Instala o revisa el resto con `:Mason`.

---

## 🎨 Tema

- **Catppuccin** en flavour **mocha** con `transparent_background = true`.
- Las ventanas flotantes (Telescope, diagnósticos, Mason) usan bordes redondeados y fondo transparente (`bg=NONE`).

---

## 🧭 Comandos útiles

| Comando | Descripción |
|---------|-------------|
| `:Lazy` | Gestor de plugins |
| `:Mason` | Instalar/actualizar servidores LSP |
| `:checkhealth` | Verificar el estado de Neovim y los servidores |
| `:TSUpdate` | Actualizar parsers de treesitter |

---

## 🚧 En desarrollo

- **Formatter/linter**: `conform.lua` y `lint.lua` son stubs vacíos.
- **Git / Lang**: las carpetas `git/` y `lang/` existen pero no están importadas.
- **Snippets propios**: `snippets/` y `templates/` están vacíos.
- Algunos plugins de `editor/` (harpoon, surround) y de `ui/` (alpha, bufferline, noice, notify) aún son stubs.

---

<div align="center">

**Espacio para tu arte** 🎨

</div>
