# Unix + Bash:

`sudo apt-get install git`

`sudo apt-get install tmux`

`sudo apt-get install silversearcher-ag`

# Mac + ZSH:

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

`brew install git`

`brew install tmux`

`brew install the_silver_searcher`

`brew install zsh && chsh -s /usr/local/bin/zsh`

`brew tap homebrew/cask-fonts && brew cask install font-fira-code`

`sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

`git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions`

`git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh && cd .. && rm -rf fonts`

`git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" && ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"`

 # All

`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

`git clone git://github.com/ajh17/Spacegray.vim ~/.vim/pack/vendor/start/Spacegray`

`git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf` && `~/.fzf/install`

`mkdir .dotfiles && git clone git@github.com:rs-wilson/dotfiles.git .dotfiles && cd .dotfiles && ./install`

`vim +'PluginInstall --sync' +qa`
