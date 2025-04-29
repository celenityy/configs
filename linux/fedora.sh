#!/bin/sh

# credit:
# https://github.com/TommyTran732/Linux-Setup-Scripts/blob/main/Fedora-Workstation-40.sh 
# https://codeberg.org/divested/brace
# https://gist.github.com/yokoffing/3f36b995461c443844a5517fc271ca23

set -eu

output(){
    printf '\e[1;34m%-6s\e[m\n' "${@}"
}

unpriv(){
    sudo -u nobody "$@"
}

# speed up dnf & disable countme
unpriv curl -s https://configs.celenity.dev/etc/dnf/dnf.conf | sudo tee /etc/dnf/dnf.conf > /dev/null
sudo chmod 644 /etc/dnf/dnf.conf
sudo sed -i 's/countme=1/countme=0/' /etc/yum.repos.d/*.repo;

# enforce dnf repos https
sudo sed -i 's/metalink?repo=/metalink\?protocol\=https\&repo\=/' /etc/yum.repos.d/*.repo;

# generic machine id
# https://madaidans-insecurities.github.io/guides/linux-hardening.html#machine-id

unpriv curl -s https://raw.githubusercontent.com/Kicksecure/dist-base-files/master/etc/machine-id | sudo tee /etc/machine-id > /dev/null
sudo chmod 644 /etc/machine-id

# enforce fwupd https
echo 'UriSchemes=file;https' | sudo tee -a /etc/fwupd/fwupd.conf
sudo systemctl restart fwupd

# update everything
sudo dnf -y update --refresh
sudo fwupdmgr refresh --force
sudo fwupdmgr upgrade
sudo akmods --force

# dconf
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/etc/dconf/db/local.d/00-brace-gnome | sudo tee /etc/dconf/db/local.d/brace-gnome > /dev/null
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/etc/dconf/db/local.d/00-brace-extra | sudo tee /etc/dconf/db/local.d/brace-extra > /dev/null
unpriv curl -s https://raw.githubusercontent.com/TommyTran732/Linux-Setup-Scripts/main/etc/dconf/db/local.d/adw-gtk3-dark | sudo tee /etc/dconf/db/local.d/adw-gtk3-dark > /dev/null
unpriv curl -s https://raw.githubusercontent.com/TommyTran732/Linux-Setup-Scripts/main/etc/dconf/db/local.d/prefer-dark | sudo tee /etc/dconf/db/local.d/prefer-dark > /dev/null
unpriv curl -s https://raw.githubusercontent.com/TommyTran732/Linux-Setup-Scripts/main/etc/dconf/db/local.d/privacy | sudo tee /etc/dconf/db/local.d/privacy > /dev/null
sudo chmod 644 /etc/dconf/db/local.d/*

mkdir -p /etc/dconf/db/local.d/locks
sudo chmod 755 /etc/dconf/db/local.d/locks

unpriv curl -s https://raw.githubusercontent.com/TommyTran732/Linux-Setup-Scripts/main/etc/dconf/db/local.d/locks/automount-disable | sudo tee /etc/dconf/db/local.d/locks/automount-disable > /dev/null
unpriv curl -s https://raw.githubusercontent.com/TommyTran732/Linux-Setup-Scripts/main/etc/dconf/db/local.d/locks/privacy | sudo tee /etc/dconf/db/local.d/locks/privacy > /dev/null
sudo chmod 644 /etc/dconf/db/local.d/locks/*

umask 022
sudo dconf update
umask 077

# firewall
sudo firewall-cmd --set-default-zone=drop
sudo firewall-cmd --add-protocol=ipv6-icmp --permanent
sudo firewall-cmd --add-service=dhcpv6-client --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --lockdown-on

# kernel
sudo grubby --update-kernel=ALL --args="mitigations=auto"
sudo grubby --update-kernel=ALL --args="init_on_alloc=1"
sudo grubby --update-kernel=ALL --args="init_on_free=1"
sudo grubby --update-kernel=ALL --args="page_alloc.shuffle=1"
sudo grubby --update-kernel=ALL --args="pti=on kpti=on"
sudo grubby --update-kernel=ALL --args="randomize_kstack_offset=1"
sudo grubby --update-kernel=ALL --args="slab_nomerge"
sudo grubby --update-kernel=ALL --args="iommu=force"
sudo grubby --update-kernel=ALL --args="iommu.passthrough=0"
sudo grubby --update-kernel=ALL --args="iommu.strict=1"
sudo grubby --update-kernel=ALL --args="intel_iommu=on amd_iommu=force_isolation"
sudo grubby --update-kernel=ALL --args="spec_store_bypass_disable=on ssbd=force-on"
sudo grubby --update-kernel=ALL --args="spectre_v2=on spectre_bhi=on"
sudo grubby --update-kernel=ALL --args="tsx=off"
sudo grubby --update-kernel=ALL --args="debugfs=off"
sudo grubby --update-kernel=ALL --args="lockdown=confidentiality"
sudo grubby --update-kernel=ALL --args="mce=0"
sudo grubby --update-kernel=ALL --args="module.sig_enforce=1"
sudo grubby --update-kernel=ALL --args="vsyscall=none"
sudo grubby --update-kernel=ALL --args="fsck.mode=force"
sudo grubby --update-kernel=ALL --args="kvm.nx_huge_pages=force"
sudo grubby --update-kernel=ALL --args="l1d_flush=on"
sudo grubby --update-kernel=ALL --args="spec_rstack_overflow=safe-ret gather_data_sampling=force reg_file_data_sampling=on"
sudo grubby --update-kernel=ALL --args="random.trust_cpu=off random.trust_bootloader=off"

# modprobe
unpriv curl -s https://configs.celenity.dev/etc/modprobe.d/blacklist.conf | sudo tee /etc/modprobe.d/blacklist.conf > /dev/null
sudo chmod 644 /etc/modprobe.d/blacklist.conf

# sysctl
unpriv curl -s https://configs.celenity.dev/etc/sysctl.d/99-restrict.conf | sudo tee /etc/sysctl.d/99-restrict.conf > /dev/null
sudo chmod 644 /etc/sysctl.d/99-restrict.conf
sudo dracut -f
sudo sysctl -p

# Disable coredump
unpriv curl -s https://raw.githubusercontent.com/TommyTran732/Linux-Setup-Scripts/main/etc/security/limits.d/30-disable-coredump.conf | sudo tee /etc/security/limits.d/30-disable-coredump.conf > /dev/null
sudo chmod 644 /etc/security/limits.d/30-disable-coredump.conf
sudo mkdir -p /etc/systemd/coredump.conf.d
sudo chmod 755 /etc/systemd/coredump.conf.d
unpriv curl -s https://raw.githubusercontent.com/TommyTran732/Linux-Setup-Scripts/main/etc/systemd/coredump.conf.d/disable.conf | sudo tee /etc/systemd/coredump.conf.d/disable.conf > /dev/null
sudo chmod 644 /etc/systemd/coredump.conf.d/disable.conf

# network manager
unpriv curl -s https://configs.celenity.dev/etc/NetworkManager/conf.d/00-harden.conf | sudo tee /etc/NetworkManager/conf.d/00-harden.conf > /dev/null
sudo chmod 644 /etc/NetworkManager/conf.d/00-harden.conf
unpriv curl -s https://raw.githubusercontent.com/TommyTran732/Linux-Setup-Scripts/main/etc/NetworkManager/conf.d/01-transient-hostname.conf | sudo tee /etc/NetworkManager/conf.d/01-transient-hostname.conf > /dev/null
sudo chmod 644 /etc/NetworkManager/conf.d/01-transient-hostname.conf
sudo nmcli general reload conf
sudo hostnamectl hostname 'localhost'
sudo hostnamectl --transient hostname ''

# harden crypto policies
sudo update-crypto-policies --set NEXT

# Remove nullok
# https://networklogician.com/2021/04/11/disable-null-passwords/
sudo /usr/bin/sed -i 's/\s+nullok//g' /etc/pam.d/system-auth

# sys hardening
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/tmpfiles.d/99-brace-proc.conf | sudo tee /usr/lib/tmpfiles.d/99-brace-proc.conf > /dev/null
sudo chmod 644 /usr/lib/tmpfiles.d/99-brace-proc.conf
unpriv curl -s https://configs.celenity.dev/usr/lib/tmpfiles.d/99-harden-sys.conf | sudo tee /usr/lib/tmpfiles.d/99-harden-sys.conf > /dev/null
sudo chmod 644 /usr/lib/tmpfiles.d/99-harden-sys.conf

# env
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/etc/profile.d/brace-env-overrides.sh | sudo tee /etc/profile.d/brace-env-overrides.sh > /dev/null
sudo chmod 644 /etc/profile.d/brace-env-overrides.sh
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/etc/profile.d/brace-helpers.sh | sudo tee /etc/profile.d/brace-helpers.sh > /dev/null
sudo chmod 644 /etc/profile.d/brace-helpers.sh
unpriv curl -s https://configs.celenity.dev/etc/profile.d/helpers.sh | sudo tee /etc/profile.d/helpers.sh > /dev/null
sudo chmod 644 /etc/profile.d/helpers.sh

# systemd
sudo mkdir -p /etc/systemd/system/biboumi.service.d
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/system/biboumi.service.d/98-user.conf | sudo tee /etc/systemd/system/biboumi.service.d/98-user.conf  > /dev/null
sudo chmod 644 /etc/systemd/system/biboumi.service.d/98-user.conf
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/system/biboumi.service.d/99-brace.conf | sudo tee /etc/systemd/system/biboumi.service.d/99-brace.conf  > /dev/null
sudo chmod 644 /etc/systemd/system/biboumi.service.d/99-brace.conf

sudo mkdir -p /etc/systemd/system/chronyd.service.d
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/system/chronyd.service.d/99-brace.conf | sudo tee /etc/systemd/system/chronyd.service.d/99-brace.conf  > /dev/null
sudo chmod 644 /etc/systemd/system/chronyd.service.d/99-brace.conf

sudo mkdir -p /etc/systemd/system/ejabberd.service.d
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/system/ejabberd.service.d/99-brace.conf | sudo tee /etc/systemd/system/ejabberd.service.d/99-brace.conf  > /dev/null
sudo chmod 644 /etc/systemd/system/ejabberd.service.d/99-brace.conf

sudo mkdir -p /etc/systemd/system/firewalld.service.d
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/system/firewalld.service.d/99-brace.conf.disabled | sudo tee /etc/systemd/system/firewalld.service.d/99-brace.conf.disabled  > /dev/null
sudo chmod 644 /etc/systemd/system/firewalld.service.d/99-brace.conf.disabled

sudo mkdir -p /etc/systemd/system/httpd.service.d
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/system/httpd.service.d/99-brace.conf | sudo tee /etc/systemd/system/httpd.service.d/99-brace.conf  > /dev/null
sudo chmod 644 /etc/systemd/system/httpd.service.d/99-brace.conf

sudo mkdir -p /etc/systemd/system/irqbalance.service.d
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/system/irqbalance.service.d/99-brace.conf | sudo tee /etc/systemd/system/irqbalance.service.d/99-brace.conf  > /dev/null
sudo chmod 644 /etc/systemd/system/irqbalance.service.d/99-brace.conf

sudo mkdir -p /etc/systemd/system/minetest@.service.d
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/system/minetest@.service.d/99-brace.conf | sudo tee /etc/systemd/system/minetest@.service.d/99-brace.conf  > /dev/null
sudo chmod 644 /etc/systemd/system/minetest@.service.d/99-brace.conf

sudo mkdir -p /etc/systemd/system/ModemManager.service.d
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/system/ModemManager.service.d/99-brace.conf | sudo tee /etc/systemd/system/ModemManager.service.d/99-brace.conf  > /dev/null
sudo chmod 644 /etc/systemd/system/ModemManager.service.d/99-brace.conf

sudo mkdir -p /etc/systemd/system/murmur.service.d
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/system/murmur.service.d/99-brace.conf | sudo tee /etc/systemd/system/murmur.service.d/99-brace.conf  > /dev/null
sudo chmod 644 /etc/systemd/system/murmur.service.d/99-brace.conf

sudo mkdir -p /etc/systemd/system/NetworkManager.service.d
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/system/NetworkManager.service.d/99-brace.conf | sudo tee /etc/systemd/system/NetworkManager.service.d/99-brace.conf  > /dev/null
sudo chmod 644 /etc/systemd/system/NetworkManager.service.d/99-brace.conf

sudo mkdir -p /etc/systemd/system/php-fpm.service.d
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/system/php-fpm.service.d/99-brace.conf | sudo tee /etc/systemd/system/php-fpm.service.d/99-brace.conf  > /dev/null
sudo chmod 644 /etc/systemd/system/php-fpm.service.d/99-brace.conf

sudo mkdir -p /etc/systemd/system/radiusd.service.d
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/system/radiusd.service.d/99-brace.conf | sudo tee /etc/systemd/system/radiusd.service.d/99-brace.conf  > /dev/null
sudo chmod 644 /etc/systemd/system/radiusd.service.d/99-brace.conf

sudo mkdir -p /etc/systemd/system/redis.service.d
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/system/redis.service.d/99-brace.conf.disabled | sudo tee /etc/systemd/system/redis.service.d/99-brace.conf.disabled  > /dev/null
sudo chmod 644 /etc/systemd/system/redis.service.d/99-brace.conf.disabled

sudo mkdir -p /etc/systemd/system/rngd.service.d
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/system/rngd.service.d/99-brace.conf | sudo tee /etc/systemd/system/rngd.service.d/99-brace.conf  > /dev/null
sudo chmod 644 /etc/systemd/system/rngd.service.d/99-brace.conf

sudo mkdir -p /etc/systemd/system/tor.service.d
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/system/tor.service.d/99-brace.conf | sudo tee /etc/systemd/system/tor.service.d/99-brace.conf  > /dev/null
sudo chmod 644 /etc/systemd/system/tor.service.d/99-brace.conf

sudo mkdir -p /etc/systemd/system/wpa_supplicant.service.d
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/system/wpa_supplicant.service.d/99-brace.conf | sudo tee /etc/systemd/system/wpa_supplicant.service.d/99-brace.conf  > /dev/null
sudo chmod 644 /etc/systemd/system/wpa_supplicant.service.d/99-brace.conf

sudo systemctl daemon-reload
sudo systemctl restart NetworkManager

# Chrony
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/etc/chrony.brace.conf | sudo tee /etc/chrony.brace.conf > /dev/null
sudo chmod 644 /etc/chrony.brace.conf
unpriv curl -s https://raw.githubusercontent.com/TommyTran732/Linux-Setup-Scripts/main/etc/sysconfig/chronyd | sudo tee /etc/sysconfig/chronyd > /dev/null
sudo chmod 644 /etc/sysconfig/chronyd
sudo systemctl restart chronyd

# Harden SSH
unpriv curl -s https://raw.githubusercontent.com/TommyTran732/Linux-Setup-Scripts/main/etc/ssh/ssh_config.d/10-custom.conf | sudo tee /etc/ssh/ssh_config.d/10-custom.conf > /dev/null
sudo chmod 644 /etc/ssh/ssh_config.d/10-custom.conf

# DNSSEC
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/resolved.conf.d/brace.conf | sudo tee /usr/lib/systemd/resolved.conf.d/brace.conf > /dev/null
sudo chmod 644 /usr/lib/systemd/resolved.conf.d/brace.conf

# Disable GJS and WebkitGTK JIT
unpriv curl https://raw.githubusercontent.com/TommyTran732/Linux-Setup-Scripts/main/etc/environment | sudo tee -a /etc/environment

# disable gnome tracker/search indexing (programs can still be searched)
gsettings set org.gnome.desktop.search-providers disable-external true
gsettings set org.freedesktop.Tracker3.Miner.Files enable-monitors false
gsettings set org.freedesktop.Tracker3.Miner.Files crawling-interval -2
systemctl mask --user --now tracker-miner-fs-3.service
tracker3 reset -s || true

# dark mode
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

# discard unused filesystem blocks weekly
sudo systemctl enable fstrim.timer --now

# debloat
sudo dnf -y remove fedora-bookmarks fedora-chromium-config '*anthy*' '*hangul*' ibus-typing-booster '*m17n*' '*pinyin*' '*speech*' texlive-libs words '*zhuyin*' 'sssd*' realmd cyrus-sasl-gssapi quota* dos2unix kpartx sos samba-client gvfs-smb gnome-calendar gnome-connections gnome-contacts gnome-maps gnome-remote-desktop gnome-tour gnome-weather evince yelp abrt

# kill unnecessary services
services=(
    gssproxy.service
    pcscd.service
    pcscd.socket
    abrtd.service
    abrt-journal-core.service
    abrt-oops.service
    abrt-pstoreoops.service
    abrt-vmcore.service
    abrt-xorg.service
    atd.service
    mcelog.service
    avahi-daemon.service
    avahi-daemon.socket
    ModemManager.service
    NetworkManager-wait-online.service
    iscsid.service
    iscsid.socket
    iscsi-init.service
    iscsi.service
    iscsiuio.service
    iscsiuio.socket
    livesys.service
    livesys-late.service
    multipathd.service
    multipathd.socket
    smartd.service
    vboxservice.service
    passim.service
)

for service in "${services[@]}"; do
    sudo systemctl disable "$service" --now || echo "Failed to disable $service (it may not be installed)"
done

# kill dangerous early debug-shell service
# https://fedoraproject.org/wiki/Systemd_early_debug-shell
sudo systemctl mask debug-shell.service

# kill kdump
sudo systemctl mask kdump.service

# make sensitive directories private
sudo chmod 700 /home/user/Documents
sudo chmod 700 /home/user/Downloads
sudo chmod 700 /home/user/Music
sudo chmod 700 /home/user/Pictures
sudo chmod 700 /home/user/Videos

# umask
umask 077
sudo sed -i 's/^UMASK.*/UMASK 077/g' /etc/login.defs
sudo sed -i 's/^HOME_MODE/#HOME_MODE/g' /etc/login.defs
sudo sed -i 's/umask 022/umask 077/g' /etc/bashrc

