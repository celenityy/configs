#!/bin/zsh

echo_red_text() {
	echo -e "\033[31m$1\033[0m"
}


echo_green_text() {
	echo -e "\033[32m$1\033[0m"
}

error_fn() {
	echo
	echo -e "\033[31mSomething went wrong! The script failed.\033[0m"
	echo -e "\033[31mPlease report this (with the output message) to https://codeberg.org/celenity/configs/issues\033[0m"
	echo
	exit 1
}

## Downloaded files save in /tmp
cd /tmp

echo_green_text "Welcome!"
echo_red_text "This script will set up environment variables I use on macOS."

echo_green_text "Downloading dev.celenity.env.AZURE_CORE_COLLECT_TELEMETRY.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.AZURE_CORE_COLLECT_TELEMETRY.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.AZURE_CORE_COLLECT_TELEMETRY.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.AZURE_CORE_COLLECT_TELEMETRY.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.AZURE_CORE_COLLECT_TELEMETRY.plist to /Library/LaunchAgents/dev.celenity.env.AZURE_CORE_COLLECT_TELEMETRY.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.AZURE_CORE_COLLECT_TELEMETRY.plist /Library/LaunchAgents/dev.celenity.env.AZURE_CORE_COLLECT_TELEMETRY.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.AZURE_CORE_COLLECT_TELEMETRY.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.AZURE_CORE_COLLECT_TELEMETRY.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.CPPFLAGS.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.CPPFLAGS.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.CPPFLAGS.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.CPPFLAGS.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.CPPFLAGS.plist to /Library/LaunchAgents/dev.celenity.env.CPPFLAGS.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.CPPFLAGS.plist /Library/LaunchAgents/dev.celenity.env.CPPFLAGS.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.CPPFLAGS.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.CPPFLAGS.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.DO_NOT_TRACK.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.DO_NOT_TRACK.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.DO_NOT_TRACK.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.DO_NOT_TRACK.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.DO_NOT_TRACK.plist to /Library/LaunchAgents/dev.celenity.env.DO_NOT_TRACK.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.DO_NOT_TRACK.plist /Library/LaunchAgents/dev.celenity.env.DO_NOT_TRACK.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.DO_NOT_TRACK.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.DO_NOT_TRACK.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.DOTNET_CLI_TELEMETRY_OPTOUT.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.DOTNET_CLI_TELEMETRY_OPTOUT.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.DOTNET_CLI_TELEMETRY_OPTOUT.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.DOTNET_CLI_TELEMETRY_OPTOUT.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.DOTNET_CLI_TELEMETRY_OPTOUT.plist to /Library/LaunchAgents/dev.celenity.env.DOTNET_CLI_TELEMETRY_OPTOUT.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.DOTNET_CLI_TELEMETRY_OPTOUT.plist /Library/LaunchAgents/dev.celenity.env.DOTNET_CLI_TELEMETRY_OPTOUT.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.DOTNET_CLI_TELEMETRY_OPTOUT.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.DOTNET_CLI_TELEMETRY_OPTOUT.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.EDITOR.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.EDITOR.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.EDITOR.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.EDITOR.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.EDITOR.plist to /Library/LaunchAgents/dev.celenity.env.EDITOR.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.EDITOR.plist /Library/LaunchAgents/dev.celenity.env.EDITOR.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.EDITOR.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.EDITOR.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.GATSBY_TELEMETRY_DISABLED.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.GATSBY_TELEMETRY_DISABLED.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.GATSBY_TELEMETRY_DISABLED.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.GATSBY_TELEMETRY_DISABLED.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.GATSBY_TELEMETRY_DISABLED.plist to /Library/LaunchAgents/dev.celenity.env.GATSBY_TELEMETRY_DISABLED.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.GATSBY_TELEMETRY_DISABLED.plist /Library/LaunchAgents/dev.celenity.env.GATSBY_TELEMETRY_DISABLED.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.GATSBY_TELEMETRY_DISABLED.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.GATSBY_TELEMETRY_DISABLED.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.GPG_TTY.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.GPG_TTY.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.GPG_TTY.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.GPG_TTY.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.GPG_TTY.plist to /Library/LaunchAgents/dev.celenity.env.GPG_TTY.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.GPG_TTY.plist /Library/LaunchAgents/dev.celenity.env.GPG_TTY.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.GPG_TTY.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.GPG_TTY.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.HOMEBREW_ASK.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.HOMEBREW_ASK.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.HOMEBREW_ASK.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.HOMEBREW_ASK.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.HOMEBREW_ASK.plist to /Library/LaunchAgents/dev.celenity.env.HOMEBREW_ASK.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.HOMEBREW_ASK.plist /Library/LaunchAgents/dev.celenity.env.HOMEBREW_ASK.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.HOMEBREW_ASK.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.HOMEBREW_ASK.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.HOMEBREW_AUTO_UPDATE_SECS.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.HOMEBREW_AUTO_UPDATE_SECS.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.HOMEBREW_AUTO_UPDATE_SECS.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.HOMEBREW_AUTO_UPDATE_SECS.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.HOMEBREW_AUTO_UPDATE_SECS.plist to /Library/LaunchAgents/dev.celenity.env.EDITOR.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.HOMEBREW_AUTO_UPDATE_SECS.plist /Library/LaunchAgents/dev.celenity.env.HOMEBREW_AUTO_UPDATE_SECS.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.HOMEBREW_AUTO_UPDATE_SECS.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.HOMEBREW_AUTO_UPDATE_SECS.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.HOMEBREW_BROWSER.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.HOMEBREW_BROWSER.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.HOMEBREW_BROWSER.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.HOMEBREW_BROWSER.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.HOMEBREW_BROWSER.plist to /Library/LaunchAgents/dev.celenity.env.EDITOR.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.HOMEBREW_BROWSER.plist /Library/LaunchAgents/dev.celenity.env.HOMEBREW_BROWSER.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.HOMEBREW_BROWSER.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.HOMEBREW_BROWSER.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.HOMEBREW_CASK_OPTS.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.HOMEBREW_CASK_OPTS.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.HOMEBREW_CASK_OPTS.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.HOMEBREW_CASK_OPTS.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.HOMEBREW_CASK_OPTS.plist to /Library/LaunchAgents/dev.celenity.env.HOMEBREW_CASK_OPTS.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.HOMEBREW_CASK_OPTS.plist /Library/LaunchAgents/dev.celenity.env.HOMEBREW_CASK_OPTS.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.HOMEBREW_CASK_OPTS.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.HOMEBREW_CASK_OPTS.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.HOMEBREW_CURLRC.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.HOMEBREW_CURLRC.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.HOMEBREW_CURLRC.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.HOMEBREW_CURLRC.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.HOMEBREW_CURLRC.plist to /Library/LaunchAgents/dev.celenity.env.HOMEBREW_CURLRC.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.HOMEBREW_CURLRC.plist /Library/LaunchAgents/dev.celenity.env.HOMEBREW_CURLRC.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.HOMEBREW_CURLRC.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.HOMEBREW_CURLRC.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.HOMEBREW_DISPLAY_INSTALL_TIMES.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.HOMEBREW_DISPLAY_INSTALL_TIMES.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.HOMEBREW_DISPLAY_INSTALL_TIMES.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.HOMEBREW_DISPLAY_INSTALL_TIMES.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.HOMEBREW_DISPLAY_INSTALL_TIMES.plist to /Library/LaunchAgents/dev.celenity.env.HOMEBREW_DISPLAY_INSTALL_TIMES.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.HOMEBREW_DISPLAY_INSTALL_TIMES.plist /Library/LaunchAgents/dev.celenity.env.HOMEBREW_DISPLAY_INSTALL_TIMES.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.HOMEBREW_DISPLAY_INSTALL_TIMES.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.HOMEBREW_DISPLAY_INSTALL_TIMES.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.HOMEBREW_FORCE_BREWED_CURL.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.HOMEBREW_FORCE_BREWED_CURL.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.HOMEBREW_FORCE_BREWED_CURL.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.HOMEBREW_FORCE_BREWED_CURL.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.HOMEBREW_FORCE_BREWED_CURL.plist to /Library/LaunchAgents/dev.celenity.env.HOMEBREW_FORCE_BREWED_CURL.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.HOMEBREW_FORCE_BREWED_CURL.plist /Library/LaunchAgents/dev.celenity.env.HOMEBREW_FORCE_BREWED_CURL.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.HOMEBREW_FORCE_BREWED_CURL.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.HOMEBREW_FORCE_BREWED_CURL.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.HOMEBREW_FORCE_BREWED_GIT.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.HOMEBREW_FORCE_BREWED_GIT.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.HOMEBREW_FORCE_BREWED_GIT.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.HOMEBREW_FORCE_BREWED_GIT.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.HOMEBREW_FORCE_BREWED_GIT.plist to /Library/LaunchAgents/dev.celenity.env.HOMEBREW_FORCE_BREWED_GIT.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.HOMEBREW_FORCE_BREWED_GIT.plist /Library/LaunchAgents/dev.celenity.env.HOMEBREW_FORCE_BREWED_GIT.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.HOMEBREW_FORCE_BREWED_GIT.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.HOMEBREW_FORCE_BREWED_GIT.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.HOMEBREW_NO_ANALYTICS.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.HOMEBREW_NO_ANALYTICS.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.HOMEBREW_NO_ANALYTICS.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.HOMEBREW_NO_ANALYTICS.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.HOMEBREW_NO_ANALYTICS.plist to /Library/LaunchAgents/dev.celenity.env.HOMEBREW_NO_ANALYTICS.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.HOMEBREW_NO_ANALYTICS.plist /Library/LaunchAgents/dev.celenity.env.HOMEBREW_NO_ANALYTICS.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.HOMEBREW_NO_ANALYTICS.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.HOMEBREW_NO_ANALYTICS.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.HOMEBREW_NO_ENV_HINTS.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.HOMEBREW_NO_ENV_HINTS.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.HOMEBREW_NO_ENV_HINTS.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.HOMEBREW_NO_ENV_HINTS.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.HOMEBREW_NO_ENV_HINTS.plist to /Library/LaunchAgents/dev.celenity.env.HOMEBREW_NO_ENV_HINTS.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.HOMEBREW_NO_ENV_HINTS.plist /Library/LaunchAgents/dev.celenity.env.HOMEBREW_NO_ENV_HINTS.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.HOMEBREW_NO_ENV_HINTS.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.HOMEBREW_NO_ENV_HINTS.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.HOMEBREW_NO_GITHUB_API.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.HOMEBREW_NO_GITHUB_API.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.HOMEBREW_NO_GITHUB_API.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.HOMEBREW_NO_GITHUB_API.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.HOMEBREW_NO_GITHUB_API.plist to /Library/LaunchAgents/dev.celenity.env.HOMEBREW_NO_GITHUB_API.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.HOMEBREW_NO_GITHUB_API.plist /Library/LaunchAgents/dev.celenity.env.HOMEBREW_NO_GITHUB_API.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.HOMEBREW_NO_GITHUB_API.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.HOMEBREW_NO_GITHUB_API.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.HOMEBREW_NO_INSECURE_REDIRECT.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.HOMEBREW_NO_INSECURE_REDIRECT.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.HOMEBREW_NO_INSECURE_REDIRECT.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.HOMEBREW_NO_INSECURE_REDIRECT.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.HOMEBREW_NO_INSECURE_REDIRECT.plist to /Library/LaunchAgents/dev.celenity.env.HOMEBREW_NO_INSECURE_REDIRECT.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.HOMEBREW_NO_INSECURE_REDIRECT.plist /Library/LaunchAgents/dev.celenity.env.HOMEBREW_NO_INSECURE_REDIRECT.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.HOMEBREW_NO_INSECURE_REDIRECT.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.HOMEBREW_NO_INSECURE_REDIRECT.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.HOMEBREW_VERBOSE.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.HOMEBREW_VERBOSE.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.HOMEBREW_VERBOSE.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.HOMEBREW_VERBOSE.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.HOMEBREW_VERBOSE.plist to /Library/LaunchAgents/dev.celenity.env.HOMEBREW_VERBOSE.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.HOMEBREW_VERBOSE.plist /Library/LaunchAgents/dev.celenity.env.HOMEBREW_VERBOSE.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.HOMEBREW_VERBOSE.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.HOMEBREW_VERBOSE.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.JavaScriptCoreUseJIT.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.JavaScriptCoreUseJIT.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.JavaScriptCoreUseJIT.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.JavaScriptCoreUseJIT.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.JavaScriptCoreUseJIT.plist to /Library/LaunchAgents/dev.celenity.env.JavaScriptCoreUseJIT.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.JavaScriptCoreUseJIT.plist /Library/LaunchAgents/dev.celenity.env.JavaScriptCoreUseJIT.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.JavaScriptCoreUseJIT.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.JavaScriptCoreUseJIT.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.JSC_useFTLJIT.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.JSC_useFTLJIT.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.JSC_useFTLJIT.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.JSC_useFTLJIT.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.JSC_useFTLJIT.plist to /Library/LaunchAgents/dev.celenity.env.JSC_useFTLJIT.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.JSC_useFTLJIT.plist /Library/LaunchAgents/dev.celenity.env.JSC_useFTLJIT.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.JSC_useFTLJIT.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.JSC_useFTLJIT.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.LDFLAGS.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.LDFLAGS.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.LDFLAGS.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.LDFLAGS.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.LDFLAGS.plist to /Library/LaunchAgents/dev.celenity.env.LDFLAGS.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.LDFLAGS.plist /Library/LaunchAgents/dev.celenity.env.LDFLAGS.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.LDFLAGS.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.LDFLAGS.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.POWERSHELL_TELEMETRY_OPTOUT.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.POWERSHELL_TELEMETRY_OPTOUT.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.POWERSHELL_TELEMETRY_OPTOUT.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.POWERSHELL_TELEMETRY_OPTOUT.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.POWERSHELL_TELEMETRY_OPTOUT.plist to /Library/LaunchAgents/dev.celenity.env.POWERSHELL_TELEMETRY_OPTOUT.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.POWERSHELL_TELEMETRY_OPTOUT.plist /Library/LaunchAgents/dev.celenity.env.POWERSHELL_TELEMETRY_OPTOUT.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.POWERSHELL_TELEMETRY_OPTOUT.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.POWERSHELL_TELEMETRY_OPTOUT.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.SAM_CLI_TELEMETRY.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.SAM_CLI_TELEMETRY.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.SAM_CLI_TELEMETRY.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.SAM_CLI_TELEMETRY.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.SAM_CLI_TELEMETRY.plist to /Library/LaunchAgents/dev.celenity.env.SAM_CLI_TELEMETRY.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.SAM_CLI_TELEMETRY.plist /Library/LaunchAgents/dev.celenity.env.SAM_CLI_TELEMETRY.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.SAM_CLI_TELEMETRY.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.SAM_CLI_TELEMETRY.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.SHELL_SESSIONS_DISABLE.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.SHELL_SESSIONS_DISABLE.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.SHELL_SESSIONS_DISABLE.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.SHELL_SESSIONS_DISABLE.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.SHELL_SESSIONS_DISABLE.plist to /Library/LaunchAgents/dev.celenity.env.SHELL_SESSIONS_DISABLE.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.SHELL_SESSIONS_DISABLE.plist /Library/LaunchAgents/dev.celenity.env.SHELL_SESSIONS_DISABLE.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.SHELL_SESSIONS_DISABLE.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.SHELL_SESSIONS_DISABLE.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.VISUAL.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.VISUAL.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.VISUAL.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.VISUAL.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.VISUAL.plist to /Library/LaunchAgents/dev.celenity.env.VISUAL.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.VISUAL.plist /Library/LaunchAgents/dev.celenity.env.VISUAL.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.VISUAL.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.VISUAL.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.WEBKIT_FORCE_SANDBOX.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.WEBKIT_FORCE_SANDBOX.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.WEBKIT_FORCE_SANDBOX.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.WEBKIT_FORCE_SANDBOX.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.WEBKIT_FORCE_SANDBOX.plist to /Library/LaunchAgents/dev.celenity.env.WEBKIT_FORCE_SANDBOX.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.WEBKIT_FORCE_SANDBOX.plist /Library/LaunchAgents/dev.celenity.env.WEBKIT_FORCE_SANDBOX.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.WEBKIT_FORCE_SANDBOX.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.WEBKIT_FORCE_SANDBOX.plist || error_fn
echo

