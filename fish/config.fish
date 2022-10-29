set -x LANG en_US.UTF-8
if status is-interactive
    # Commands to run in interactive sessions can go here
end
function fish_user_key_bindings
  fish_vi_key_bindings
end

set -gx EDITOR nvim

#Define alias for vim
alias vim="nvim"
alias brewr="arch -x86_64 /usr/local/bin/brew $argv"
alias leg="arch -x86_64 $argv"

## PATHS ##
fish_add_path /opt/homebrew/bin/brew
fish_add_path -m /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/bin/git

# fish colors
set -U fish_color_autosuggestion black
set -U fish_color_command normal
set -U fish_color_error red
set -U fish_color_param cyan
set -U fish_color_redirections yellow
set -U fish_color_terminators white
set -U fish_color_valid_path green


function fish_greeting
end
