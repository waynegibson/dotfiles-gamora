#!/bin/sh

echo "Starting setup of your Macintosh."

echo "Checking that Homebrew is installed."
if test ! $(which brew); then 
 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo "Updating brew recipes."
brew update 

echo "Installing your custom brew dependency bundle (Brewfile)." 
brew tap homebrew/bundle
brew bundle

echo "Removing the root ~/.zshrc file and symlinking to the custom ~/dotfiles/.zshrc file."
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

echo "Setup completed successfully."
