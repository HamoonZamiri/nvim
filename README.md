# My NeoVim Configuration

This set of configuration was taken from [LazyVim](https://github.com/LazyVim/LazyVim) and modified to my liking.

## Installation

- Install nvim. On macOS, you can use Homebrew:
```bash
brew install neovim
```
- Clone this repository to `~/.config/nvim`:
```bash
git clone https://github.com/1239uth/nvim ~/.config/nvim
```

- Setup a [Nerd Font](https://www.nerdfonts.com/). I use JetBrainsMono Nerd Font. You can install it using
```bash
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```
- Make sure you set the font in your terminal emulator to the Nerd Font you installed, and restart the terminal.
- Install these additional tools for better performance:
```bash
brew install ripgrep fzf
```
See [ripgrep](https://github.com/BurntSushi/ripgrep) and [fzf](https://github.com/junegunn/fzf) for more information.

- Start neovim:
```bash
nvim
```
