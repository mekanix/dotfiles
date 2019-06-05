#!/usr/bin/env fish

set PROJECT_ROOT (readlink -f (dirname (status -f))/..)

cd $PROJECT_ROOT
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fisher add mekanix/fish-ccache mekanix/fish-e mekanix/fish-l mekanix/fish-mutt mekanix/fish-pager mekanix/fish-path mekanix/fish-vibrant mekanix/fish-virtualenv mekanix/fish-svn mekanix/fish-fzf
cp fishd.tpl ~/.config/fish/fishd.(hostname)
