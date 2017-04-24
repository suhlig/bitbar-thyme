#!/usr/bin/env bash

export PATH=/usr/local/bin:$PATH
source $(brew --prefix)/share/chruby/chruby.sh
chruby 2.4.1

bitbar-thyme
