
//
// This is a user.js file meant for Firefox on desktop to impersonate Firefox on Android
// Useful for testing, but not much else...
//

/*** NOTE TO SELF: SET `uiPopupConfig` TO `+logger` IN UBLOCK ORIGIN'S ADVANCED SETTINGS TO ADD BACK LOGGER BUTTON ***/

/* INDEX 

001: USER AGENT
002: FIREFOX SYNC

*/

/*** 001 USER AGENT ***/

// Spoof user agent to Android
user_pref("general.useragent.override", "Mozilla/5.0 (Android 10; Mobile; rv:141.0) Gecko/141.0 Firefox/141.0"); // [HIDDEN]
user_pref("privacy.fingerprintingProtection.overrides", "+AllTargets,-CanvasExtractionBeforeUserInputIsBlocked,-CSSPrefersColorScheme,-FrameRate,-HttpUserAgent,-NavigatorUserAgent"); // Prevent FPP from overriding `general.useragent.override`

user_pref("browser.celenity.status.mobile", "001");

/*** 002 FIREFOX SYNC ***/

// Disable Firefox Sync
user_pref("identity.fxaccounts.enabled", false);
user_pref("identity.fxaccounts.toolbar.defaultVisible", false);

user_pref("browser.celenity.status.mobile", "002");

user_pref("browser.celenity.status.mobile", "successfully applied :D");
