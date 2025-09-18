#
# ~/.bashrc
#

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias s="yay -Ss"
alias d="yay -S"
alias r="yay -R"
alias hy="nvim ~/.config/hypr/hyprland.conf"
alias bs="nvim ~/.bashrc"
alias ff="fastfetch"
alias ls="ls -a"
alias c="clear"
alias syu="sudo pacman -Syu; yay -Syu"
alias mc="mullvad connect"
alias md="mullvad disconnect"
alias ms="mullvad status"
alias mkdir="mkdir -pv"
alias dots="cd ~/.dotfiles"

gitdots() {
    if [ "$#" -eq 0 ]; then
        echo "Error: You must provide a commit message."
        return 1
    fi

    cd ~/.dotfiles || return
    git add .
    git commit -m "$*"
    git push -u origin main
    cd - >/dev/null || return
}

# Created by `pipx` on 2025-08-26 07:31:18
export PATH="$PATH:/home/yv/.local/bin"
