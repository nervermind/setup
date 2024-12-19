#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

. scripts/utils.sh
. scripts/brew.sh
. apps.sh
#. scripts/cli.sh
#. scripts/config.sh
. scripts/osx.sh
#. scripts/fonts.sh
. packages.sh


cleanup() {
	err "Last command failed"
	info "Finishing..."
}

wait_input() {
	read -p "Press enter to continue: "
}

main() {
	info "Installing ..."

    # Prompt the user for input
    while true; do
        read -p "Do you want install Homebrew Packages? (y/n): " user_input
        # Validate the input
        case "$user_input" in
            y|Y|yes|YES)
                echo "You chose 'yes'."
                break
                ;;
            n|N|no|NO)
                echo "You chose 'no'."
                break
                ;;
            *)
                echo "Invalid input. Please enter 'y' or 'n'."
                ;;
        esac
    done

	info "################################################################################"
	info "Homebrew Packages"
	info "################################################################################"
	wait_input
	install_packages
    
	#post_install_packages
	success "Finished installing Homebrew packages"
    : '
	info "################################################################################"
	info "Homebrew Fonts"
	info "################################################################################"
	wait_input
	install_fonts
	success "Finished installing fonts"

	info "################################################################################"
	info "Oh-my-zsh"
	info "################################################################################"
	wait_input
	install_oh_my_zsh
	success "Finished installing Oh-my-zsh"
    '
	info "################################################################################"
	info "MacOS Apps"
	info "################################################################################"
	wait_input
	install_macos_apps

	install_masApps
	success "Finished installing macOS apps"

	info "################################################################################"
	info "Configuration"
	info "################################################################################"
	wait_input
    
	setup_osx
	success "Finished configuring MacOS defaults. NOTE: A restart is needed"
	: '
	stow_dotfiles
	success "Finished stowing dotfiles"
    '
	info "################################################################################"
	info "Creating development folders"
	info "################################################################################"
	#mkdir -p ~/dev
    : '
	info "################################################################################"
	info "SSH Key"
	info "################################################################################"
	setup_github_ssh
	success "Finished setting up SSH Key"
    '

	success "Done"

	info "System needs to restart. Restart?"

	select yn in "y" "n"; do
		case $yn in
		y)
			sudo shutdown -r now
			break
			;;
		n) exit ;;
		esac
	done
}

trap cleanup SIGINT SIGTERM ERR EXIT

main