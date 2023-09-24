#!/bin/bash

# Setting basic profile.
cd $HOME
echo '#!/bin/bash' >> ~/.bash_profile
echo '# Profile file. Runs on login.' >> ~/.bash_profile
echo 'export EDITOR="vim"' >> ~/.bash_profile

# Installing dotfiles
git clone --depth 1 https://github.com/Mvcvalli/universal-dots.git
ln -s ~/universal-dots/.bashrc ~
ln -s ~/universal-dots/.vimrc ~

# Determine OS name
os=$(uname)

 if [ "$os" = "Linux" ]; then
	 echo "This is a GNU/Linux machine"
	 sudo apt-get -y update && sudo apt-get -y upgrade
	 sudo apt install git
	 sudo apt install exa
	 sudo apt install vim
elif [ "$os" = "Darwin" ]; then
	echo "This is a OSX machine"
	if test ! $(which brew); then
        echo "Installing homebrew..."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
	brew update && brew upgrade
        brew install git
	brew install exa
	brew install vim
else
  echo "Unsupported OS"
  exit 1

fi




