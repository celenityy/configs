//
// Welcome to celenity's user.js ;)

// This is designed to be used WITH Phoenix: https://phoenix.celenity.dev
// This includes my personal preferences; things that don't make sense to add to Phoenix for various reasons...

/*** NOTE TO SELF: REPLACE [XXXXXX] AT 002 ***/

/*** PROFILE LOCATION: ~/Library/Application Support/Firefox/Profiles ***/

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

/// Use Phoenix Extended (w/ Firefox-UI-Fix)
user_pref("autoadmin.global_config_url", "file:///opt/homebrew/opt/phoenix-osx/configs/ui-fix/hardened.cfg");

user_pref("browser.celenity.status.osx", "000");

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

user_pref("browser.celenity.status.osx", "001");

/*** 002 DNS ***/

/// Use NextDNS
user_pref("network.trr.bootstrapAddr", "45.90.28.0");
user_pref("network.trr.custom_uri", "https://firefox.dns.nextdns.io/[XXXXXX]/OS%20X");
user_pref("network.trr.uri", "https://firefox.dns.nextdns.io/[XXXXXX]/OS%20X");

user_pref("browser.celenity.status.osx", "002");

/*** 003 PRIVACY ***/

/// Clear cookies/site data on exit
// NOTE: State partitioning is DISABLED for sites you add as exceptions, so you MUST use containers...
user_pref("privacy.clearOnShutdown.cookies", true);
user_pref("privacy.clearOnShutdown.offlineApps", true);
user_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", true);

/// Disable Remote FPP Overrides
// This currently only disables canvas randomization for Google domains
// https://firefox.settings.services.mozilla.com/v1/buckets/main/collections/fingerprinting-protection-overrides/changeset?_expected=0
user_pref("privacy.fingerprintingProtection.remoteOverrides.enabled", false);

/// Disable Remote Permissions
// This currently only allows overrides for HTTPS First
// https://searchfox.org/mozilla-central/source/extensions/permissions/docs/remote.rst
// https://searchfox.org/mozilla-central/source/extensions/permissions/RemotePermissionService.sys.mjs
// https://firefox.settings.services.mozilla.com/v1/buckets/main/collections/remote-permissions/changeset?_expected=0
user_pref("permissions.manager.remote.enabled", false);

/// Spoof locale to `en-US`
user_pref("intl.accept_languages", "en-US, en"); // `Accept-Language` HTTP Header
user_pref("privacy.fingerprintingProtection.overrides", "+AllTargets,-CanvasExtractionBeforeUserInputIsBlocked,-CSSPrefersColorScheme,-FrameRate"); // Internationalization API (removes -JSLocale)
user_pref("privacy.spoof_english", 2); // Currently only works with RFP, at least on desktop - https://bugzilla.mozilla.org/show_bug.cgi?id=1957553

user_pref("browser.celenity.status.osx", "003");

/*** 004 DEBUGGING ***/

/// Configure the Browser Console
user_pref("devtools.browserconsole.enableNetworkMonitoring", true);
user_pref("devtools.browserconsole.filter.net", true);
user_pref("devtools.browserconsole.filter.netxhr", true);
user_pref("devtools.browsertoolbox.scope", "everything");
user_pref("devtools.debugger.pause-on-debugger-statement", false);
user_pref("devtools.debugger.show-content-scripts", true);
user_pref("devtools.webconsole.filter.net", true);
user_pref("devtools.webconsole.filter.netxhr", true);

/// Enable `about:home` developer tools
user_pref("browser.newtabpage.activity-stream.asrouter.devtoolsEnabled", true);

user_pref("browser.celenity.status.osx", "004");

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

/// Hard-fail OCSP revocation checks
// Significant security improvement
// https://github.com/arkenfox/user.js/issues/1576
user_pref("security.OCSP.require", true);

/// Only send cross-origin referers if hosts match
// https://wiki.mozilla.org/Security/Referrer
user_pref("network.http.referer.XOriginPolicy", 2);

/// Set default time range when manually clearing data to "everything"
user_pref("privacy.sanitize.timeSpan", 0);

user_pref("browser.celenity.status.osx", "005");

/*** 006 RESET PER SESSION ***/

// These are preferences I'm currently testing for various reasons, they may end up in Phoenix at some point

user_pref("network.http.http3.use_nspr_for_io", false);
user_pref("pdfjs.enableAltText", true);
user_pref("pdfjs.enableAltTextForEnglish", true);

user_pref("browser.celenity.status.osx", "006");

user_pref("browser.celenity.status.osx", "successfully applied :D");

//
// This is a user.js file meant for Firefox on desktop to impersonate Firefox on Android
// Useful for testing, but not much else...
//

/*** NOTE TO SELF: SET `uiPopupConfig` TO `+logger` IN UBLOCK ORIGIN'S ADVANCED SETTINGS TO ADD BACK LOGGER BUTTON ***/

/* INDEX 

001: USER AGENT

*/

/*** 001 USER AGENT ***/

// Spoof user agent to Android
user_pref("general.useragent.override", "Mozilla/5.0 (Android 10; Mobile; rv:137.0) Gecko/137.0 Firefox/137.0"); // [HIDDEN]
user_pref("privacy.fingerprintingProtection.overrides", "+AllTargets,-CanvasExtractionBeforeUserInputIsBlocked,-CSSPrefersColorScheme,-FrameRate,-HttpUserAgent,-NavigatorUserAgent"); // Prevent FPP from overriding `general.useragent.override`

user_pref("browser.celenity.status.mobile", "001");

user_pref("browser.celenity.status.mobile", "successfully applied :D");
