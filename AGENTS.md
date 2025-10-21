# Agent Guidelines for unr's Neovim Config

## Knowledge

- when dealing with LazyVim or any 3rd party neovim plugin, look up documentation on context7

## Build/Lint/Test

- **Format Lua**: `stylua .` (indent: 2 spaces, column width: 120)
- **No tests**: This is a personal Neovim configuration without a test suite
- **Verify config**: Restart Neovim and check for errors with `:checkhealth`, `:LazyHealth`, and `:Lazy`

## Code Style

- **Language**: Lua for configuration
- **Indentation**: Use tabs (not spaces) - see `vim.opt.expandtab = false` in lua/config/options.lua:5
- **Formatting**: Follow stylua.toml (2-space width for display, 120 column width)
- **Structure**: Plugin configs go in `lua/plugins/*.lua`, core config in `lua/config/*.lua`
- **Comments**: Use `--` for Lua comments; include context for non-obvious settings
- **Plugin management**: All plugins use lazy.nvim; define in return tables with proper opts/dependencies
- **Naming**: Use snake_case for Lua files, descriptive names for plugin config files
- **Imports**: Use `require("module")` for Lua modules; avoid relative imports
- **LazyVim conventions**: This extends LazyVim - check LazyVim defaults before overriding
- **Keymaps**: Define in lua/config/keymaps.lua using the map() helper function
- **Options**: Set vim options in lua/config/options.lua
- **VSCode compatibility**: Check `vim.g.vscode` when adding keymaps that should differ in VSCode

## Key Patterns

- Primary use: Nuxt3/TypeScript development
- Theme: Catppuccin (see lua/plugins/core.lua:6)
- ESLint integration: Available via `:EslintFixAll` or `<leader>ce`
- Inlay hints disabled for Vue/TS/JS files

## When Finished

- when changes are made to neovim functionality, ensure that README and CUSTOMIZATIONS.md is kept up to date
