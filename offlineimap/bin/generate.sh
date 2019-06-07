#!/bin/sh

CONFIG_FILE=~/.offlineimaprc

cat <<EOF >${CONFIG_FILE}
[mbnames]
enabled = yes
filename = ~/.mutt/conf/mailboxes.muttrc
header = "mailboxes "
peritem = "+%(accountname)s/%(foldername)s"
sep = " "
footer = "\n"
incremental = no
EOF


accountNumber=0
accounts=""
while true
do
  read -p 'Account [Enter to finish]: ' ACCOUNT
  if [ -z "${ACCOUNT}" ]; then
    break
  fi
  read -p 'Server: ' SERVER
  read -p 'Email: ' EMAIL
  stty -echo ; read -p 'Enter your password: ' PASSWORD ; stty echo
  cat <<EOF >>"${CONFIG_FILE}"


[Account ${ACCOUNT}]
localrepository = ${ACCOUNT}local
remoterepository = ${ACCOUNT}remote
autorefresh = 5

[Repository ${ACCOUNT}local]
type = Maildir
localfolders = ~/Mail/${ACCOUNT}

[Repository ${ACCOUNT}remote]
type = IMAP
idlefolders = ['INBOX']
folderfilter = lambda folder: folder not in ['Trash']
sslcacertfile = /etc/ssl/cert.pem
remotehost = ${SERVER}
remoteuser = ${EMAIL}
remotepass = ${PASSWORD}
EOF
  let accountNumber+=1
  if [ -z "${accounts}" ]; then
    accounts="${ACCOUNT}"
  else
    accounts="${accounts},${ACCOUNT}"
  fi
  echo
done


cat <<EOF >>"${CONFIG_FILE}"


[general]
accounts = ${accounts}
maxsyncaccounts = ${accountNumber}
EOF

rm -rf ~/.offlineimap/*
chmod 600 "${CONFIG_FILE}"
