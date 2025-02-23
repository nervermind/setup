# Check for the --test flag
if [[ " $* " == *" --test "* ]]; then
  . ./inputs/apps.sh
  . ./scripts/utils.sh 
  info "Test mode running"
  test=true
fi

apply_brew_taps() {
	local tap_packages=$*
	for tap in $tap_packages; do
		if brew tap | grep "$tap" >/dev/null; then
			warn "Tap $tap is already applied"
		else
			brew tap "$tap"
		fi
	done
}

install_brew_formulae() {
	local formulas=$*
	for formula in $formulas; do
		if brew list --formula | grep "$formula" >/dev/null; then
			warn "Formula $formula is already installed"
		else
			info "Installing package < $formula >"
			brew install "$formula"
		fi
	done
}

install_brew_casks() {
	local casks=$*
	for cask in $casks; do
		if brew list --casks | grep "$cask" >/dev/null; then
			warn "Cask $cask is already installed"
		else
			info "Installing cask < $cask >"
			brew install --cask "$cask"
		fi
	done
}

install_brew_fonts() {
	local fonts=$*
	for font in $fonts; do
		if brew list | grep "$font" >/dev/null; then
			warn "Cask $font is already installed"
		else
			info "Installing cask < $font >"
			brew install "$font"
		fi
	done
}

install_macos_apps() {
    if [[ ${#brew_casks[@]} -gt 0 ]]; then
        info "Installing brew casks..."
	    install_brew_casks "${brew_casks[@]}"
    else
        info "No brew casks to install."
    fi
}

install_fonts() {
	info "Installing fonts..."
	#brew tap homebrew/cask-fonts
	install_brew_fonts "${fonts[@]}"
}

# Run the functions if the --test flag is set
if [ "$test" = true ]; then
  info "Testing Started"
  install_macos_apps
  install_fonts
fi 