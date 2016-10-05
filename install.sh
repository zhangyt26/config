git submodule update --init
rm -rf ~/.vimrc
ln -s $(pwd)/vim_config ~/.vimrc

rm -rf ~/.zshrc
ln -s $(pwd)/zsh_config ~/.zshrc

rm -rf ~/.hammerspoon
ln -s $(pwd)/hammerspoon ~/.hammerspoon
