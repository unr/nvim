# UNR NVIM

LazyVim-based configuration optimized for Nuxt3/TypeScript development.

## Features

- **Theme**: Catppuccin
- **Indentation**: Tab-based (overrides LazyVim's space default)
- **Primary stack**: Vue/Nuxt3, TypeScript, Tailwind CSS
- **ESLint integration**: Fix on command via `<leader>ce` or `:EslintFixAll`
- **VSCode support**: Compatible with vscode-neovim extension

## Structure

```
lua/
├── config/          # Core configuration
│   ├── autocmds.lua # Autocommands (Vue tab enforcement, etc.)
│   ├── keymaps.lua  # Custom keybindings
│   ├── lazy.lua     # Lazy.nvim bootstrap
│   └── options.lua  # Vim options (tabs, line numbers, etc.)
└── plugins/         # Plugin configurations
    └── core.lua     # Catppuccin theme, inlay hints config
```

## Quick Start

```bash
# Clone to Neovim config directory
git clone <repo-url> ~/.config/nvim

# Install plugins (on first launch)
nvim
```

Restart Neovim and verify with `:checkhealth`, `:LazyHealth`, and `:Lazy`.

## Customizations

See [CUSTOMIZATIONS.md](./CUSTOMIZATIONS.md) for all modifications from LazyVim defaults.

## Notable Keymaps

| Key | Action | Mode |
|-----|--------|------|
| `jk` / `kj` | Escape insert mode | Insert |
| `<leader>ce` | Run ESLint fix all | Normal |
| `<leader>gg` | LazyGit (VSCode mode) | Normal |
| `<leader>e` | File explorer (VSCode mode) | Normal |

## Requirements

- Neovim ≥ 0.9.0
- Git
- A Nerd Font (for icons)
- `ripgrep` (for Telescope)
- `lazygit` (optional, for git integration)
