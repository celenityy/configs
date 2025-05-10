#!/bin/sh

# Always enable VA-API
## Taken from Brace (AGPL-3.0-or-later): https://codeberg.org/divested/brace
export GST_VAAPI_ALL_DRIVERS=1;

# Configure defaults
export BROWSER="firefox -P default-release";
export EDITOR="codium -w";
export VISUAL="codium -w";

# Configure Homebrew (if installed)
export HOMEBREW_ASK=1;
export HOMEBREW_AUTO_UPDATE_SECS=3600;
export HOMEBREW_BROWSER="firefox -P default-release";
export HOMEBREW_CASK_OPTS="--require-sha";
export HOMEBREW_CURLRC="~/.curlrc";
export HOMEBREW_DISPLAY_INSTALL_TIMES=1;
export HOMEBREW_NO_ANALYTICS=1;
export HOMEBREW_NO_ENV_HINTS=1;
export HOMEBREW_NO_GITHUB_API=1;
export HOMEBREW_NO_INSECURE_REDIRECT=1;
export HOMEBREW_VERBOSE=1;

# Disable JIT (GNOME's JavaScript Engine)
## https://gitlab.gnome.org/GNOME/gjs/-/blob/master/doc/Environment.md#javascript-engine
export GJS_DISABLE_JIT=1;

# Disable JIT (WebKit)
## https://trac.webkit.org/wiki/EnvironmentVariables
export JavaScriptCoreUseJIT=0;
export JSC_useFTLJI=0;

# Disable media disk cache (WebKit)
## https://trac.webkit.org/wiki/EnvironmentVariables
export WPE_SHELL_DISABLE_MEDIA_DISK_CACHE=1;

# Disable the Profiler (GNOME's JavaScript Engine)
## https://gitlab.gnome.org/GNOME/gjs/-/blob/master/doc/Environment.md#testing
export GJS_ENABLE_PROFILER=0;

# Disable telemetry (for various software)
## DO_NOT_TRACK: https://consoledonottrack.com/
export AZURE_CORE_COLLECT_TELEMETRY=0;
export DO_NOT_TRACK=1;
export DOTNET_CLI_TELEMETRY_OPTOUT=1;
export GATSBY_TELEMETRY_DISABLED=1;
export POWERSHELL_TELEMETRY_OPTOUT=1;
export SAM_CLI_TELEMETRY=0;

# Disable thread local malloc cache
## Taken from Brace (AGPL-3.0-or-later): https://codeberg.org/divested/brace
export GLIBC_TUNABLES='glibc.malloc.tcache_count=0';

# Disable video RAM to prevent leakage
## See (CC BY-SA 4.0): https://www.adlerweb.info/blog/2012/06/20/nvidia-x-org-video-ram-information-leak
## Taken from Brace (AGPL-3.0-or-later): https://codeberg.org/divested/brace
export AMD_DEBUG=zerovram;
export R600_DEBUG=zerovram;
export RADV_DEBUG=zerovram;

# Enable Electron logging
#export ELECTRON_ENABLE_LOGGING=1;

# Enable Wayland for Electron apps
export ELECTRON_OZONE_PLATFORM_HINT='auto';

# Enforce WebKit's web process sandbox
## https://trac.webkit.org/wiki/EnvironmentVariables
export WEBKIT_FORCE_SANDBOX=1;

# For building IronFox...
export SB_GAPI_KEY_FILE=/home/user/IronFox/sb-gapi.data;

# Required for GPG
export GPG_TTY=$(tty);

# Aliases
alias envedit='nano ~/.bashrc';
alias envup='source ~/.bashrc';
alias git-up='git commit -am 'Update' && git push';
alias gits='git commit --signoff';
alias update='sudo dnf update --refresh && flatpak --system update && flatpak --user update && sudo fwupdmgr refresh --force && sudo fwupdmgr upgrade';

# More aliases + helpers
## Taken from Brace (AGPL-3.0-or-later): https://codeberg.org/divested/brace

# Cleaning
alias bleachLast='bleachbit --preset --clean';
alias clearTracker='/usr/bin/tracker reset --hard';
alias clearDriveFreeSpace='scrub --no-hwrand -p random -X cfs-$RANDOM';
alias clearDriveDiscard='sudo fstrim -av';
alias clearall='clearUserMisc && clearLogins && clearVarLog && clearVarLogMisc && clearJournal && clearMemory && clearDriveDiscard';

