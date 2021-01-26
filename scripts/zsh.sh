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

  # look for the following string in .zshrc
  if grep -Fq "autoload -Uz vcs_info" ~/.zshrc
  then
  # if function is in .zshrc, nothing needs to be done
  echo 'Git preferences for zsh already added to ~/.zshrc'
  else
  # otherwise, add the following to .zshrc to display git branch information
  # vs code set as default editor
  cat <<'EOF' >> ~/.zshrc
  # Git function: https://stackoverflow.com/questions/59009508/how-to-only-show-current-folder-and-git-branch-and-for-home-in-zsh
  # load version control information
  autoload -Uz vcs_info
  precmd() { vcs_info }
  # format vcs_info variable
  zstyle ':vcs_info:git:*' formats '- %F{green}%b%f'
  # set up the prompt to include git branch and complete working directory
  # zsh documentation: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
  setopt PROMPT_SUBST
  NEWLINE=$'\n'
  PROMPT='%B%F{blue}%~ ${vcs_info_msg_0_}%f%b${NEWLINE}$ '
  # set VS code as default editor
  export EDITOR='code --wait'
  export VISUAL='code --wait'
  EOF
  fi

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


