#!/bin/zsh

# credit to:
#https://github.com/TommyTran732/macOS-Setup-Script/blob/main/primary.sh

# Verify SSH Fingerprints
echo "VerifyHostKeyDNS yes" | sudo tee /etc/ssh/ssh_config.d/10-custom.conf
sudo chmod 644 /etc/ssh/ssh_config.d/10-custom.conf

# make sensitive directories private
for user in $(ls /Users | grep -v 'Shared'); do
sudo chmod 700 /Users/"$user"/Documents
sudo chmod 700 /Users/"$user"/Downloads
sudo chmod 700 /Users/"$user"/Music
sudo chmod 700 /Users/"$user"/Pictures
sudo chmod 700 /Users/"$user"/Movies

# Show full URLs in Safari
defaults write com.apple.Safari "ShowFullURLInSmartSearchField" -bool "true" && killall Safari

# Show file extensions in Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" && killall Finder

# Show hidden files in Finder
defaults write com.apple.finder "AppleShowAllFiles" -bool "true" && killall Finder

# Save locally by default
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"

# Disable feedback reporter "Autogather"
# https://macos-defaults.com/feedback-assistant/autogather.html
defaults write com.apple.appleseed.FeedbackAssistant "Autogather" -bool "false"

# Show Xcode build duration
defaults write com.apple.dt.Xcode "ShowBuildOperationDuration" -bool "true" && killall Xcode

# Show iMessage Subject field
defaults write com.apple.MobileSMS "MMSShowSubject" -bool "true" && killall Messages

# Disable date/time in screenshot names
defaults write com.apple.screencapture "include-date" -bool "false"

# Apple Advertising
defaults write com.apple.AdLib allowApplePersonalizedAdvertising 0
defaults write com.apple.AdLib allowIdentiferForAdvertising 0
defaults write com.apple.AdLib "partiality-segment" -string ""

# Siri
defaults write com.apple.Siri StatusMenuVisible 0
defaults write com.apple.Siri TypeToSiriEnabled 1
defaults write com.apple.Siri UserHasDeclinedEnable 1

# Sharing
defaults write com.apple.Sharing DisableAutoAccept 1
defaults write com.apple.Sharing SharedPeopleSuggestionsDisabled 1

# Adobe Crash Reporting?
defaults write com.adobe.crashreporter "always_never_send" 1

# Disable App Store Autoplay
defaults write com.apple.AppStore AutoPlayVideoSetting off

# Disable Books iCloud Sync?
defaults write com.apple.BKAgentService BKAgentServiceUseriCloudSetting 0

# Increase Music concurrent downloads
defaults write com.apple.Music userMaxConcurrentDownloads 10

# Increase Apple TV concurrent downloads
defaults write com.apple.TV userMaxConcurrentDownloads 10

# Enable Safari's Fraudulent Site Warning
defaults write com.apple.Safari.SafeBrowsing SafeBrowsingEnabled 1

# Always prompt for Safari downloads
defaults write com.apple.Safari.SandboxBroker AlwaysPromptForDownloadFolder 1

# Show Safari Develop/Debug Menu
defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu 1

# Disable Rich Text in TextEdit (Annoying iirc)
defaults write com.apple.TextEdit RichText 0

# Disable Media Sharing? Investigate
defaults write com.apple.map.mediasharingd "home-sharing-computer-id" -string ""
defaults write com.apple.map.mediasharingd "home-sharing-enabled" 0
defaults write com.apple.map.mediasharingd "home-sharing-group-id" -string ""
defaults write com.apple.map.mediasharingd "photo-sharing-enabled" 0
defaults write com.apple.map.mediasharingd "public-sharing-enabled" 0

# Potentially kill App Store Analytics
defaults write com.apple.appstored LastWeeklyAnalyticsPostDate -string "2040-08-11 3:12:51\\U202fAM +0000"

# Same
defaults write com.apple.assistant "Last client experiment check date" -string "2040-08-13 6:23:47\\U202fPM +0000"
defaults write com.apple.assistant "Last server experiment check date" -string "2040-08-13 6:23:47\\U202fPM +0000"

# Siri/Assistant/Dictation (Investigate siri data sharing)
defaults write com.apple.assistant.support "Assistant Enabled" 0
defaults write com.apple.assistant.support "Dictation Enabled" 0
defaults write com.apple.assistant.support "Siri Data Sharing Opt-In Status" 2

# Skip Onboardings
defaults write com.apple.SetupAssistant DidSeeAccessibility 1
defaults write com.apple.SetupAssistant DidSeeActivationLock 1
defaults write com.apple.SetupAssistant DidSeeAppStore 1
defaults write com.apple.SetupAssistant DidSeeAppearanceSetup 1
defaults write com.apple.SetupAssistant DidSeeApplePaySetup 1
defaults write com.apple.SetupAssistant DidSeeCloudSetup 1
defaults write com.apple.SetupAssistant DidSeeLockdownMode 1
defaults write com.apple.SetupAssistant DidSeePrivacy 1
defaults write com.apple.SetupAssistant DidSeeScreenTime 1
defaults write com.apple.SetupAssistant DidSeeSiriSetup 1
defaults write com.apple.SetupAssistant DidSeeSyncSetup 1
defaults write com.apple.SetupAssistant DidSeeSyncSetup2 1
defaults write com.apple.SetupAssistant DidSeeTermsOfAddress 1
defaults write com.apple.SetupAssistant DidSeeTouchIDSetup 1
defaults write com.apple.SetupAssistant DidSeeiCloudLoginForStorageServices 1

# Tweak Spotlight
defaults write com.apple.Spotlight orderedItems =     (
                {
            enabled = 1;
            name = APPLICATIONS;
        },
                {
            enabled = 1;
            name = "MENU_EXPRESSION";
        },
                {
            enabled = 0;
            name = CONTACT;
        },
                {
            enabled = 1;
            name = "MENU_CONVERSION";
        },
                {
            enabled = 1;
            name = "MENU_DEFINITION";
        },
                {
            enabled = 1;
            name = SOURCE;
        },
                {
            enabled = 1;
            name = DOCUMENTS;
        },
                {
            enabled = 1;
            name = "EVENT_TODO";
        },
                {
            enabled = 1;
            name = DIRECTORIES;
        },
                {
            enabled = 1;
            name = FONTS;
        },
                {
            enabled = 1;
            name = IMAGES;
        },
                {
            enabled = 1;
            name = MESSAGES;
        },
                {
            enabled = 1;
            name = MOVIES;
        },
                {
            enabled = 1;
            name = MUSIC;
        },
                {
            enabled = 1;
            name = "MENU_OTHER";
        },
                {
            enabled = 1;
            name = PDF;
        },
                {
            enabled = 1;
            name = PRESENTATIONS;
        },
                {
            enabled = 0;
            name = "MENU_SPOTLIGHT_SUGGESTIONS";
        },
                {
            enabled = 1;
            name = SPREADSHEETS;
        },
                {
            enabled = 1;
            name = "SYSTEM_PREFS";
        },
                {
            enabled = 0;
            name = TIPS;
        },
                {
            enabled = 0;
            name = BOOKMARKS;
        }
    )

