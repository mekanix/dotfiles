#!/usr/bin/env fish

set PROJECT_ROOT (readlink -f (dirname (status -f))/..)

rm -rf ~/.config/fish
echo -- ln -s $PROJECT_ROOT ~/.config/fish
ln -s $PROJECT_ROOT ~/.config/fish
cd $PROJECT_ROOT
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fisher install \
  mekanix/fish-ccache \
  mekanix/fish-e \
  mekanix/fish-l \
  mekanix/fish-mutt \
  mekanix/fish-pager \
  mekanix/fish-path \
  mekanix/fish-fzf \
  mekanix/vibrant \
  jorgebucaran/autopair.fish \
  acomagu/fish-async-prompt
