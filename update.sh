# Symlink zshrc to proper place
ln -sf ~/dotfiles/zshrc ~/.zshrc

# Other Symlinks
rm -rf ~/.config/nvim
ln -sf ~/dotfiles/nvim ~/.config/nvim

rm -rf ~/.config/aerospace
ln -sf ~/dotfiles/aerospace ~/.config/aerospace

rm -rf ~/.config/kitty
ln -sf ~/dotfiles/kitty ~/.config/kitty

rm -f ~/.config/alias
ln -sf ~/dotfiles/aliasrc ~/.config/aliasrc

rm ~/.tmux.conf
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf

rm -rf ~/.config/sketchybar
ln -sf ~/dotfiles/sketchybar ~/.config/sketchybar

exec $SHELL
