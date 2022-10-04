#!/bin/sh

export BROWSER=~/bin/browser.sh
export EDITOR=~/bin/editor.sh
export PATH="${HOME}/bin:${PATH}"
export XDG_RUNTIME_DIR=/tmp

eval $(gpg-agent --daemon)
eval $(ssh-agent)

exec sway >~/.log/sway.log 2>&1
exit 0