# remove undesired built-in fedora repos
sudo dnf -y remove fedora-third-party fedora-workstation-repositories

# rpmfusion
sudo dnf -y install "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
sudo dnf -y install "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
sudo dnf -y install rpmfusion-free-release-tainted
sudo dnf -y install rpmfusion-nonfree-release-tainted
sudo dnf -y update --refresh

# divested-rpm
sudo dnf -y config-manager --add-repo https://codeberg.org/divested/divested-release/raw/branch/master/divested-release.repo
sudo dnf -y update --refresh

# flathub
sudo dnf -y remove fedora-flathub-remote
sudo flatpak remote-delete --system flathub -y
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak update && flatpak update

# harden flatpaks

sudo flatpak override --system --socket=wayland --nosocket=x11 --nosocket=fallback-x11 --nosocket=pulseaudio --nosocket=session-bus --nosocket=system-bus --unshare=network --unshare=ipc --nofilesystem=host:reset --nofilesystem=host-os --nofilesystem=host-etc --nofilesystem=home --nodevice=input --nodevice=shm --nodevice=all --no-talk-name=org.freedesktop.Flatpak --no-talk-name=org.freedesktop.systemd1 --no-talk-name=ca.desrt.dconf --no-talk-name=org.gnome.Shell.Extensions
flatpak override --user --socket=wayland --nosocket=x11 --nosocket=fallback-x11 --nosocket=pulseaudio --nosocket=session-bus --nosocket=system-bus --unshare=network --unshare=ipc --nofilesystem=host:reset --nofilesystem=host-os --nofilesystem=host-etc --nofilesystem=home --nodevice=input --nodevice=shm --nodevice=all --no-talk-name=org.freedesktop.Flatpak --no-talk-name=org.freedesktop.systemd1 --no-talk-name=ca.desrt.dconf --no-talk-name=org.gnome.Shell.Extensions

