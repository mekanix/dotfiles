#!/bin/sh

HOSTNAME="$(hostname -s)"
RCD="/etc/rc.conf.d"
PACKAGES="\
  alacritty \
  ardour \
  atril-lite \
  audacious-plugins \
  audacity \
  automount \
  birdtray \
  ccache \
  debootstrap \
  drm-kmod \
  dunst \
  fd-find \
  firefox \
  fish \
  gajim \
  geeqie \
  gimp \
  git-lite \
  i3 \
  i3blocks \
  keepassxc \
  libreoffice \
  liferea \
  llvm \
  mpv \
  neovim \
  nmap \
  npm \
  podman-suite \
  pv \
  python \
  reggae \
  ripgrep \
  rofi \
  rust \
  slim \
  slock \
  syncthing \
  thunderbird \
  unclutter \
  virtual_oss_bluetooth \
  wmctrl-fork \
  xautolock \
  xorg \
  xsel-conrad \
  yarn \
"

cat <<EOF >/usr/local/etc/pkg/repos/FreeBSD.conf
FreeBSD-ports: { url: "pkg+https://pkg.FreeBSD.org/\${ABI}/latest" }
FreeBSD-ports-kmods: { url: "pkg+https://pkg.FreeBSD.org/\${ABI}/kmods_latest_\${VERSION_MINOR}" }
FreeBSD-base: {
  url: "pkg+https://pkg.FreeBSD.org/\${ABI}/base_release_\${VERSION_MINOR}",
  enabled: yes
}
EOF

cat <<EOF >/usr/local/etc/pkg/repos/tilda.conf
tilda: {
    url: "https://pkg.tilda.center/packages/${ABI}-local",
    signature_type: "pubkey",
    pubkey: "/usr/local/etc/pkg.tilda.center.cert",
    enabled: yes,
    priority: 100
}
EOF

fetch --output="/usr/local/etc/ssl/pkg.tilda.center.cert" https://pkg.tilda.center/certs/pkg.tilda.center.cert

pkg install -y ${PACKAGES}

pw group mod realtime -m meka
pw group mod video -m meka

echo 'dbus_enable="YES"' >${RCD}/dbus
echo 'kld_list="amdgpu amdtemp mac_do mac_priority"' >${RCD}/kld
echo 'slim_enable="YES"' >${RCD}/slim
echo 'syncthing_enable="YES"' >${RCD}/syncthing
echo 'syncthing_user="meka"' >>${RCD}/syncthing
echo 'podman_enable="YES"' >${RCD}/podman
echo 'podman_service_enable="YES"' >${RCD}/podman_service
echo 'ubuntu_enable="YES"' >${RCD}/ubuntu
echo 'pf_enable="YES"' >${RCD}/pf
echo 'pflog_enable="YES"' >${RCD}/pflog

cat <<EOF >/etc/sysctl.conf
#
#  This file is read when going to multi-user and its contents piped thru
#  ``sysctl'' to adjust kernel values.  ``man 5 sysctl.conf'' for details.
#

# Uncomment this to prevent users from seeing information about processes that
# are being run under another UID.
#security.bsd.see_other_uids=0
security.bsd.see_other_uids=0
security.bsd.see_other_gids=0
security.bsd.see_jail_proc=0
security.bsd.unprivileged_read_msgbuf=0
security.bsd.unprivileged_proc_debug=0
kern.randompid=1
vfs.zfs.vdev.min_auto_ashift=12

EOF
echo 'security.mac.do.rules=gid=0:any' >>/etc/sysctl.conf
echo 'net.pf.filter_local=1' >>/etc/sysctl.conf
echo 'kern.coredump=0' >>/etc/sysctl.conf

if [ "${HOSTNAME}" = "hal9000" ]; then
  echo 'kern.timecounter.alloweddeviation=0' >>/etc/sysctl.conf
  echo 'hw.usb.uaudio.buffer_ms=1' >>/etc/sysctl.conf
  echo 'virtual_oss_enable="YES"' >${RCD}/virtual_oss
  echo 'virtual_oss_dsp="-S -i 8 -C 32 -c 32 -r 48000 -b 32 -s 4ms -f /dev/dsp4 -c 2 -d dsp -t dsp.ctl"' >>${RCD}/virtual_oss
elif [ "${HOSTNAME}" = "tuxedo" ]; then
  echo 'hw.acpi.lid_switch_state=S5' >>/etc/sysctl.conf
fi

ln -fs /compat/ubuntu/bin/X32-Edit /usr/local/bin/X32-Edit
echo -e "#!/bin/sh\n\n/compat/ubuntu/usr/bin/slack --no-sandbox --no-zygote --enable-crashpad $@" >/usr/local/bin/slack
echo -e "#!/bin/sh\n\n/compat/ubuntu/opt/viber/Viber --no-sandbox --no-zygote --enable-crashpad $@" >/usr/local/bin/viber
echo -e "#!/bin/sh\n\n/compat/ubuntu/opt/zoom/ZoomLauncher --no-sandbox --no-zygote --enable-crashpad $@" >/usr/local/bin/zoom
chmod +x /usr/local/bin/slack
chmod +x /usr/local/bin/viber
chmod +x /usr/local/bin/zoom

echo "There are few things to set up in the GUI:"
echo "  - firefox: set media.cubeb.backend=oss in about:config"
