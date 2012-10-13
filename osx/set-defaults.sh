#!/bin/bash

# Run ./set-defaults.sh and you'll be good to go.


# https://github.com/mathiasbynens/dotfiles/blob/master/.osx
# ~/.osx — http://mths.be/osx
# https://github.com/ptb/Mac-OS-X-Lion-Setup/blob/master/setup.sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


### Modifier Keys… > Apple Internal Keyboard / Trackpad > Caps Lock ( ⇪) Key: No Action
#/usr/bin/defaults -currentHost write -g 'com.apple.keyboard.modifiermapping.1452-566-0' -array '<dict><key>HIDKeyboardModifierMappingDst</key><integer>262144</integer><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer></dict>'

### Modifier Keys… > Apple Keyboard [External] > Caps Lock ( ⇪) Key: No Action
#/usr/bin/defaults -currentHost write -g 'com.apple.keyboard.modifiermapping.1452-544-0' -array '<dict><key>HIDKeyboardModifierMappingDst</key><integer>262144</integer><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer></dict>'


### Zoom: Options… > Smooth images (Press ⌥ ⌘\ to turn smoothing on or off): off
/usr/bin/defaults write com.apple.universalaccess 'closeViewSmoothImages' -bool false

### Zoom: Options… > Use scroll wheel with modifier keys to zoom: on
/usr/bin/defaults write com.apple.universalaccess 'closeViewScrollWheelToggle' -bool true
### Zoom: Options… > Use scroll wheel with modifier keys to zoom: ^ [control]
/usr/bin/defaults write com.apple.universalaccess 'HIDScrollZoomModifierMask' -int 262144

# disable window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Menu bar: show remaining battery time (on pre-10.8); hide percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.battery ShowTime -string "NO"

# Finder; don't show hidden files
defaults write com.apple.Finder AppleShowAllFiles -bool false

# Disable opening and closing window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false



# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0


# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"


# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Don’t group windows by application in Mission Control
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock "expose-group-by-app" -bool false

# Don’t show Dashboard as a Space
defaults write com.apple.dock "dashboard-in-overlay" -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false





# Hot corners
# Top left screen corner → Mission Control
#defaults write com.apple.dock wvous-tl-corner -int 2
#defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Desktop
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Disable the Ping sidebar in iTunes
defaults write com.apple.iTunes disablePingSidebar -bool true
# Disable all the other Ping stuff in iTunes
defaults write com.apple.iTunes disablePing -bool true

# Make ⌘ + F focus the search input in iTunes
# To use these commands in another language, browse iTunes’s package contents,
# open `Contents/Resources/your-language.lproj/Localizable.strings`, and look
# for `kHiddenMenuItemTargetSearch`.
defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\\U21a9"

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"






# Use the jkahne theme by default in Terminal.app
#open "$HOME/.dotfiles/osx/jkahne.terminal"
#sleep 1 # Wait a bit to make sure the theme is loaded
defaults write com.apple.terminal "Default Window Settings" -string "jkahne"
defaults write com.apple.terminal "Startup Window Settings" -string "jkahne"

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

#for app in "Finder" "Mail" "SystemUIServer" "Terminal" "iTunes"; do
	#killall "$app" > /dev/null 2>&1
#done
echo "Done. Note that some of these changes require a logout/restart to take effect."


# Disable press-and-hold for keys in favor of key repeat.
#defaults write -g ApplePressAndHoldEnabled -bool false

# Use AirDrop over every interface. srsly this should be a default.
#defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important.
#defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder.
#chflags nohidden ~/Library

# Set a really fast key repeat.
#defaults write NSGlobalDomain KeyRepeat -int 0

# Show icons for hard drives, servers, and removable media on the desktop
#defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
#defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
#defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
#defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Run the screensaver if we're in the bottom-left hot corner.
#defaults write com.apple.dock wvous-bl-corner -int 5
#defaults write com.apple.dock wvous-bl-modifier -int 0

# Hide Safari's bookmark bar.
#defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development.
#defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
#defaults write com.apple.Safari IncludeDevelopMenu -bool true
#defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
#defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
#defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