# brave
sudo dnf -y config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf -y update --refresh
sudo dnf -y install brave-browser

# configure firefox
wget https://phoenix.celenity.dev/configs/Firefox-UI-Fix/mozilla.cfg
sudo mv mozilla.cfg /usr/lib64/firefox/mozilla.cfg
wget https://phoenix.celenity.dev/defaults/pref/local-settings.js
sudo mkdir -p /usr/lib64/firefox/defaults/pref
sudo chmod 755 /usr/lib64/firefox/defaults/pref
sudo mv local-settings.js /usr/lib64/firefox/defaults/pref/local-settings.js
sudo dnf copr enable celenity/phoenix-policies -y
sudo dnf -y install phoenix-policies-personal

# thunderbird
sudo dnf -y install thunderbird
wget https://dove.celenity.dev/mozilla.cfg
sudo mv mozilla.cfg /usr/lib64/thunderbird/mozilla.cfg
wget https://dove.celenity.dev/defaults/pref/local-settings.js
sudo mkdir -p /usr/lib64/thunderbird/defaults/pref
sudo chmod 755 /usr/lib64/thunderbird/defaults/pref
sudo mv local-settings.js /usr/lib64/thunderbird/defaults/pref/local-settings.js
sudo dnf copr enable celenity/dove-policies -y
sudo dnf -y update --refresh
sudo dnf -y install dove-policies

