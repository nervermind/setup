# Check for the --test flag
if [[ " $* " == *" --test "* ]]; then
  . ./inputs/apps.sh
  . ./scripts/utils.sh 
  info "Test mode running"
  TEST=true
fi

apply_brew_taps() {
	local tap_packages=$*
	install_count=0
	skipped_count=0
	for tap in $tap_packages; do
		if brew tap | grep "$tap" >/dev/null; then
			warn "Tap $tap is already applied"
			((skipped_count++))
		else
			if [ "$TEST" = true ]; then
				info "Test mode: Skipping tap $tap"
			else
				brew tap "$tap"
			fi
			((install_count++))
		fi
	done
	info "Applied $install_count taps."
	warn "Skipped $skipped_count taps."
}

install_brew_formulae() {
	local formulas=$*
	install_count=0
	skipped_count=0
	for formula in $formulas; do
		if brew list --formula | grep "$formula" >/dev/null; then
			warn "Formula $formula is already installed"
			((skipped_count++))
		else
			if [ "$TEST" = true ]; then
				info "Test mode: Skipping installation of formula $formula"
			else
				info "Installing package < $formula >"
				brew install "$formula"
			fi
			((install_count++))
		fi
	done
	info "Installed $install_count packages."
	warn "Skipped $skipped_count packages."
}

install_brew_casks() {
	local casks=$*
	install_count=0
	skipped_count=0
	for cask in $casks; do
		if brew list --casks | grep "$cask" >/dev/null; then
			warn "Cask $cask is already installed"
			((skipped_count++))
		else
			if [ "$TEST" = true ]; then
				info "Test mode: Skipping installation of cask $cask"
			else
				info "Installing cask < $cask >"
				brew install --cask "$cask"
			fi
			((install_count++))
		fi
	done
	info "Installed $install_count casks."
	warn "Skipped $skipped_count casks."
}

install_brew_fonts() {
	local fonts=$*
	install_count=0
	skipped_count=0
	for font in $fonts; do
		if brew list | grep "$font" >/dev/null; then
			warn "Cask $font is already installed"
			((skipped_count++))
		else
			if [ "$TEST" = true ]; then
				info "Test mode: Skipping installation of font $font"
			else
				info "Installing cask < $font >"
				brew install "$font"
			fi
			((install_count++))
		fi
	done
	info "Installed $install_count fonts."
	warn "Skipped $skipped_count fonts."
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

install_packages() {
    if [[ ${#brew_taps[@]} -gt 0 ]]; then
        info "Configuring taps"
        apply_brew_taps "${brew_taps[@]}"
    else
        info "No taps to configure."
    fi

    if [[ ${#brew_formulae[@]} -gt 0 ]]; then
        info "Installing formulae..."
	    install_brew_formulae "${brew_formulae[@]}"
    else
        info "No formulae to install."
    fi

	info "Cleaning up brew ..."
	if [ "$TEST" != true ]; then
		brew cleanup
	else
		info "Test mode: Skipping brew cleanup"
	fi
}

#post_install_packages() {
	#info "Installing fzf bindings"
	# shellcheck disable=SC2046
	#$(brew --prefix)/opt/fzf/install # not installed
#}

# Run the functions if the --test flag is set
if [ "$TEST" = true ]; then
  info "Testing Started"
  install_macos_apps
  install_fonts
  install_packages
fi