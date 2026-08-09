# AGENTS.md — Neovim Configuration Guide

## Overview

This is a **Neovim configuration** using **lazy.nvim** as the plugin manager. It is structured as a modular Lua configuration with plugins organized by category, and uses the new **built-in Neovim 0.11+ LSP API** (`vim.lsp.config()`/`vim.lsp.enable()`) instead of the traditional `lspconfig[server].setup()`.

The config is a **work in progress** — many plugin spec files exist as empty stubs or placeholders (`return {}` or `return { -- Por ahora asi no mas }`), indicating planned but not-yet-configured plugins.

## Entry Point & Load Order

```
init.lua
  ├── Sets <leader> = Space, <localleader> = Space
  ├── Bootstraps lazy.nvim (auto-clones if missing)
  ├── lazy.setup({ spec = { import = "plugins" } })
  │     └── plugins/init.lua imports:
  │           ├── plugins.editor/*
  │           ├── plugins.ui/*
  │           ├── plugins.lsp/*
  │           └── plugins.coding.blink
  │         (NOTE: plugins.lang, plugins.git, plugins.dap, and most of
  │          plugins.coding are NOT imported)
  └── require("core")
        └── core/init.lua loads:
              ├── core.globals
              ├── core.options
              └── core.keymaps
```

## Directory Structure

```
~/.config/nvim/
├── init.lua              # Entry point
├── lazy-lock.json        # Lockfile for lazy.nvim (committed)
├── lua/
│   ├── core/             # Core Neovim settings
│   │   ├── init.lua      # Loads globals → options → keymaps
│   │   ├── options.lua   # vim.opt.* (numbers, tabs, colors, etc.)
│   │   ├── keymaps.lua   # Global keymaps (splits, neo-tree toggle)
│   │   ├── globals.lua   # Global vim settings (switchbuf)
│   │   ├── autocmds.lua  # Autocommands
│   │   ├── commands.lua  # (empty)
│   │   ├── diagnostics.lua # (empty)
│   │   └── utils.lua     # (empty)
│   ├── plugins/          # Lazy.nvim plugin specs
│   │   ├── init.lua      # Imports subdirectories (see load order above)
│   │   ├── editor/       # Editor-enhancing plugins
│   │   ├── ui/           # UI plugins (themes, statusline, etc.)
│   │   ├── lsp/          # LSP ecosystem (lspconfig, mason)
│   │   ├── coding/       # Completion, formatting, linting, snippets
│   │   ├── lang/         # Language-specific plugins (all stubs)
│   │   ├── git/          # Git plugins (all stubs)
│   │   └── dap/          # Debug adapter protocol (all stubs)
│   ├── lsp/              # LSP runtime configuration
│   │   ├── setup.lua     # Iterates servers table, calls vim.lsp.config/enable
│   │   ├── capabilities.lua  # Gets caps from blink.cmp
│   │   ├── diagnostics.lua   # vim.diagnostic.config()
│   │   ├── keymaps.lua       # LSP keymaps (<leader>d for diagnostics float)
│   │   ├── on_attach.lua     # Per-buffer LSP keymaps (BUG: see gotchas)
│   │   ├── handlers.lua # (stub)
│   │   └── servers/      # Per-server LSP settings
│   │       ├── lua_ls.lua, rust.lua, pyright.lua (stub),
│   │       ├── html.lua, css.lua, ts.lua
│   ├── config/           # Complex plugin runtime configs
│   │   ├── neo-tree.lua
│   │   └── telescope.lua
│   ├── themes/           # Theme definitions (stubs)
│   ├── snippets/         # Snippet config (stub)
│   └── icons.lua         # Icon definitions (stub)
├── ftplugin/             # Filetype-specific settings (all stubs)
├── after/                # After-directory overrides (empty)
├── templates/            # Template files (empty)
└── spell/                # Spell checking files (empty)
```

## Key Conventions

### Plugin Spec Pattern
All plugin specs in `lua/plugins/<category>/` follow lazy.nvim's spec format:
```lua
return {
  {
    "author/plugin-name",
    dependencies = { ... },  -- optional
    config = function()
      require("config.thing")  -- complex configs in lua/config/
      -- or inline config
    end,
  },
}
```

### Lazy.nvim Defaults
- `lazy = false` — all plugins load eagerly by default (set in `init.lua`)
- `version = false` — always tracks latest commits
- Colorscheme: catppuccin (installed automatically on first run)

### LSP Pattern (CRITICAL — Non-standard)
This config uses Neovim's **new built-in LSP API** (`vim.lsp.config()` / `vim.lsp.enable()`), NOT the traditional `lspconfig[server].setup()`:

```lua
-- lua/lsp/setup.lua
for server, module in pairs(servers) do
    local config = require("lsp.servers." .. module)
    config.capabilities = capabilities      -- from blink.cmp
    vim.lsp.config(server, config)          -- register config
    vim.lsp.enable(server)                   -- enable server
end
```

