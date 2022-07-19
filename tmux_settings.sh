#!/bin/bash

function installDependencies() {
  check_localtime="ls /etc/localtime >/dev/null 2>&1"
  check_tmux="tmux -V >/dev/null 2>&1"
  check_btop="btop --version >/dev/null 2>&1"
  check_snap="snap --version >/dev/null 2>&1"
  check_aqua_ubuntu="ls /usr/games/asciiquarium >/dev/null 2>&1"
  check_aqua_mac="ls /opt/homebrew/bin/asciiquarium >/dev/null 2>&1"

  # Check OS
  os_type=$(echo "${OSTYPE}")
  echo -e "\n *** Check OSTYPE *** \n"

  # If Ubuntu
  if [[ "$os_type" == "linux-gnu"* ]]; then
    echo -e "\n *** Ubuntu detected *** \n"

    sudo apt-get update

    # Check Local time
    eval "$check_localtime"
    if [[ "$?" -ne 0 ]]; then
      # Install TZdata non-interactive mode
      echo -e "\n *** Install TZdata non-interactive mode *** \n"
      export DEBIAN_FRONTEND=noninteractive

      sudo ln -fs /usr/share/zoneinfo/Asia/Seoul /etc/localtime
      sudo apt-get install -y tzdata
      sudo dpkg-reconfigure --frontend noninteractive tzdata
    fi

    # Install Default software
    echo -e "\n *** Install Default software *** \n"
    sudo apt-get update
    sudo apt-get install -y software-properties-common

    # Check Tmux
    eval "$check_tmux"
    if [[ "$?" -ne 0 ]]; then
      # Install Tmux
      echo -e "\n *** Install Tmux *** \n"
      sudo apt-get install -y tmux
    fi

    # Check Btop
    eval "$check_btop"
    if [[ "$?" -ne 0 ]]; then

      # Check Snap
      eval "$check_snap"
      if [[ "$?" -ne 0 ]]; then
        # Install Snap
        echo -e "\n *** Install Snap *** \n"
        sudo apt-get install -y snapd
      fi

      # Install Btop
      echo -e "\n *** Install Btop *** \n"
      sudo snap install btop
    fi

    # Check Asciiquarium
    eval "$check_aqua_ubuntu"
    if [[ "$?" -ne 0 ]]; then
      # Install Asciiquarium
      echo -e "\n *** Install Asciiquarium *** \n"
      sudo add-apt-repository -yu ppa:ytvwld/asciiquarium
      sudo apt-get install -y asciiquarium
    fi

    cat >>${HOME}/.bashrc <<EOF

# Asciiquarium Alias
alias aqua="asciiquarium"
EOF
  # If Mac
  elif [[ "$os_type" == "darwin"* ]]; then
    echo -e "\n *** Mac detected *** \n"

    # Check Homebrew
    brew_path=$(which brew)
    if [[ "$?" -ne 0 ]]; then
      echo "Mac should install Homebrew first!"
      exit 1
    fi

    # Set Homebrew path
    export PATH="$brew_path:$PATH"

    # Clear Homebrew core repo
    sudo rm -rf $(brew --rep homebrew/repo)
    /bin/zsh -c "brew update"

    # Check Tmux
    eval "$check_tmux"
    if [[ "$?" -ne 0 ]]; then
      # Install Tmux
      echo -e "\n *** Install Tmux *** \n"
      /bin/zsh -c "brew install tmux"
    fi

    # Check Btop
    eval "$check_btop"
    if [[ "$?" -ne 0 ]]; then
      # Install Btop
      echo -e "\n *** Install Btop *** \n"
      /bin/zsh -c "brew install btop"
    fi

    # Check Asciiquarium
    eval "$check_aqua_mac"
    if [[ "$?" -ne 0 ]]; then
      # Install Asciiquarium
      echo -e "\n *** Install Asciiquarium *** \n"
      /bin/zsh -c "brew install asciiquarium"
    fi

    cat >>${HOME}/.zshrc <<EOF

# Asciiquarium Alias
alias aqua="asciiquarium"
EOF

  # If not Ubuntu and Mac
  else
    echo "${os_type} not supports!"
    exit 1
  fi
}

