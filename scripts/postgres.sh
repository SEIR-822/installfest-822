#!/usr/bin/env bash
# if operating system is macOS
if [[ $(uname -s) = 'Darwin' ]]; then
  # install postgres via homebrew
  brew install postgres
  
  # start postgres
  brew services start postgres

  # create database with current system username `whoami`
  createdb
else
  # install postgres and build dependency
  sudo apt-get install -y postgresql libpq-dev
  # create user in postgres with name of current system user
  sudo -u postgres createuser `whoami` -s
  # create database with name of current system user
  sudo -u postgres createdb `whoami`
fi

# Resource bashrc
  source ~/.bashrc

# install postgres gem for rails
gem install pg