# codecs & media
# https://docs.fedoraproject.org/en-US/quick-docs/installing-plugins-for-playing-movies-and-music/
# https://itsfoss.com/things-to-do-after-installing-fedora/#5-install-multimedia-plugins
# https://docs.fedoraproject.org/en-US/quick-docs/openh264/
# https://rpmfusion.org/Howto/Multimedia
sudo dnf -y group install Multimedia
sudo dnf -y update --refresh
sudo dnf -y swap ffmpeg-free ffmpeg --allowerasing
sudo dnf -y swap fdk-aac-free fdk-aac --allowerasing
sudo dnf -y swap libavcodec libavodec-freeworld --allowerasing
sudo dnf -y install libheif libheif-freeworld --allowerasing
sudo dnf -y install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf -y update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf -y install @sound-and-video
sudo dnf -y update --refresh
sudo dnf -y update @sound-and-video
sudo dnf -y install lame\* --exclude=lame-devel
sudo dnf -y group upgrade --with-optional Multimedia
sudo dnf update --refresh
sudo dnf -y config-manager --set-enabled fedora-cisco-openh264
sudo dnf update --refresh
sudo dnf -y install gstreamer1-plugin-openh264 mozilla-openh264
flatpak --user install org.freedesktop.Platform.openh264 -y
sudo dnf -y install clinfo mesa-libOpenCL pocl
sudo dnf -y install mesa-dri-drivers mesa-va-drivers libva libva-utils
sudo dnf -y install vdpauinfo libvdpau libvdpau-va-gl libdvdcss

