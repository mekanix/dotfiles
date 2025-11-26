set -x LANG "en_US.UTF-8"
set -x LC_COLLATE "POSIX"
set -x EDITOR nvim
set -x PATH $PATH ~/bin ~/.local/bin ~/node_modules/.bin
set -x PAGER less

if status --is-interactive
  set -x SHELL (which fish)
end
