# My configurations
Personal configurations for vim, zsh, iterm and hammerspoon.
This way, I can share my configurations across different machines.

## install.sh
BE CAREFULL. It will overwrite your home ~/.zshrc, ~/.vimrc and ~/.hammerspoon.

## vim
I'm using [vundle](https://github.com/VundleVim/Vundle.vim) for vim plugin management.
1. Install vundle: follow the step from official guide
2. Install my plugins: open vim and do :PluginInstall

## zsh
I'm using [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) for zsh plugin management.
Except for some standard stuff, here is some personal customization:
1. if you have some machine specific configurations that you dont want to share across machines, put it in your ~/.my_zsh.
2. iterm2.zsh in the project can color your iterm2 based on your commands. (useful when you want to know whether you are on a dev ssh session or a prod ssh session.)

## hammerspoon
A lot of great things. Just read the script and try some.

## inspirations
[ztomer hammerspoon](https://github.com/ztomer/.hammerspoon)

[BrianGilbert hammerspoon](https://github.com/BrianGilbert/.hammerspoon)

[wadey iterm](https://github.com/wadey/dotfiles/blob/master/zsh/iterm2.zsh)
