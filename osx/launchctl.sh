#!/bin/zsh

# WIP
# ex. (found from sudo launchctl disable com.apple.appleseed.seedusaged)

# seedusaged
sudo launchctl stop com.apple.appleseed.seedusaged
sudo launchctl stop com.apple.appleseed.seedusaged.postinstall
sudo launchctl disable gui/502/com.apple.appleseed.seedusaged
sudo launchctl disable gui/502/com.apple.appleseed.seedusaged.postinstall
sudo launchctl disable system/com.apple.appleseed.seedusaged 
sudo launchctl disable system/com.apple.appleseed.seedusaged.postinstall

# fbahelperd
sudo launchctl stop com.apple.appleseed.fbahelperd
sudo launchctl disable gui/502/com.apple.appleseed.fbahelperd
sudo launchctl disable system/com.apple.appleseed.fbahelperd

# feedbackd
sudo launchctl stop com.apple.feedbackd
sudo launchctl stop com.apple.feedbackd.centralized-feedback
sudo launchctl disable gui/502/com.apple.feedbackd
sudo launchctl disable gui/502/com.apple.feedbackd.centralized-feedback
sudo launchctl disable system/com.apple.feedbackd
sudo launchctl disable system/com.apple.feedbackd.centralized-feedback

# adprivacyd
sudo launchctl stop com.apple.ap.adprivacyd
sudo launchctl stop com.apple.ap.adprivacyd.attribution
sudo launchctl stop com.apple.ap.adprivacyd.opt-out
sudo launchctl stop com.apple.ap.adprivacyd.idmanager
sudo launchctl disable gui/502/com.apple.ap.adprivacyd
sudo launchctl disable gui/502/com.apple.ap.adprivacyd.attribution
sudo launchctl disable gui/502/com.apple.ap.adprivacyd.opt-out
sudo launchctl disable gui/502/com.apple.ap.adprivacyd.idmanager
sudo launchctl disable system/com.apple.ap.adprivacyd
sudo launchctl disable system/com.apple.ap.adprivacyd.attribution
sudo launchctl disable system/com.apple.ap.adprivacyd.opt-out
sudo launchctl disable system/com.apple.ap.adprivacyd.idmanager

# adservicesd.statusconditionservice
sudo launchctl stop com.apple.ap.adservicesd.statusconditionservice
sudo launchctl disable gui/502/com.apple.ap.adservicesd.statusconditionservice
sudo launchctl disable system/com.apple.ap.adservicesd.statusconditionservice

# dprivacyd
sudo launchctl disable gui/502/com.apple.dprivacyd
sudo launchctl disable system/com.apple.dprivacyd

# promotedcontentd
sudo launchctl stop com.apple.ap.promotedcontentd
sudo launchctl disable gui/502/com.apple.ap.promotedcontentd
sudo launchctl disable system/com.apple.ap.promotedcontentd

# amsengagementd
sudo launchctl stop com.apple.amsengagementd
sudo launchctl stop com.apple.aps.amsengagementd
sudo launchctl stop com.apple.xpc.amsengagementd
sudo launchctl disable gui/502/com.apple.amsengagementd
sudo launchctl disable gui/502/com.apple.aps.amsengagementd
sudo launchctl disable gui/502/com.apple.xpc.amsengagementd
sudo launchctl disable system/com.apple.amsengagementd
sudo launchctl disable system/com.apple.aps.amsengagementd
sudo launchctl disable system/com.apple.xpc.amsengagementd

# bird (icloud documents)
sudo launchctl stop com.apple.bird
sudo launchctl disable gui/502/com.apple.bird
sudo launchctl disable system/com.apple.bird

# familycircled
sudo launchctl stop com.apple.familycircled
sudo launchctl disable gui/502/com.apple.familycircled
sudo launchctl disable system/com.apple.familycircled

# triald (a/b testing/ experimentation - ex. https://eclecticlight.co/2022/03/31/what-is-triald-and-why-is-it-taking-so-much-disk-space/)
sudo launchctl stop com.apple.triald
sudo launchctl stop com.apple.triald.cache-delete
sudo launchctl stop com.apple.triald.internal
sudo launchctl stop com.apple.triald.namespace-management
sudo launchctl stop com.apple.triald.system
sudo launchctl stop com.apple.aps.triald
sudo launchctl disable gui/502/com.apple.triald
sudo launchctl disable gui/502/com.apple.triald.cache-delete
sudo launchctl disable gui/502/com.apple.triald.internal
sudo launchctl disable gui/502/com.apple.triald.namespace-management
sudo launchctl disable gui/502/com.apple.triald.system
sudo launchctl disable gui/502/com.apple.aps.triald
sudo launchctl disable system/com.apple.triald
sudo launchctl disable system/com.apple.triald.cache-delete
sudo launchctl disable system/com.apple.triald.internal
sudo launchctl disable system/com.apple.triald.namespace-management
sudo launchctl disable system/com.apple.triald.system
sudo launchctl disable system/com.apple.aps.triald

