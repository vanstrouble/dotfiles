# Dotfiles

My personal configuration for macOS and development environment.

## Recommended Software

- **Terminal:** [Ghostty](https://ghostty.org/) is recommended for its performance and compatibility with modern configurations. Alternatively, you can use [iTerm2](https://iterm2.com/).
- **Zsh Plugin Manager:** This repository uses [zinit](https://github.com/zdharma-continuum/zinit) to manage Zsh plugins and extensions. It is essential to install it for the [.zshrc](.zshrc) file to work correctly.
- **Prompt:** [Starship](https://starship.rs/) provides a fast and customizable prompt.
- **File Navigator:** [eza](https://github.com/eza-community/eza) and [bat](https://github.com/sharkdp/bat) enhance the terminal experience.
- **Fuzzy Finder:** [fzf](https://github.com/junegunn/fzf) for quick searches in the terminal.
- **Directory Manager:** [zoxide](https://github.com/ajeetdsouza/zoxide) for efficient navigation.
- **Python Environment Manager:** [Miniconda](https://docs.conda.io/en/latest/miniconda.html) is recommended for managing Python environments and dependencies.

## Setup

1. Install Homebrew:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Clone this repository:
```bash
git clone https://github.com/vanstrouble/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

3. Install the packages from the [Brewfile](.Brewfile):
```bash
brew bundle install
```

5. Create symlinks using Stow:
```bash
stow .
```

6. Restart your terminal and make sure to use Ghostty or iTerm2.

7. Open a new terminal and verify that the plugins load correctly.
