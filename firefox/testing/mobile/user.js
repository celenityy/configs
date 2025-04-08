
//
// This is a user.js file meant for Firefox on desktop to impersonate Firefox on Android
// Useful for testing, but not much else...
//

/*** NOTE TO SELF: SET `modifyWebextFlavor` TO `+mobile` IN UBLOCK ORIGIN'S ADVANCED SETTINGS ***/

/* INDEX 

001: USER AGENT

*/

/*** 001 USER AGENT ***/

// Spoof user agent to Android
user_pref("general.useragent.override", "Mozilla/5.0 (Android 10; Mobile; rv:137.0) Gecko/137.0 Firefox/137.0"); // [HIDDEN]
user_pref("privacy.fingerprintingProtection.overrides", "+AllTargets,-CanvasExtractionBeforeUserInputIsBlocked,-CSSPrefersColorScheme,-FrameRate,-HttpUserAgent,-NavigatorUserAgent"); // Prevent FPP from overriding `general.useragent.override`

user_pref("browser.celenity.status.mobile", "001");

user_pref("browser.celenity.status.mobile", "successfully applied :D");