clearUserMisc() {
	#rm -fv ~/.*_history;
	#rm -rfv ~/.esmtp_queue;
	rm -fv ~/.lesshst;

	rm -fv ~/.android/adbkey*;
	rm -rfv ~/.cache/libvirt/qemu/log;
	rm -rfv ~/.cache/thumbnails;
	rm -fv ~/.clamtk/history/*.log;
	rm -fv ~/.config/inkscape/extension-errors.log;
	rm -rfv ~/.config/obs-studio/logs;
	rm -rfv ~/.config/obs-studio/profiler_data;
	rm -fv ~/.config/supertuxkart/stdout.log*;
	#rm -fv ~/.config/wireshark/recent*;
	#rm -rfv ~/.jack-server/logs;
	rm -rfv ~/.local/share/gvfs-metadata;
	rm -fv ~/.local/share/ibus-typing-booster/*debug.log;
	rm -fv ~/.local/share/recently-used.xbel;
	rm -fv ~/.minetest/debug.txt;

	#rm -fv ~/.wget-hsts
	#rm -fv ~/.gnutls/known_hosts;
	#rm -fv ~/.ssh/known_hosts;
}

clearUsersMisc() {
	#Contains list of all accessed/modified files on all connected drives (local or remote)
	sudo wipe -irqc /home/*/.local/share/gvfs-metadata;
}

clearLogins() {
	echo "" | sudo tee /var/log/btmp;
	echo "" | sudo tee /var/log/wtmp;
}

clearVarLog() {
	sudo find /var/log -type f -regex ".*\.gz$" -print -delete;
	sudo find /var/log -type f -regex ".*\.log.[0-9]+$" -print -delete;
	sudo find /var/log -type f -regex ".*\.log-[0-9]+$" -print -delete;
}

clearVarLogMisc() {
	# libvirt
	sudo rm -fv /var/log/libvirt/qemu/*.log*;
	# misc
	sudo rm -fv /var/log/grubby;
	# package manangers
	sudo rm -fv /var/log/dnf*.log;
	sudo rm -fv /var/log/hawkey.log;
	sudo rm -fv /var/log/yum*.log;
	sudo rm -fv /var/log/pacman.log;
	# scanners
	sudo rm -fv /var/log/lynis*;
	sudo rm -fv /var/log/rkhunter.log*;
	sudo rm -fv /var/log/freshclam.log;
	sudo rm -fv /var/log/clamav/*.log;
	# security
	sudo rm -fv /var/log/audit/audit.log;
	sudo rm -fv /var/log/usbguard/usbguard-audit.log;
	# systemd
	sudo rm -fv /var/log/boot.log;
}

clearJournal() {
	sudo journalctl --rotate;
	sudo journalctl --vacuum-files=1 --vacuum-size=1K --vacuum-time=1s;
	sudo journalctl --flush;
}

clearMemory() {
	free -m;
	sudo sync; #sudo isn't necessary for this, but ensures the next command is likely to run without delay
	echo 3 | sudo tee /proc/sys/vm/drop_caches;
	free -m;
}

optimizeImages() {
        find "$1" -type f -name "*.jp*g" -print0 | xargs -0 -n1 -P 16 jpegoptim --strip-all;
        find "$1" -type f -name "*.png" -print0 | xargs -0 -n1 -P 16 optipng -strip all;
}

loosePermsRecursive() {
	echo "Recursively setting loose permissions in $PWD";
	echo "You've 5 seconds to Ctrl+C";
	sleep 5;
	find . -type d -print0 | xargs -0 chmod -v 0755;
	find . -type f -print0 | xargs -0 chmod -v 0644;
}

strictPermsRecursive() {
	echo "Recursively setting restrictive permissions in $PWD";
	echo "You've 5 seconds to Ctrl+C";
	sleep 5;
	find . -type d -print0 | xargs -0 chmod -v 0700;
	find . -type f -print0 | xargs -0 chmod -v 0600;
}


# Malware scanning
alias clamscanhere='clamscan --recursive --detect-pua=yes --infected --allmatch --cross-fs=no --follow-dir-symlinks=0 --follow-file-symlinks=0 .';
alias rootkitscan='sudo rkhunter --update && sudo rkhunter -c --enable all --disable none --rwo';
alias rootkitscanalt='sudo unhide reverse procall sys';

# Misc.
alias ssh-tor='torsocks --isolate ssh';
