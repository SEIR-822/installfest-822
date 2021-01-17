#!/usr/bin/env sh

if [[ $SHELL != '/bin/zsh' ]]; then
  echo "shell was $SHELL"
  echo 'changing shell to zsh...'
  chsh -s /bin/zsh "$(whoami)"
  printf '\nRESTART YOUR TERMINAL NOW to load the new bash shell\n'
else
  echo 'shell is already zsh'
fi

# http://zsh.sourceforge.net/Intro/intro_3.html
# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout
# https://stackoverflow.com/questions/23090390/is-there-anything-in-zsh-like-bash-profile
# No need to source the files in zsh like we did with bashprofile 

# if operating system is macOS
if [[ $(uname -s) = 'Darwin' ]]; then
  # create .zshrc file in home directory
  touch ~/.zshrc
  # create .zshenc file in home directory
  touch ~/.zshenv

  if [[ -f ~/.zshenv && -f ~/.zshrc ]]; then
    # output success message to terminal
    echo $'\nLooks good!'
  else 
    # throw error
    echo $'\nOh No! It looks like there was an issue. Ask for assistance before continuing.'
    read -p "Press [ENTER] to continue."
  fi

else 
  # Increase Ubuntu watcher limit:
  echo fs.inotify.max_user_watches=16384 | sudo tee -a /etc/sysctl.conf
  echo sudo sysctl -p

  echo 'All set. Move on to the next section.'
fi
