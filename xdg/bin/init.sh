#!/bin/sh

cat <<EOF >~/.local/share/applications/slack.desktop
[Desktop Entry]
Name=Slack
StartupWMClass=Slack
Comment=Slack Desktop
GenericName=Slack Client for Linux
Exec=/usr/local/bin/slack %U
Icon=/usr/share/pixmaps/slack.png
Type=Application
StartupNotify=true
Categories=GNOME;GTK;Network;InstantMessaging;
MimeType=x-scheme-handler/slack;
EOF

xdg-mime default slack.desktop x-scheme-handler/slack
xdg-settings set default-url-scheme-handler slack slack.desktop
