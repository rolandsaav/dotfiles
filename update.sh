# Symlink zshrc to proper place
ln -sf "$HOME/dotfiles/zshrc" ~/.zshrc

# Other Symlinks
mkdir -p ~/.config
ln -sf "$HOME/dotfiles/nvim" ~/.config/nvim
ln -sf "$HOME/dotfiles/tmux.conf" ~/.config/.tmux.conf
ln -sf "$HOME/dotfiles/aerospace" ~/.config/aerospace
ln -sf "$HOME/dotfiles/kitty" ~/.config/kitty
ln -sf "$HOME/dotfiles/aliasrc" ~/.config/aliasrc

exec "$SHELL"
