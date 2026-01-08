# dotfiles

My personal macOS configuration files and development environment setup.

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

3. Install packages from Brewfile:
```bash
brew bundle install
```

4. Create symlinks using Stow:
```bash
stow .
```

5. Restart your terminal.
