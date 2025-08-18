//
// Welcome to celenity's user.js ;)

// This is designed to be used WITH Phoenix: https://phoenix.celenity.dev
// This includes my personal preferences; things that don't make sense to add to Phoenix for various reasons...

/*** NOTE TO SELF: REPLACE [XXXXXX] AT 002 ***/

/*** PROFILE LOCATION: ~/.mozilla/firefox ***/

/* INDEX 

000: PHOENIX
001: UX
002: DNS
003: PRIVACY
004: DEBUGGING
005: RESET PER SESSION
006: TESTING

*/

/*** 000 PHOENIX ***/

/// Use Phoenix's Twitter specialized config
user_pref("autoadmin.global_config_url", "file:///etc/firefox/phoenix/configs/ui-fix/twitter.cfg");

user_pref("browser.celenity.status.linux.twitter", "000");

/*** 001 UX ***/

/// Disable alerts for breached passwords (if the Password Manager is enabled)
// There are no privacy/security implications here, I'm just setting this to uncheck the box under `Passwords at `about:preferences#privacy`, as I don't use the built-in Password Manager...
user_pref("signon.management.page.breach-alerts.enabled", false);

/// Disable strong password generation (if the Password Manager is enabled)
// There are no privacy/security implications here, I'm just setting this to uncheck the box under `Passwords at `about:preferences#privacy`, as I don't use the built-in Password Manager...
user_pref("signon.generation.enabled", false);

/// Display PID & activeness when hovering over tabs
user_pref("browser.tabs.tooltipsShowPidAndActiveness", true);

/// Enable Dark Mode
user_pref("layout.css.prefers-color-scheme.content-override", 0);

/// Enable Smooth Scrolling
// Firefox seems to ignore this unless it's specified here on the user level...
user_pref("general.smoothScroll", true);

/// Use stricter media autoplay blocking
// Default = 0
user_pref("media.autoplay.blocking_policy", 2);

user_pref("browser.celenity.status.linux.twitter", "001");

/*** 002 DNS ***/

/// Use NextDNS
user_pref("network.trr.bootstrapAddr", "45.90.28.0");
user_pref("network.trr.uri", "https://firefox.dns.nextdns.io/[XXXXXX]/Linux");

user_pref("browser.celenity.status.linux.twitter", "002");

/*** 003 PRIVACY ***/

/// Clear cookies/site data on exit
// NOTE: State partitioning is DISABLED for sites you add as exceptions, so you MUST use containers...
user_pref("privacy.clearOnShutdown.cookies", true);
user_pref("privacy.clearOnShutdown.offlineApps", true);
user_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", true);

/// Spoof locale to `en-US`
user_pref("privacy.spoof_english", 2);

user_pref("browser.celenity.status.linux.twitter", "003");

/*** 004 DEBUGGING ***/

/// Configure the Browser Console
user_pref("devtools.browserconsole.enableNetworkMonitoring", true);
user_pref("devtools.browserconsole.filter.net", true);
user_pref("devtools.browserconsole.filter.netxhr", true);
user_pref("devtools.webconsole.filter.net", true);
user_pref("devtools.webconsole.filter.netxhr", true);

user_pref("browser.celenity.status.linux.twitter", "004");

/*** 005 RESET PER SESSION ***/

// These prefs are all already configured elsewhere, but I occasionally override these in certain situations and tend to forget to set them back...
// This ensures they always reset per-session.

/// Disable Resist Fingerprinting (RFP)
// https://support.mozilla.org/kb/resist-fingerprinting
// I sometimes temporarily enable RFP as a workaround for managing the canvas permission: https://bugzilla.mozilla.org/show_bug.cgi?id=1947677
user_pref("privacy.resistFingerprinting", false); // [DEFAULT]

/// Disable WebAssembly (WASM)
// https://spectrum.ieee.org/more-worries-over-the-security-of-web-assembly
user_pref("javascript.options.wasm", false);

//// Enable Suspected Fingerprinters Protection (FPP)
/// https://support.mozilla.org/kb/firefox-protection-against-fingerprinting#w_suspected-fingerprinters
user_pref("privacy.fingerprintingProtection", true);
user_pref("privacy.fingerprintingProtection.pbmode", true); // [DEFAULT - non-Thunderbird]

/// Findbar
user_pref("findbar.entireword", false);
user_pref("findbar.highlightAll", true);

/// Hard-fail OCSP revocation checks
// Significant security improvement
// https://github.com/arkenfox/user.js/issues/1576
user_pref("security.OCSP.require", true);

/// Set default time range when manually clearing data to "everything"
user_pref("privacy.sanitize.timeSpan", 0);

user_pref("browser.celenity.status.linux.twitter", "005");

user_pref("browser.celenity.status.linux.twitter", "successfully applied :D");
