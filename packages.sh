brew_taps=(
	#homebrew/cask
)

brew_formulae=(
    #bandwhich
    d2
    #kubernetes-cli
    lego
    mas
    node
    powerlevel10k
    stow
    zsh-autosuggestions
    zsh-history-substring-search
    zsh-syntax-highlighting
)

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
	brew cleanup
}

#post_install_packages() {
	#info "Installing fzf bindings"
	# shellcheck disable=SC2046
	#$(brew --prefix)/opt/fzf/install # not installed
#}