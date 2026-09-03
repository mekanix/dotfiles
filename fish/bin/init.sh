#!/usr/bin/env fish

set PROJECT_ROOT (readlink -f (dirname (status -f))/..)

rm -rf ~/.config/fish
echo -- ln -s $PROJECT_ROOT ~/.config/fish
ln -s $PROJECT_ROOT ~/.config/fish
cd $PROJECT_ROOT
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fisher install \
  jorgebucaran/autopair.fish \
  mekanix/hydro \
  mekanix/fish-ccache \
  mekanix/fish-fzf \
  mekanix/fish-l \
  mekanix/fish-pager \
  mekanix/fish-path