# askpermissiond
sudo launchctl stop com.apple.askpermissiond
sudo launchctl disable gui/502/com.apple.askpermissiond
sudo launchctl disable system/com.apple.askpermissiond

# cloudphotod
sudo launchctl stop com.apple.cloudphotod
sudo launchctl stop com.apple.cloudphotod.daemon
sudo launchctl disable gui/502/com.apple.cloudphotod
sudo launchctl disable gui/502/com.apple.cloudphotod.daemon
sudo launchctl disable system/com.apple.cloudphotod
sudo launchctl disable system/com.apple.cloudphotod.daemon

# Content Caching
sudo launchctl stop com.apple.AssetCache.builtin
sudo launchctl stop com.apple.AssetCacheLocatorService
sudo launchctl stop com.apple.AssetCacheManagerService
sudo launchctl stop com.apple.AssetCacheTetheratorService
sudo launchctl stop com.apple.AssetCacheC.builtin
sudo launchctl disable gui/502/com.apple.AssetCache.builtin
sudo launchctl disable gui/502/com.apple.AssetCacheLocatorService
sudo launchctl disable gui/502/com.apple.AssetCacheManagerService
sudo launchctl disable gui/502/com.apple.AssetCacheTetheratorService
sudo launchctl disable gui/502/com.apple.AssetCacheC.builtin
sudo launchctl disable system/com.apple.AssetCache.builtin
sudo launchctl disable system/com.apple.AssetCacheLocatorService
sudo launchctl disable system/com.apple.AssetCacheManagerService
sudo launchctl disable system/com.apple.AssetCacheTetheratorService
sudo launchctl disable system/com.apple.AssetCacheC.builtin

# findmybeaconingd
sudo launchctl stop com.apple.findmy.findmybeaconingd
sudo launchctl disable gui/502/com.apple.findmy.findmybeaconingd
sudo launchctl disable system/com.apple.findmy.findmybeaconingd

# findmydeviced
sudo launchctl stop com.apple.icloud.findmydeviced
sudo launchctl disable gui/502/com.apple.icloud.findmydeviced
sudo launchctl disable system/com.apple.icloud.findmydeviced

# findmymacd
sudo launchctl stop com.apple.findmymacd
sudo launchctl disable gui/502/com.apple.findmymacd
sudo launchctl disable system/com.apple.findmymacd

# findmymacmessenger
sudo launchctl stop com.apple.findmymacmessenger
sudo launchctl disable gui/502/com.apple.findmymacmessenger
sudo launchctl disable system/com.apple.findmymacmessenger

# searchpartyd
sudo launchctl stop com.apple.icloud.searchpartyd
sudo launchctl disable gui/502/com.apple.icloud.searchpartyd
sudo launchctl disable system/com.apple.icloud.searchpartyd

# fairplayd
sudo launchctl stop com.apple.fairplayd
sudo launchctl stop com.apple.fairplayd.xpc
sudo launchctl disable gui/502/com.apple.fairplayd
sudo launchctl disable gui/502/com.apple.fairplayd.xpc
sudo launchctl disable system/com.apple.fairplayd
sudo launchctl disable system/com.apple.fairplayd.xpc

# fairplaydeviceidentityd
sudo launchctl stop com.apple.fairplaydeviceidentityd
sudo launchctl disable gui/502/com.apple.fairplaydeviceidentityd
sudo launchctl disable system/com.apple.fairplaydeviceidentityd

# SubmitDiagInfo
sudo launchctl stop com.apple.SubmitDiagInfo
sudo launchctl disable gui/502/com.apple.SubmitDiagInfo
sudo launchctl disable system/com.apple.SubmitDiagInfo

# signpost_reporter
sudo launchctl stop com.apple.signpost.signpost_reporter
sudo launchctl disable gui/502/com.apple.signpost.signpost_reporter
sudo launchctl disable system/com.apple.signpost.signpost_reporter

# rapportd
sudo launchctl stop com.apple.rapportd
sudo launchctl disable gui/502/com.apple.rapportd
sudo launchctl disable system/com.apple.rapportd

# analyticsd
sudo launchctl stop com.apple.analyticsd
sudo launchctl stop com.apple.analyticsd.messagetracer
sudo launchctl disable gui/502/com.apple.analyticsd
sudo launchctl disable gui/502/com.apple.analyticsd.messagetracer
sudo launchctl disable system/com.apple.analyticsd
sudo launchctl disable system/com.apple.analyticsd.messagetracer