# update appstream metadata
sudo dnf -y update @core

# hardened_malloc
sudo dnf -y install hardened_malloc
sudo flatpak override --system --filesystem=host-os:ro --env=LD_PRELOAD=/var/run/host/usr/lib64/libhardened_malloc.so
flatpak override --user --filesystem=host-os:ro --env=LD_PRELOAD=/var/run/host/usr/lib64/libhardened_malloc.so

# firejail
sudo dnf -y install firejail
# sudo firecfg

# real-ucode
sudo dnf -y install real-ucode

# java
sudo dnf -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel java-11-openjdk java-11-openjdk-devel java-17-openjdk java-17-openjdk-devel ava-21-openjdk java-21-openjdk-devel

# dev
sudo dnf -y groupinstall "Development Tools"
sudo dnf -y install cargo cmake coreutils copr-rpmbuild fedpkg gcc git git-core glibc glibc-devel glibc-headers kernel-devel kernel-headers make maven mock pacman perl proguard python3 python3-devel rpkg rpm-build rpmdevtools rpmlint ruby rust

# virtualization
sudo dnf -y install bridge-utils libvirt virt-install qemu-kvm virt-manager

# android
sudo dnf -y install android-tools enjarify
sudo dnf copr enable nielsenb/android-udev-rules -y
sudo dnf -y update --refresh
sudo dnf -y install android-udev-rules
flatpak --user install com.google.AndroidStudio -y
flatpak --user override com.google.AndroidStudio --device=dri --device=kvm --share=network

