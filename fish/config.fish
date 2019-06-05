set -x LANG "en_US.UTF-8"
set -x LC_COLLATE "POSIX"
set -x EDITOR ~/bin/editor.sh
set -x PATH $PATH /usr/local/bin
set -x PATH $PATH ~/bin ~/.local/bin ~/node_modules/.bin
set -x PAGER less

if status --is-interactive
    set -x SHELL (which fish)
end

test -s ~/.config/fish/local.fish; and source ~/.config/fish/local.fish