echo_green_text "Downloading dev.celenity.env.WPE_SHELL_DISABLE_MEDIA_DISK_CACHE.plist..."
curl --cert-status --doh-cert-status --no-insecure --no-proxy-insecure --no-sessionid --no-ssl --no-ssl-allow-beast --no-ssl-auto-client-cert --no-ssl-no-revoke --no-ssl-revoke-best-effort --proto -all,https --proto-default https --proto-redir -all,https --show-error -O -sSL https://gitlab.com/celenityy/configs/-/raw/pages/osx/System/Library/LaunchAgents/dev.celenity.env.WPE_SHELL_DISABLE_MEDIA_DISK_CACHE.plist || error_fn
echo

echo_green_text "Changing permissions of dev.celenity.env.WPE_SHELL_DISABLE_MEDIA_DISK_CACHE.plist to 644..."
/usr/bin/sudo /bin/chmod -v 644 dev.celenity.env.WPE_SHELL_DISABLE_MEDIA_DISK_CACHE.plist || error_fn
echo

echo_green_text "Copying dev.celenity.env.WPE_SHELL_DISABLE_MEDIA_DISK_CACHE.plist to /Library/LaunchAgents/dev.celenity.env.WPE_SHELL_DISABLE_MEDIA_DISK_CACHE.plist..."
/usr/bin/sudo /bin/cp dev.celenity.env.WPE_SHELL_DISABLE_MEDIA_DISK_CACHE.plist /Library/LaunchAgents/dev.celenity.env.WPE_SHELL_DISABLE_MEDIA_DISK_CACHE.plist || error_fn
echo

echo_green_text "Loading dev.celenity.env.WPE_SHELL_DISABLE_MEDIA_DISK_CACHE.plist..."
/bin/launchctl load /Library/LaunchAgents/dev.celenity.env.WPE_SHELL_DISABLE_MEDIA_DISK_CACHE.plist || error_fn
echo

echo_green_text "All done. :)"

echo_red_text "Your system will now reboot to apply your new environment variables."
/bin/sleep 5
echo_green_text "Press enter to continue."
read

/usr/bin/sudo /sbin/reboot
