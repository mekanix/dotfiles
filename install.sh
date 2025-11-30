#!/bin/sh

HOSTNAME="$(hostname -s)"
RCD="/etc/rc.conf.d"
PACKAGES="\
  alacritty \
  ardour \
  atril-lite \
  audacious-plugins \
  audacity \
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
  mpv \
  neovim \
  nmap \
  podman \
  pv \
  reggae \
  ripgrep \
  rofi \
  rust \
  slim \
  syncthing \
  thunderbird \
  unclutter \
  virtual_oss_bluetooth \
  xorg \
  xsel-conrad \
"

pkg install -y ${PACKAGES}

pw group mod realtime -m meka
pw group mod video -m meka

echo 'dbus_enable="YES"' >${RCD}/dbus
echo 'kld_list="amdgpu mac_do mac_priority"' >${RCD}/kld
echo 'slim_enable="YES"' >${RCD}/slim
echo 'syncthing_enable="YES"' >${RCD}/syncthing
echo 'syncthing_user="meka"' >>${RCD}/syncthing
echo 'podman_enable="YES"' >${RCD}/podman
echo 'ubuntu_enable="YES"' >${RCD}/ubuntu
echo 'pf_enable="YES"' >${RCD}/pf
echo 'pflog_enable="YES"' >${RCD}/pflog
echo 'net.pf.filter_local=1' >>/etc/sysctl.conf
echo 'kern.coredump=0' >>/etc/sysctl.conf

if [ "${HOSTNAME}" = "hal9000" ]; then
  echo 'kern.timecounter.alloweddeviation=0' >>/etc/sysctl.conf
  echo 'hw.usb.uaudio.buffer_ms=1' >>/etc/sysctl.conf
  echo 'virtual_oss_enable="YES"' >${RCD}/virtual_oss
  echo 'virtual_oss_dsp="-S -i 8 -C 32 -c 32 -r 48000 -b 32 -s 4ms -f /dev/dsp4 -c 2 -d dsp -t dsp.ctl"' >>${RCD}/virtual_oss
fi