Server config files in `lua/lsp/servers/` return a plain settings table (not an lspconfig-style table). Example:
```lua
-- lua/lsp/servers/lua_ls.lua
return {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}
```

### Completion
Uses **blink.cmp** (not nvim-cmp). LSP capabilities come from `require("blink.cmp").get_lsp_capabilities()`.

### Theme
Catppuccin **mocha** flavor with `transparent_background = true`. Applied immediately in the plugin's `config` function.

## Commands

There is no build system, Makefile, or CI. Standard Neovim commands apply:

| Command | Purpose |
|---------|---------|
| `nvim` | Start Neovim (plugins auto-install on first run) |
| `:Lazy` | Open lazy.nvim management UI |
| `:Mason` | Open Mason LSP installer UI |
| `:checkhealth` | Check LSP/server health |
| `:TSUpdate` | Update Treesitter parsers |

## Active Plugins (from lazy-lock.json)

- **blink.cmp** — Completion engine
- **catppuccin/nvim** — Colorscheme (mocha)
- **friendly-snippets** — Snippet collection for blink.cmp
- **mason.nvim + mason-lspconfig.nvim** — LSP server management
- **neo-tree.nvim** — File explorer (v3.x branch, floating popup mode)
- **nvim-lspconfig** — LSP server configurations (used indirectly via built-in API)
- **nvim-treesitter** — Syntax highlighting
- **telescope.nvim** — Fuzzy finder (files, grep, buffers, help)
- **plenary.nvim** — Utility library (telescope dependency)
- **nvim-web-devicons** — File icons

## Keymaps

Leader key is **Space**.

| Key | Action |
|-----|--------|
| `<C-s>` | Save file |
| `<leader>e` | Toggle Neo-tree file explorer |
| `<leader>vv` | Vertical split |
| `<leader>ss` | Horizontal split |
| `<leader>cc` | Close current split |
| `<A-h/j/k/l>` | Navigate splits |
| `<C-Up/Down/Left/Right>` | Resize splits |
| `<leader>ff` | Telescope find files |
| `<leader>fg` | Telescope live grep |
| `<leader>fb` | Telescope buffers |
| `<leader>fh` | Telescope help tags |
| `<leader>d` | Show diagnostic float (LSP) |
| `gd` | Go to definition (smart: reuses open windows) |
| `gr` | Go to references |
| `K` | Hover documentation |
| `gi` | Go to implementation |

## Known Issues & Gotchas

### 1. `on_attach.lua` has an undefined `bufnr` variable
The file `lua/lsp/on_attach.lua` uses `bufnr` as a local in keymap `buffer` options but never receives it as a parameter. The file appears to not actually be called from anywhere — `setup.lua` does not require it. If wired up, it would error.

### 2. Plugin stubs dominate — config is a skeleton
Most plugin files are empty or contain only `return { -- Por ahora asi no mas }`. When adding new plugins:
- Add the lazy spec file with actual configuration
- Import the directory in `lua/plugins/init.lua` if it's a new category
- Plugin categories `lang`, `git`, `dap`, and most of `coding` are NOT currently imported in `plugins/init.lua`

### 3. Filesystem filtering
Neo-tree hides `.git`, `.venv`, `node_modules`, `__pycache__` but does NOT hide dotfiles (`hide_dotfiles = false`).

### 4. Spanish-language comments
Comments throughout the codebase are in Spanish. This is intentional — the author is a Spanish speaker. New code can follow the same convention or use English.

### 5. Neo-tree branch pinned
Neo-tree uses `branch = "v3.x"` explicitly. Do not change this without testing — v4 may have breaking changes.

### 6. No formatter/linter configured
`conform.lua` and `lint.lua` are empty stubs. Formatting and linting are not set up.

### 7. No DAP configured
Debug adapter protocol files are all stubs. Debugging support is not set up.

### 8. Transparent backgrounds everywhere
The config aggressively applies `bg=NONE` transparency to floating windows (telescope, neo-tree, diagnostics). This is a deliberate aesthetic choice — adding opaque UI elements should match this style or be explicitly intentional.

## Adding a New Plugin

1. Create `lua/plugins/<category>/<plugin>.lua` with a lazy.nvim spec
2. Ensure the parent directory is imported in `lua/plugins/init.lua`
3. If the plugin needs complex runtime config, create `lua/config/<plugin>.lua` and call it from the spec's `config` function
4. Run `nvim` — lazy.nvim will auto-install missing plugins

## Adding a New LSP Server

1. Create `lua/lsp/servers/<name>.lua` returning a settings table
2. Add the mapping to the `servers` table in `lua/lsp/setup.lua`:
   ```lua
   server_name = "module_name",
   ```
3. Optionally add the server to `ensure_installed` in `lua/plugins/lsp/mason.lua`
