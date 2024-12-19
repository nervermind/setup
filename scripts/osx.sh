setup_osx() {
	info "Configuring MacOS default settings"

	# Hide external hard drives on desktop
	defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

	# Hide hard drives on desktop
	defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

	# Hide removable media hard drives on desktop
	defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

    # Show all extensions
    defaults write "Apple Global Domain"  AppleShowAllExtensions -bool true  

	# Avoid creating .DS_Store files on network volumes
	#defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

	# Show path bar
	#defaults write com.apple.finder ShowPathbar -bool true

	# Show hidden files inside the finder
	#defaults write com.apple.finder "AppleShowAllFiles" -bool true

	# Show Status Bar
	#defaults write com.apple.finder "ShowStatusBar" -bool true

	# Do not show warning when changing the file extension
	#defaults write com.apple.finder FXEnableExtensionChangeWarning -bool true

	# Set search scope to current folder
	#defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

	# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
	#defaults write com.apple.screencapture type -string "png"

	# Set weekly software update checks
	#defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 7

	# Set Desktop as the default location for new Finder windows
	# For other paths, use `PfLo` and `file:///full/path/here/`
	#defaults write com.apple.finder NewWindowTarget -string "PfHm"
	#defaults write com.apple.finder NewWindowTargetPath -string "file:///${HOME}/"

	# Enable the Develop menu and the Web Inspector in Safari
    defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true

	# Set Dock autohide
	defaults write com.apple.dock autohide -bool true
	#defaults write com.apple.dock largesize -float 128
	defaults write com.apple.dock tilesize -float 41

	# Disable startup sound
	#sudo nvram SystemAudioVolume=%01

    # Enable ssh agent on start up
    #info "Enabling ssh agent on start up with launchctl"
    #cp "$HOME/.dotfiles/macos/com.openssh.ssh-agent.plist" "$HOME/Library/LaunchAgents/"
    #launchctl load "$HOME/Library/LaunchAgents/com.openssh.ssh-agent.plist"
    #launchctl enable "$HOME/Library/LaunchAgents/com.openssh.ssh-agent.plist"
}
