# Neovim

Instalation guide: [INSTALL.md](https://github.com/neovim/neovim/blob/master/INSTALL.md)

## Arch Linux

- [nodejs](https://nodejs.org/pt/download)
- [rust](https://www.rust-lang.org/)

```bash
sudo pacman -S neovim ripgrep go gcc
sudo pacman -S python-pynvim # opcional
cargo install tree-sitter-cli
```

## Debian based distros

- [nodejs](https://nodejs.org/pt/download)
- [go](https://go.dev/doc/install)
- [rust](https://www.rust-lang.org/)

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
sudo apt-get install python3-dev python3-pip python3-venv
cargo install tree-sitter-cli
```

## Config and Core Plugins

- [keymaps](https://github.com/maxmx03/dotfiles/blob/main/.config/nvim/lua/config/keymaps.lua)
- [lsp handlers](https://github.com/maxmx03/dotfiles/tree/main/.config/nvim/lua/config/handlers)
- [lsp](https://github.com/maxmx03/dotfiles/blob/main/.config/nvim/lua/plugins/lspconfig.lua)
- [base46 colorschemes](https://github.com/maxmx03/dotfiles/tree/main/.config/nvim/lua/base46/themes)
- [terminal + runner](https://github.com/maxmx03/dotfiles/blob/main/.config/nvim/lua/lib/runners.lua)

## Env

- [GEMINI_API](https://github.com/maxmx03/dotfiles/blob/main/.config/nvim/lua/plugins/codecompanion.lua)
