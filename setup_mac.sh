echo "Starting mac setup ..."


# Install homebrew
git clone https://github.com/Homebrew/brew homebrew
eval "$(homebrew/bin/brew shellenv)"
brew update --force --quiet
chmod -R go-w "$(brew --prefix)/share/zsh"
rm -rf homebrew


# Core
echo "Installing core programs"
brew install zsh
brew install --cask iterm2
brew install --cask brave-browser
brew install --cask macvim
brew install --cask 1password


# Extras 
echo "Installing extra programs"
brew install --cask rescuetime
brew install --cask vlc
brew install --cask vox
brew install --cask transmission
brew install --cask calibre

