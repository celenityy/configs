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
unpriv curl -s https://codeberg.org/Magnesium1062/setup-scripts/raw/branch/main/etc/dnf/dnf.conf | sudo tee /etc/dnf/dnf.conf > /dev/null
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
unpriv curl -s https://codeberg.org/Magnesium1062/setup-scripts/raw/branch/main/etc/modprobe.d/blacklist.conf | sudo tee /etc/modprobe.d/blacklist.conf > /dev/null
sudo chmod 644 /etc/modprobe.d/blacklist.conf

# sysctl
unpriv curl -s https://codeberg.org/Magnesium1062/setup-scripts/raw/branch/main/etc/sysctl.d/99-restrict.conf | sudo tee /etc/sysctl.d/99-restrict.conf > /dev/null
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
unpriv curl -s https://codeberg.org/Magnesium1062/setup-scripts/raw/branch/main/etc/sysctl.d/00-harden.conf | sudo tee /etc/NetworkManager/conf.d/00-harden.conf > /dev/null
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
unpriv curl -s https://codeberg.org/Magnesium1062/setup-scripts/raw/branch/main/usr/lib/tmpfiles.d/99-harden-sys.conf | sudo tee /usr/lib/tmpfiles.d/99-harden-sys.conf > /dev/null
sudo chmod 644 /usr/lib/tmpfiles.d/99-harden-sys.conf

# env
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/etc/profile.d/brace-env-overrides.sh | sudo tee /etc/profile.d/brace-env-overrides.sh > /dev/null
sudo chmod 644 /etc/profile.d/brace-env-overrides.sh
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/etc/profile.d/brace-helpers.sh | sudo tee /etc/profile.d/brace-helpers.sh > /dev/null
sudo chmod 644 /etc/profile.d/brace-helpers.sh
unpriv curl -s https://codeberg.org/Magnesium1062/setup-scripts/raw/branch/main/etc/profile.d/helpers.sh | sudo tee /etc/profile.d/helpers.sh > /dev/null
sudo chmod 644 /etc/profile.d/helpers.sh
source ~/.bashrc

# systemd
sudo mkdir -p /etc/systemd/system/biboumi.service.d
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/system/biboumi.service.d/98-user.conf | sudo tee /etc/systemd/system/biboumi.service.d/98-user.conf  > /dev/null
sudo chmod 644 /etc/systemd/system/biboumi.service.d/98-user.conf
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/system/biboumi.service.d/99-brace.conf | sudo tee /etc/systemd/system/biboumi.service.d/98-brace.conf  > /dev/null
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
unpriv curl -s https://codeberg.org/divested/brace/raw/branch/master/brace/usr/lib/systemd/resolved.conf.d/brace.conf | sudo tee /etc/systemd/resolved.conf.d/brace.conf > /dev/null
sudo chmod 644 /etc/systemd/resolved.conf.d/brace.conf

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
sudo dnf -y remove fedora-bookmarks fedora-chromium-config '*anthy*' '*hangul*' ibus-typing-booster '*m17n*' '*pinyin*' '*speech*' texlive-libs words '*zhuyin*' 'sssd*' realmd cyrus-sasl-gssapi quota* dos2unix kpartx sos samba-client gvfs-smb gnome-calendar gnome-connections gnome-contacts gnome-maps gnome-remote-desktop gnome-tour gnome-weather yelp abrt malcontent

# kill unnecessary services
sudo systemctl disable gssproxy.service pcscd.service pcscd.socket abrtd.service abrt-journal-core.service abrt-oops.service abrt-pstoreoops.service abrt-vmcore.service abrt-xorg.service atd.service mcelog.service avahi-daemon.service avahi-daemon.socket ModemManager.service iscsid.service iscsid.socket iscsi-init.service iscsi.service iscsiuio.service iscsiuio.socket livesys.service livesys-late.service multipathd.service multipathd.socket smartd.service vboxservice.service passim.service

# kill dangerous early debug-shell service
https://fedoraproject.org/wiki/Systemd_early_debug-shell
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
rm -f /etc/yum.repos.d/rpmfusion-nonfree-nvidia-driver.repo
rm -f /etc/yum.repos.d/rpmfusion-nonfree-steam.repo
rm -f /etc/yum.repos.d/google-chrome.repo

# rpmfusion
sudo dnf -y install "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
sudo dnf -y install "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
sudo dnf -y update --refresh

# divested-rpm
sudo dnf -y config-manager --add-repo https://codeberg.org/divested/divested-release/raw/branch/master/divested-release.repo
sudo dnf -y update --refresh

