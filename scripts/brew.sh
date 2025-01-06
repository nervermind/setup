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