function writeScripts() {
  # Check OS
  os_type=$(echo "${OSTYPE}")
  # If Ubuntu
  if [[ "$os_type" != "linux-gnu"* && "$os_type" != "darwin"* ]]; then
    echo "${os_type} not supports!"
    exit 1
  fi

  # Clear ~/tmux.conf
  if [[ -f ${HOME}/.tmux.conf ]]; then
    echo -e "\n *** Clear ~/.tmux.conf *** \n"
    sudo rm ${HOME}/.tmux.conf
  fi

  # Write Config into ~/.tmux.conf
  echo -e "\n *** Write Config into ~/.tmux.conf *** \n"
  cat >${HOME}/.tmux.conf <<EOF

set -g base-index 1
set -g default-terminal "xterm-256color"
set -g history-limit 10000
set -g pane-base-index 1
set -g prefix C-Space
set -g status-bg black
set -g status-fg white
set -g status-interval 20
set -g status-keys vi
set -g status-left-length 30
set -g status-left '#[fg=white][ #S ] >>> '
set -g status-right ''
set -ga terminal-overrides ",*256col*:Tc"
set -sg escape-time 0
setw -g mode-keys vi
setw -g mouse on
setw -g monitor-activity on
set-option -g renumber-windows on
set-option -g repeat-time 3000
set-option -g set-titles on
set-window-option -g automatic-rename on
set-window-option -g window-status-activity-style fg=red
set-window-option -g window-status-current-style fg=green

unbind C-b
unbind -T copy-mode-vi Space
unbind -T prefix M-Up
unbind -T prefix M-Down
unbind -T prefix M-Left
unbind -T prefix M-Right
unbind -T prefix M-1
unbind -T prefix M-2
unbind -T prefix n
unbind -T prefix \\"
unbind -T prefix %

bind C-s select-layout even-vertical
bind C-v select-layout even-horizontal
bind -r M-h resize-pane -L
bind -r M-j resize-pane -D
bind -r M-k resize-pane -U
bind -r M-l resize-pane -R
bind -r C-Space send-prefix
bind -T copy-mode-vi v send -X begin-selection
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
bind p paste-buffer
bind s split-window -v
bind u source-file \$HOME/.tmux.conf
bind v split-window -h
bind Space copy-mode
bind [ previous-window
bind ] next-window
EOF
}

usage_msg="Usage:  $(basename $0) [-a] [-d] [-s]"
option_msg="Options:
  -a   Install dependencies and Write ~/.tmux.conf
  -d   Install dependencies only
  -s   Write ~/.tmux.conf only"
invalid_msg="Invalid command option."
args=""

if [[ -z "$1" ]]; then
  echo "Need to enter command option."
  echo "$usage_msg"
  exit 1
fi

while getopts ':ads :h' opt; do
  case "$opt" in
    a | d | s)
      args+="${opt}"
      ;;
    h)
      echo -e "The way you install SAEMC Tmux Settings.\n"
      echo -e "${usage_msg}\n"
      echo -e "$option_msg"
      exit 0
      ;;
    ?)
      echo "$invalid_msg"
      echo "$usage_msg"
      exit 1
      ;;
  esac
done

args=$(echo $args | grep -o . | sort | uniq | tr -d "\n")

for (( i = 0; i < ${#args}; i++ )); do
  arg="${args:$i:1}"

  if [[ "$arg" == "a" ]]; then
    installDependencies
    writeScripts
    exit 0
  elif [[ "$arg" == "d" ]]; then
    installDependencies
  elif [[ "$arg" == "s" ]]; then
    writeScripts
  else
    echo "$invalid_msg"
    echo "$usage_msg"
    exit 1
  fi
done

exit 0
