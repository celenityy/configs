# webview-flags

```sh
adb shell am start -a "com.android.webview.SHOW_DEV_UI"
```

`webview-enable-modern-cookie-same-site` -> `Enabled`

`site-per-process` -> `Enabled`

`FurtherOptimizeParsingDataUrls` -> `Enabled`

`PreloadLinkRelDataUrls` -> `Disabled`

`OptimizeHTMLElementUrls` -> `Enabled`

`WebViewAccelerateSmallCanvases` -> `Enabled`

`WebViewMixedContentAutoupgrades` -> `Enabled`

`GMSCoreEmoji` -> `Disabled`

`AutofillServerQueryPredictionsEarly` -> `Disabled`

`IPH_AutofillVirtualCardSuggestion` -> `Disabled`

`WebViewUseMetricsUploadServiceOnlySdkRuntime` -> `Disabled` **(For devices without GMS)**

`WebViewReduceUAAndroidVersionDeviceModel` -> `Enabled`

`ReduceUserAgentMinorVersion` -> `Enabled`

`ViewportHeightClientHintHeader` -> `Disabled`

`UACHOverrideBlank` -> `Enabled`

`DeprecateUnload` -> `Enabled`

`DeprecateUnloadByAllowList` -> `Disabled`

`WebViewFileSystemAccess` -> `Disabled`

`WebRtcPqcForDtls` -> `Enabled`

`ReportingServiceAlwaysFlush` -> `Enabled`

`MetricsLogTrimming` -> `Enabled`

`ReduceSubresourceResponseStartedIPC` -> `Enabled`

`AddWarningShownTSToClientSafeBrowsingReport` -> `Disabled`

`CreateWarningShownClientSafeBrowsingReports` -> `Disabled`

`ThirdPartyStoragePartitioning` -> `Enabled`

`EnableTLS13EarlyData` -> `Disabled`

`EnablePerfettoSystemTracing` -> `Disabled`

`EnablePerfettoSystemBackgroundTracing` -> `Disabled`

`AndroidHDR` -> `Enabled` **(For devices with HDR support)**

`PartitionAllocMemoryReclaimer` -> `Enabled`

`UseRustJsonParser` -> `Enabled`

`ThrottleUnimportantFrameTimers` -> `Enabled`

`WebViewBackForwardCache` -> `Disabled`

`AccessibilityManageBroadcastReceiverOnBackground` -> `Disabled`

`BatteryStatusManagerBroadcastReceiverInBackground` -> `Disabled`

`PartitionAllocWithAdvancedChecks` -> `Enabled` *([some info](https://groups.google.com/a/chromium.org/g/ios-reviews/c/BY-Xq_Zeds8)*

`BackForwardCacheSendNotRestoredReasons` -> `Disabled`

`webview-force-disable-3pcs` -> `Enabled`

`NoThrottlingVisibleAgent` -> `Disabled`

`AllowDatapipeDrainedAsBytesConsumerInBFCache` -> `Disabled`

`LowerHighResolutionTimerThreshold` -> `Enabled`

`InputStreamOptimizations` -> `Enabled`

`WebViewSkipInterceptsForPrefetch` -> `Disabled`

`EnableHangWatcher` -> `Disabled`

`CCSlimming` -> `Enabled`

`SensitiveContent` -> `Enabled` *([info](https://source.chromium.org/chromium/chromium/src/+/main:components/sensitive_content/))*

`BFCacheOpenBroadcastChannel` -> `Disabled`

`Prerender2FallbackPrefetchSpecRules` -> `Disabled`

`FetchLaterAPI` -> `Disabled`

`SharedStorageAPI` -> `Disabled`

`HttpCacheNoVarySearch` -> `Disabled`

`RestrictAbusePortsOnLocalhost` -> `Enabled`

`SharedDictionaryCache` -> `Disabled`

`CacheSharingForPervasiveScripts` -> `Disabled`

`PrefetchServiceWorker` -> `Disabled`

`WebVieEnableApiCallUserActions` -> `Disabled`

`WebViewEarlyStartupTracing` -> `Disabled`

`WebViewEarlyTracingInit` -> `Disabled`

`WebViewBackgroundTracingInit` -> `Disabled`

`WebViewFetchOriginTrialsComponent` -> `Disabled`

`WebViewWebPerformanceMetricsReporting` -> `Disabled`

`XMLRustForNonXslt` -> `Enabled`

`RustyBmpFeature` -> `Enabled`

`WebViewSaveStateIncludeHeaders` -> `Disabled`

`ThrottleSendingCustomUserTimings` -> `Enabled`

`PrefetchPrerenderINtegration` -> `Disabled`

`AAPMBlocksWebGPU` -> `Enabled`

`WebViewPersistHttpServerProperties` -> `Disabled`
