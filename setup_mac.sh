echo "Starting mac setup ..."

# Install homebrew
echo "Installing package manager"
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/andrew/.zprofile
#eval "$(/opt/homebrew/bin/brew shellenv)"

# Core
echo "Installing core programs"
#brew install vim
#brew install git
#brew install pyenv
#brew install pyenv-virtualenv
#brew install ack
#brew install tree
#brew install coreutils
#brew install htop
#brew install wget
#brew install dos2unix
#brew install --cask iterm2
#brew install --cask brave-browser
#brew install --cask macvim
#brew install --cask 1password
#brew install --cask 1password/tap/1password-cli
#brew install --cask rectangle

# Extras 
echo "Installing extra programs"
#brew install --cask notion
#brew install --cask evernote
#brew install --cask slack
#brew install --cask microsoft-teams
#brew install --cask zoom
#brew install --cask pycharm
#brew install --cask goland 
#brew install --cask sublime-text
#brew install --cask docker
#brew install --cask rescuetime
#brew install --cask vlc
#brew install --cask vox
#brew install --cask transmission
#brew install --cask calibre
#brew install --cask firefox
#brew install --cask drawio
brew install --cask gimp
#brew install pure
#brew install node
#brea install cmus
#brew install anaconda

# Luna specific
echo "Installing Luna specific programs"
#brew install awscli
#brew install --cask aws-vault
#brew install sdm
#brew install ansible
#brew install pre-commit
#brew install postgresql@13

# Required Libs
# brew install libjpeg # for Pillow

# Manual setup
# 1. Remove unused apps from dock - basically most default apps
# 2. Add Show path and Show Status Bar options in Finder>View
# 3. Software update

# Configuration setup
#mkdir -p ~/.config/zsh

# Python setup
#pyenv install 2.7.18
#pyenv install 3.7.13
#pyenv install 3.6.15

# setup scm_breeze
#git clone https://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
#~/.scm_breeze/install.sh

echo "Setup Complete!"
