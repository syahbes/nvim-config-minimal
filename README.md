# Minimal Neovim Configuration

A clean and minimal Neovim configuration with LSP support, fuzzy finding, and modern plugins.

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/syahbes/nvim-config-minimal ~/.config/nvim
```

### 2. Install dependencies (Fedora)

```bash
# Install fd-find for telescope
sudo dnf install fd-find

# Install Node.js LSP servers
npm install -g prettier
npm install -g typescript typescript-language-server
npm install -g vscode-langservers-extracted
```
also install syulua
and
run this
:TSInstall tsx typescript html



### 3. Launch Neovim

```bash
nvim
```

Lazy.nvim will automatically install all plugins on first launch.

## Structure

```
.
├── init.lua                    # Entry point
├── lazy-lock.json             # Plugin version lock file
└── lua
    ├── config
    │   ├── keymaps.lua        # Key mappings
    │   ├── lazy.lua           # Plugin manager setup
    │   ├── lsp.lua            # LSP configuration
    │   └── options.lua        # Neovim options
    └── plugins
        ├── catppuccinTheme.lua
        ├── matchup.lua
        ├── mini.lua
        ├── nvim-cmp.lua       # Autocompletion
        ├── telescope.lua      # Fuzzy finder
        ├── treesitter.lua     # Syntax highlighting
        ├── ts-autotag.lua
        └── which-key.lua      # Key binding helper
```

## Features

- **LSP Support**: TypeScript, JavaScript, HTML, CSS, JSON
- **Autocompletion**: nvim-cmp with LSP integration
- **Fuzzy Finding**: Telescope for file navigation
- **Syntax Highlighting**: Treesitter
- **Theme**: Catppuccin
- **Auto-pairing**: mini.nvim
- **Key Helper**: which-key

## Requirements

- Neovim >= 0.9.0
- Node.js and npm
- Git
- fd-find (for Telescope)