# flathub
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak update

# brave
sudo dnf -y config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf -y update --refresh
sudo dnf -y install brave-browser

# configure firefox
wget https://codeberg.org/Magnesium1062/Phoenix/raw/branch/main/configs/Firefox-UI-Fix/mozilla.cfg
sudo mv mozilla.cfg /usr/lib64/firefox/mozilla.cfg
wget https://codeberg.org/Magnesium1062/Phoenix/raw/branch/main/defaults/pref/local-settings.js
sudo mkdir -p /usr/lib64/firefox/defaults/pref
sudo chmod 755 /usr/lib64/firefox/defaults/pref
sudo mv local-settings.js /usr/lib64/firefox/defaults/pref/local-settings.js
sudo dnf copr enable retold3202/Phoenix-Policies -y
sudo dnf -y install phoenix-policies-personal

# thunderbird
sudo dnf -y install thunderbird
wget https://codeberg.org/Magnesium1062/Dove/raw/branch/master/mozilla.cfg
sudo mv mozilla.cfg /usr/lib64/thunderbird/mozilla.cfg
wget https://codeberg.org/Magnesium1062/Dove/raw/branch/master/defaults/pref/local-settings.js
sudo mkdir -p /usr/lib64/thunderbird/defaults/pref
sudo chmod 755 /usr/lib64/thunderbird/defaults/pref
sudo mv local-settings.js /usr/lib64/thunderbird/defaults/pref/local-settings.js
sudo dnf copr enable retold3202/Dove-Policies -y
sudo dnf -y update --refresh
sudo dnf -y install dove-policies

# codecs
# https://docs.fedoraproject.org/en-US/quick-docs/installing-plugins-for-playing-movies-and-music/
# https://itsfoss.com/things-to-do-after-installing-fedora/#5-install-multimedia-plugins
# https://docs.fedoraproject.org/en-US/quick-docs/openh264/
sudo dnf -y group install Multimedia
sudo dnf update --refresh
sudo dnf -y install ffmpeg
sudo dnf -y install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf -y install lame\* --exclude=lame-devel
sudo dnf -y group upgrade --with-optional Multimedia
sudo dnf update --refresh
sudo dnf -y config-manager --set-enabled fedora-cisco-openh264
sudo dnf update --refresh
sudo dnf -y install gstreamer1-plugin-openh264 mozilla-openh264
flatpak --user org.freedesktop.Platform.openh264 -y
sudo dnf -y install clinfo mesa-libOpenCL pocl
sudo dnf -y install mesa-dri-drivers mesa-va-drivers libva libva-utils
flatpak --user org.freedesktop.Platform.GL.default -y
sudo dnf -y install vdpauinfo libvdpau libvdpau-va-gl libva-vdpau-driver

# update appstream metadata
sudo dnf -y update @core

# hardened_malloc
sudo dnf -y install hardened_malloc
sudo flatpak override --system --filesystem=host-os:ro --env=LD_PRELOAD=/var/run/host/usr/lib64/libhardened_malloc.so
flatpak override --user --filesystem=host-os:ro --env=LD_PRELOAD=/var/run/host/usr/lib64/libhardened_malloc.so

# firejail
sudo dnf -y install firejail
sudo firecfg

# real-ucode
sudo dnf -y install real-ucode

# android
sudo dnf -y install android-tools enjarify
sudo dnf copr enable nielsenb/android-udev-rules -y
sudo dnf update --refresh
sudo dnf -y install android-udev-rules

# dev
sudo dnf -y install rpmbuild fedpkg
sudo dnf -y install proguard
sudo dnf -y install ruby

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
flatpak --user com.mattjakeman.ExtensionManager -y
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
sudo dnf -y install steam steam-devices

# prism launcher (minecraft)
flatpak --user org.prismlauncher.PrismLauncher -y

# bleachbit
sudo dnf -y install bleachbit

# obs
sudo dnf -y install obs-studio

# AV
sudo dnf -y install clamav clamav-freshclam clamtk

# flatseal
flatpak --user com.github.tchx84.Flatseal -y

# tor
sudo dnf -y install tor torbrowser-launcher

# java
sudo dnf -y install java-1.8.0-openjdk
sudo dnf -y install java-1.8.0-openjdk-devel
sudo dnf -y install java-17-openjdk

# signal
flatpak --user install org.signal.Signal -y

# obsidian
flatpak --user install md.obsidian.Obsidian -y