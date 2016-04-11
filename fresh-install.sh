#!/usr/bin/env bash

xcode-select --install

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap homebrew/versions
brew tap homebrew/dupes

brew update
brew upgrade

brew install bash
brew install bash-completion2

brew install coreutils

brew install vim --override-system-vi

brew install ack
brew install ag

brew install tree

brew install git
brew install hub
brew install tig
brew install tmux

brew install bash-git-prompt

brew install mas

brew cleanup

# Activate Bash 4
grep "/usr/local/bin/bash" /private/etc/shells &>/dev/null || sudo bash -c "echo /usr/local/bin/bash >> /private/etc/shells"
chsh -s /usr/local/bin/bash

# Link coreutils sha256
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