# vscodium
sudo tee -a /etc/yum.repos.d/vscodium.repo << 'EOF'
[gitlab.com_paulcarroty_vscodium_repo]
name=gitlab.com_paulcarroty_vscodium_repo
baseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
metadata_expire=1h
EOF
sudo dnf -y install codium

# gnome extras
sudo dnf -y install gnome-tweaks
flatpak --user install com.mattjakeman.ExtensionManager -y
flatpak --user override com.mattjakeman.ExtensionManager --share=network --talk-name=org.gnome.Shell.Extensions
sudo dnf -y install gnome-firmware

# fonts
sudo dnf -y install adobe-source-code-pro-fonts mozilla-fira-mono-fonts mozilla-fira-sans-fonts
gsettings set org.gnome.desktop.interface font-name 'Fira Sans 10'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Fira Sans Bold 11';
gsettings set org.gnome.desktop.interface monospace-font-name 'Fira Mono 10';

# look
sudo dnf -y install numix-icon-theme-circle
gsettings set org.gnome.desktop.interface icon-theme 'Numix-Circle'

# steam
flatpak --user install com.valvesoftware.Steam com.valvesoftware.Steam.Utility.steamtinkerlaunch com.valvesoftware.Steam.CompatibilityTool.Proton-GE com.valvesoftware.Steam.Utility.InhibitScreensaver -y
flatpak --user override com.valvesoftware.Steam --share=network --socket=pulseaudio
flatpak --user install net.davidotek.pupgui2 -y
flatpak --user override net.davidotek.pupgui2 --share=network

