brew_casks=(
	#agenda
	bitwarden
	chatgpt
	#crossover
	docker
    #figma
	firefox
    handbrake
    nordvpn
    notion
    #ollama
    postman
    signal
	spotify
    stats
    steam
    sublime-text
	visual-studio-code
	vlc
    #wave
    whatsapp
    whisky
)

mas_apps=(
    "545519333"   #Prime Video
    "571213070"   #DaVinci Resolve
    "1440147259"  #AdGuard for Safari
)

install_macos_apps() {
    if [[ ${#brew_casks[@]} -gt 0 ]]; then
        info "Installing brew casks..."
	    install_brew_casks "${brew_casks[@]}"
    else
        info "No brew casks to install."
    fi
}

install_masApps() {
    if [[ ${#mas_apps[@]} -gt 0 ]]; then
        info "Installing App Store apps..."
	    for app in "${mas_apps[@]}"; do
		    mas install "$app"
	    done
    else
        info "No App Store apps to install."
    fi
}