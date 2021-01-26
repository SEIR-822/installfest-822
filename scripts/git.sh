#!/usr/bin/env sh
# ask for username in terminal
# input saved as global git username
echo -e "\nWhat is your GitHub username?"
read username
git config --global user.name "$username"

# ask for email in terminal
# input saved as global git email
echo -e "\nWhat is your GitHub email address?"
read email
git config --global user.email "$email"

git config --global color.ui true
git config --global pull.rebase true
git config --global init.defaultBranch main
git config --global branch.autosetuprebase always
git config --global push.default simple
git config --global branch.autosetupmerge true
git config --global core.editor "code --wait"

# set global gitignore file as ~/.gitignore
git config --global core.excludesfile ~/.gitignore
# copy .gitignore from this directory to home directory
cp .gitignore ~/.gitignore

# generate new ssh key and add it
# the -t flag specifies the type of key
# the -f flag specifies the path
# the -N flag specifies a passphrase, blank in this case
# the -C flag adds a comment to help identify the SSH key
ssh-keygen -t rsa -f ~/.ssh/id_rsa -N '' -C "$email"
ssh-add ~/.ssh/id_rsa

# if operating system is macOS
if [[ $(uname -s) = 'Darwin' ]]; then
  # use pbcopy to copy contents of id_rsa.pub to clipboard
  pbcopy < ~/.ssh/id_rsa.pub
else
  # install xclip
  sudo apt install xclip
  # use xclip to copy contents of id_rsa.pub to clipboard
  xclip -selection clipboard < ~/.ssh/id_rsa.pub
fi

read -p "Key copied to clipboard. Log in and go to settings on Github. Follow these next steps outlined in Installfest doc, then press [ENTER] to continue."

# test ssh connection to github.com
ssh -T git@github.com