# prism launcher (minecraft)
flatpak --user install org.prismlauncher.PrismLauncher -y
flatpak --user override org.prismlauncher.PrismLauncher --share=network --socket=pulseaudio

# bleachbit
sudo dnf -y install bleachbit

# obs
flatpak --user install com.obsproject.Studio com.obsproject.Studio.Plugin.InputOverlay com.obsproject.Studio.Plugin.Gstreamer com.obsproject.Studio.Plugin.GStreamerVaapi com.obsproject.Studio.Plugin.CompositeBlur com.obsproject.Studio.Plugin.BackgroundRemoval -y
flatpak --user override com.obsproject.Studio --device=dri --socket=pulseaudio

#  vlc
flatpak --user install org.videolan.VLC org.videolan.VLC.Plugin.pause_click org.videolan.VLC.Plugin.makemkv org.videolan.VLC.Plugin.fdkaac org.videolan.VLC.Plugin.bdj -y
flatpak --user override org.videolan.VLC --device=dri --share=network --socket=pulseaudio --nosocket=wayland --socket=fallback-x11

# kodi
flatpak --user install tv.kodi.Kodi -y
flatpak --user override tv.kodi.Kodi --device=dri --share=network --socket=pulseaudio

# makemkv
flatpak --user install com.makemkv.MakeMKV -y
flatpak --user override com.makemkv.MakeMKV --share=network

