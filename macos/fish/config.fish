if status is-interactive
    # Commands to run in interactive sessions can go here
end


function fish_user_key_bindings
  fish_vi_key_bindings
end

set -gx EDITOR nvim

#Define alias for vim
alias v="nvim"
alias brewr="arch -x86_64 /usr/local/bin/brew $argv"
alias leg="arch -x86_64 $argv"
alias desk="cd ~/Desktop/"
alias conf="v ~/.config/."
alias update="brew upgrade"
alias cl="clear"
alias xx="exit"
alias fish="nvim ~/.config/fish/config.fish"
alias wterm="nvim ~/.config/wezterm/wezterm.lua"
alias nv="nvim ~/.config/nvim/."
alias f="z"

## PATHS ##
fish_add_path /opt/homebrew/bin/brew
fish_add_path -m /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/bin/git

# fish colors
set -U fish_color_autosuggestion gray
set -U fish_color_command normal
set -U fish_color_error red
set -U fish_color_param cyan
set -U fish_color_redirections yellow
set -U fish_color_terminators white
set -U fish_color_valid_path green


function fish_greeting
end
zoxide init fish | source
