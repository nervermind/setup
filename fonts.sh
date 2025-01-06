fonts=(
	font-caskaydia-cove-nerd-font
    font-code-new-roman-nerd-font
)

install_fonts() {
	info "Installing fonts..."
	#brew tap homebrew/cask-fonts
	install_brew_fonts "${fonts[@]}"
}