# qbittorrent
flatpak --user install org.qbittorrent.qBittorrent -y
flatpak --user override org.qbittorrent.qBittorrent --share=network

# AV
sudo dnf -y install clamav clamav-freshclam clamtk

# PGP
sudo dnf -y install gnupg2 pinentry

# flatseal
flatpak --user install com.github.tchx84.Flatseal -y
flatpak --user override com.github.tchx84.Flatseal --filesystem=/var/lib/flatpak/app:ro --filesystem=xdg-data/flatpak/app:ro --filesystem=xdg-data/flatpak/overrides:create

# tor
sudo dnf -y install tor torbrowser-launcher

# signal
flatpak --user install org.signal.Signal -y
flatpak --user override org.signal.Signal --share=network --socket=pulseaudio
# enable wayland
flatpak --user override org.signal.Signal --env=ELECTRON_OZONE_PLATFORM_HINT=auto

# cake wallet (disables hardened_malloc to unbreak, also enables network access)
flatpak --user override com.cakewallet.CakeWallet --share=network --nofilesystem=host-os --unset-env=LD_PRELOAD

# obsidian
flatpak --user install md.obsidian.Obsidian -y
flatpak --user override md.obsidian.Obsidian --share=network

# dolphin
flatpak --user install org.kde.dolphin -y
flatpak --user override org.kde.dolphin --filesystem=host --filesystem=host-os --filesystem=host-etc --filesystem=home 

# nautilus
sudo dnf -y install gnome-terminal-nautilus seahorse-nautilus sushi

# stacer
sudo dnf -y install stacer

# gnome web
flatpak --user install org.gnome.Epiphany -y
flatpak --user override org.gnome.Epiphany --share=network

# inspector
flatpak --user install io.github.nokse22.inspector -y
flatpak --user override io.github.nokse22 --talk-name=org.freedesktop.Flatpak

# replace useful built-in apps with flatpaks

# gnome calculator
sudo dnf -y remove gnome-calculator
flatpak --user install org.gnome.Calculator -y

# gnome camera
sudo dnf -y remove snapshot
flatpak --user install org.gnome.Snapshot -y

# gnome clocks
sudo dnf -y remove gnome-clocks
flatpak --user install org.gnome.clocks -y

# disk usage analyzer
sudo dnf -y remove baobab
flatpak --user install org.gnome.baobab -y

# document scanner
sudo dnf -y remove simple-scan
flatpak --user install org.gnome.SimpleScan -y

# fedora media writer
sudo dnf -y remove mediawriter
flatpak --user install org.fedoraproject.MediaWriter -y
flatpak --user override org.fedoraproject.MediaWriter --share=network

# file roller
sudo dnf -y remove file-roller
flatpak --user install org.gnome.FileRoller -y

# gnome fonts
sudo dnf -y remove gnome-font-viewer
flatpak --user install org.gnome.font-viewer -y

# logs
sudo dnf -y remove gnome-logs
flatpak --user install org.gnome.Logs -y

# gnome text editor
sudo dnf -y remove gnome-text-editor
flatpak --user install org.gnome.TextEditor -y

# libreoffice
sudo dnf -y remove libreoffice-core
flatpak --user install org.libreoffice.LibreOffice -y

# gnome firmware
sudo dnf -y remove gnome-firmware
flatpak --user install org.gnome.Firmware -y

# image viewer
sudo dnf -y remove loupe
flatpak --user install org.gnome.Loupe -y