# audioanalyticsd
sudo launchctl stop com.apple.audioanalyticsd
sudo launchctl disable gui/502/com.apple.audioanalyticsd
sudo launchctl disable system/com.apple.audioanalyticsd

# ecosystemanalyticsd
sudo launchctl stop com.apple.ecosystemanalyticsd
sudo launchctl disable gui/502/com.apple.ecosystemanalyticsd
sudo launchctl disable system/com.apple.ecosystemanalyticsd

# geoanalyticsd
sudo launchctl stop com.apple.geoanalyticsd
sudo launchctl disable gui/502/com.apple.geoanalyticsd
sudo launchctl disable system/com.apple.geoanalyticsd

# memoryanalyticsd
sudo launchctl stop com.apple.memoryanalyticsd
sudo launchctl disable gui/502/com.apple.memoryanalyticsd
sudo launchctl disable system/com.apple.memoryanalyticsd

# wifianalyticsd
sudo launchctl stop com.apple.wifianalyticsd
sudo launchctl stop com.apple.wifianalyticsd.devicestore
sudo launchctl disable gui/502/com.apple.wifianalyticsd
sudo launchctl disable gui/502/com.apple.wifianalyticsd.devicestore
sudo launchctl disable system/com.apple.wifianalyticsd
sudo launchctl disable system/com.apple.wifianalyticsd.devicestore

# osanalyticshelper
sudo launchctl stop com.apple.osanalytics.osanalyticshelper
sudo launchctl disable gui/502/com.apple.osanalytics.osanalyticshelper
sudo launchctl disable system/com.apple.osanalytics.osanalyticshelper

# rtcreportingd
sudo launchctl stop com.apple.rtcreportingd
sudo launchctl disable gui/502/com.apple.rtcreportingd
sudo launchctl disable system/com.apple.rtcreportingd

# bosreporter
sudo launchctl stop com.apple.bosreporter
sudo launchctl disable gui/502/com.apple.bosreporter
sudo launchctl disable system/com.apple.bosreporter

# RemoteDesktop.PrivilegeProxy
sudo launchctl stop com.apple.RemoteDesktop.PrivilegeProxy
sudo launchctl disable gui/502/com.apple.RemoteDesktop.PrivilegeProxy
sudo launchctl disable system/com.apple.RemoteDesktop.PrivilegeProxy

# remotemanagementd
sudo launchctl stop com.apple.remotemanagementd
sudo launchctl stop com.apple.remotemanagementd.store
sudo launchctl stop com.apple.aps.remotemanagementd.http.apns-dev
sudo launchctl stop com.apple.aps.remotemanagementd.http.apns-prod
sudo launchctl disable gui/502/com.apple.remotemanagementd
sudo launchctl disable gui/502/com.apple.remotemanagementd.store
sudo launchctl disable gui/502/com.apple.aps.remotemanagementd.http.apns-dev
sudo launchctl disable gui/502/com.apple.aps.remotemanagementd.http.apns-prod
sudo launchctl disable system/com.apple.remotemanagementd
sudo launchctl disable system/com.apple.remotemanagementd.store
sudo launchctl disable system/com.apple.aps.remotemanagementd.http.apns-dev
sudo launchctl disable system/com.apple.aps.remotemanagementd.http.apns-prod

# managedeventsd
sudo launchctl stop com.apple.devicemanagementclient.managedeventsd
sudo launchctl disable gui/502/com.apple.devicemanagementclient.managedeventsd
sudo launchctl disable system/com.apple.devicemanagementclient.managedeventsd

# nearbyd
sudo launchctl stop com.apple.nearbyd
sudo launchctl stop com.apple.nearbyd.xpc.nearbyinteraction
sudo launchctl stop com.apple.nearbyd.xpc.nearbyinteraction.observer
sudo launchctl disable gui/502/com.apple.nearbyd
sudo launchctl disable gui/502/com.apple.nearbyd.xpc.nearbyinteraction
sudo launchctl disable system/com.apple.nearbyd.xpc.nearbyinteraction.observer
sudo launchctl disable system/com.apple.nearbyd
sudo launchctl disable system/com.apple.nearbyd.xpc.nearbyinteraction
sudo launchctl disable system/com.apple.nearbyd.xpc.nearbyinteraction.observer

# RemotePairTool
sudo launchctl stop com.apple.RemotePairTool
sudo launchctl disable gui/502/com.apple.RemotePairTool
sudo launchctl disable system/com.apple.RemotePairTool