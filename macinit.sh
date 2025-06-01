# Get Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> /Users/rolandsaavedra/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/rolandsaavedra/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install necessary packages
brew install neovim fd ripgrep tmux tree fzf

# Symlink zshrc to proper place
ln -sf "$HOME/dotfiles/zshrc" ~/.zshrc

# Other Symlinks
mkdir -p ~/.config
ln -sf "$HOME/dotfiles/nvim" ~/.config/nvim
ln -sf "$HOME/dotfiles/tmux" ~/.config/tmux.conf
ln -sf "$HOME/dotfiles/aerospace" ~/.config/aerospace.toml
ln -sf "$HOME/dotfiles/kitty" ~/.config/kitty
ln -sf "$HOME/dotfiles/aliasrc" ~/.config/aliasrc


exec "$SHELL"
