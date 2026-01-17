
# Always enable VA-API
## Taken from Brace (AGPL-3.0-or-later): https://codeberg.org/divested/brace
export GST_VAAPI_ALL_DRIVERS=1;

# Configure defaults
export BROWSER='/opt/firefox/firefox -P default-release';
export EDITOR='/usr/bin/nano';
export VISUAL='/usr/bin/nano';

# Configure Homebrew (if installed)
export HOMEBREW_ASK=1;
export HOMEBREW_AUTO_UPDATE_SECS=3600;
export HOMEBREW_BROWSER='/opt/firefox/firefox -P default-release';
export HOMEBREW_CASK_OPTS='--require-sha';
#export HOMEBREW_CURLRC="~/.curlrc";
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
export ASTRO_TELEMETRY_DISABLED=1;
export AZURE_CORE_COLLECT_TELEMETRY=0;
export DISABLE_TELEMETRY=1;
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
export SB_GAPI_KEY_FILE='/home/user/IronFox/sb-gapi.data';

# Required for GPG
# export GPG_TTY=$(tty);

# Aliases
alias envedit='/usr/bin/run0edit /etc/profile.d/celenity-env.sh'
# alias envedit='/usr/bin/run0edit /home/user/.bashrc';
# alias envedit='/usr/bin/nano /home/user/.bashrc';
alias envup='source /etc/profile.d/celenity-env.sh';
# alias envup='source /home/user/.bashrc';
alias firefox='/usr/bin/ujust with-standard-malloc /opt/firefox/firefox';
alias git-up='/usr/bin/git commit -am 'Update' && git push';
alias gits='/usr/bin/git commit --signoff';
alias thunderbird='MOZ_REMOTE_SETTINGS_DEVTOOLS=1 /usr/bin/ujust with-standard-malloc /opt/thunderbird/thunderbird';
alias update='/usr/bin/rpm-ostree refresh-md --force && /usr/bin/ujust update-system && /home/linuxbrew/.linuxbrew/bin/brew update --force --verbose && /home/linuxbrew/.linuxbrew/bin/brew upgrade --greedy --verbose && /usr/bin/run0 /usr/bin/bash /opt/celenity/scripts/update_firefox.sh && /usr/bin/run0 /usr/bin/bash /opt/celenity/scripts/update_thunderbird.sh && /usr/bin/flatpak --system update && /usr/bin/flatpak --user update && /usr/bin/ujust update-firmware';
#alias update='/usr/bin/sudo /usr/bin/dnf update --refresh && /usr/bin/sudo /usr/bin/bash /opt/celenity/scripts/update_firefox.sh && /usr/bin/sudo /usr/bin/bash /opt/celenity/scripts/update_thunderbird.sh && /usr/bin/flatpak --system update && /usr/bin/flatpak --user update && /usr/bin/fwupdmgr refresh --force && /usr/bin/fwupdmgr upgrade';
