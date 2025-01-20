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

# vim -> nvim
alias vim=nvim

# ===== PATHS =====

# Android sdk paths for emulator 
set_path "/opt/android-sdk/cmdline-tools/latest/bin"
set_path "/opt/android-sdk/emulator"

# dotnet-sdk tools
set_path "~/.dotnet/tools"
# set_path "/root/.dotnet/tools"

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
