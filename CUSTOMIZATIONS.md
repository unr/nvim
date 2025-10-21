# LazyVim Customizations

This document outlines all custom configurations that override or extend the default LazyVim setup.

## Core Settings

### Colorscheme
- **Default**: LazyVim uses `tokyonight`
- **Custom**: Changed to `catppuccin` (lua/plugins/core.lua:6)

### Indentation
- **Default**: LazyVim uses spaces (`expandtab = true`)
- **Custom**: Uses tabs (`expandtab = false`) (lua/config/options.lua:5)
- **Vue-specific**: Explicitly enforces tabs and disables smart indent for `.vue` files (lua/config/autocmds.lua:9-16)

### LSP Inlay Hints
- **Default**: LazyVim enables inlay hints by default
- **Custom**: Disabled globally, with explicit exclusions for Vue, TypeScript, and JavaScript files (lua/plugins/core.lua:12-14)

## Keymaps

### Insert Mode Escape
- **Mapping**: `jk` and `kj` → `<ESC>`
- **File**: lua/config/keymaps.lua:22-23
- **Context**: Only active in regular Neovim (not VSCode)

### ESLint Fix
- **Mapping**: `<leader>ce` → `:EslintFixAll`
- **Description**: "Run EslintFixAll"
- **File**: lua/config/keymaps.lua:27

### VSCode-Specific Keymaps
When running in VSCode (via vscode-neovim):

- **LazyGit**: `<leader>gg` → Opens VSCode's LazyGit extension (lua/config/keymaps.lua:36-38)
- **Explorer**: `<leader>e` → Opens VSCode file explorer (lua/config/keymaps.lua:41-43)

## LazyVim Extras Enabled

The following LazyVim extras are installed (lazyvim.json):

### AI
- `lazyvim.plugins.extras.ai.sidekick`

### Coding
- `lazyvim.plugins.extras.coding.mini-surround`
- `lazyvim.plugins.extras.coding.yanky`

### Editor
- `lazyvim.plugins.extras.editor.dial`
- `lazyvim.plugins.extras.editor.fzf`
- `lazyvim.plugins.extras.editor.illuminate`
- `lazyvim.plugins.extras.editor.inc-rename`
- `lazyvim.plugins.extras.editor.leap`
- `lazyvim.plugins.extras.editor.mini-move`

### Languages
- `lazyvim.plugins.extras.lang.git`
- `lazyvim.plugins.extras.lang.json`
- `lazyvim.plugins.extras.lang.markdown`
- `lazyvim.plugins.extras.lang.php`
- `lazyvim.plugins.extras.lang.tailwind`
- `lazyvim.plugins.extras.lang.toml`
- `lazyvim.plugins.extras.lang.typescript`
- `lazyvim.plugins.extras.lang.vue`
- `lazyvim.plugins.extras.lang.yaml`

### Linting
- `lazyvim.plugins.extras.linting.eslint`

### Testing
- `lazyvim.plugins.extras.test.core`

### UI
- `lazyvim.plugins.extras.ui.treesitter-context`

### Utilities
- `lazyvim.plugins.extras.util.dot`
- `lazyvim.plugins.extras.util.mini-hipatterns`
- `lazyvim.plugins.extras.vscode`

## Commented/Disabled Configurations

### Autoformat
- Lines 7-10 in lua/config/options.lua contain commented code to disable LazyVim's autoformat
- Context note: "This is part of my journey to get eslint working on save"

### ESLint on Save
- Lines 18-22 in lua/config/autocmds.lua contain a commented `BufWritePre` autocmd to run ESLint on save
- Appears to be experimental work around ESLint + Volar integration

## Primary Use Case

This configuration is optimized for **Nuxt3/TypeScript development** with Vue.js, as indicated by:
- Vue language support extras
- TypeScript + ESLint integration
- Tailwind CSS support
- Tab-based indentation (common in Vue/Nuxt projects)
- Inlay hints disabled for Vue/TS/JS
