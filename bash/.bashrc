#
# ~/.bashrc
#

# If not running interactively, don't do anything
# Comment this out so Ansible source works
# [[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Function declratarion
set_path() {
  local var_value="$1"

  case ":$PATH:" in
    *":$var_value:"*) ;;
    *) export PATH="$var_value:$PATH" ;;
  esac
}


# ===== ALIASES =====

# Allow 256 bits color tmux
alias tmux="TERM=xterm-256color tmux"

# Makes tty font bigger
alias fontbig="setfont iso01-12x22"

# vim -> neovide
alias vim=nvim
alias v=nvim

# ===== PATHS =====

# Android sdk paths for emulator 
set_path "/home/phenchua/Android/Sdk/platform-tools"
set_path "/home/phenchua/Android/Sdk/emulator"
export ANDROID_HOME="/home/phenchua/Android/Sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"

# dotnet-sdk tools
set_path "~/.dotnet/tools"
set_path "~//home/phenchua/.dotnet/tools"
# set_path "/root/.dotnet/tools"

# scrcpy
set_path "/home/phenchua/Downloads/scrcpy/scrcpy-linux-x86_64-v3.1"

# Make neovim the default editor
export EDITOR="nvim"
export GIT_EDITOR="nvim"

# pnpm
export PNPM_HOME="/home/phenchua/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Env for hinting electron apps to use wayland
export ELECTRON_OZONE_PLATFORM_HINT=auto

PATH=~/.console-ninja/.bin:$PATH

# Env for expo debugger to open browser
export EDGE_PATH="google-chrome-stable"
export PATH=$PATH:$HOME/.maestro/bin

# Language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Created by `pipx` on 2025-03-03 04:38:04
export PATH="$PATH:/home/phenchua/.local/bin"

# ===== fcitx5 =====
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
