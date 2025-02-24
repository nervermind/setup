#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# Global variables
TEST=false

### Scripts
. scripts/utils.sh
. scripts/brew.sh
. scripts/cli.sh
. scripts/config.sh
. scripts/osx.sh
. scripts/git.sh
### ------

### Apps / fonts / packages
. ./inputs/apps.sh
. ./inputs/fonts.sh
. ./inputs/packages.sh
. ./inputs/repos.sh
### ------

main() {
	info "Starting script ..."

    # Prompt for user choice
    while true; do
        echo "Choose an option:"
        echo "1) Execute test mode"
        echo "2) Start installing script"
		echo "3) Exit"
        read -p "Enter your choice (1, 2, or 3): " user_choice
        case "$user_choice" in
            1)
                info "You chose 'Execute test mode'."
                TEST=true
                break
                ;;
            2)
                info "You chose 'Start installing script'."
                # Double-check with the user
                while true; do
                    read -p "Are you sure you want to start the installation script? (y/n): " confirm_choice
                    case "$confirm_choice" in
                        y|Y|yes|YES)
                            info "You confirmed 'Start installing script'."
                            TEST=false
                            break 2
                            ;;
                        n|N|no|NO)
                            warn "You chose 'no'. Returning to main menu."
                            break
                            ;;
                        *)
                            echo "Invalid input. Please enter 'y' or 'n'."
                            ;;
                    esac
                done
                ;;
			3)
                info "Exiting script."
                exit 0
                ;;
            *)
                echo "Invalid input. Please enter '1' or '2'."
                ;;
        esac
    done

    if [ "$TEST" = true ]; then
        info "Test mode running"
    else
        info "Starting installation script"
    fi

    # Prompt for test mode
    : 'while true; do
        read -p "Execute test mode? (y/n): " user_input
        # Validate the input
        case "$user_input" in
            y|Y|yes|YES)
                info "You chose 'yes'."
				TEST=true
                break
                ;;
            n|N|no|NO)
                warn "You chose 'no'."
                break
                ;;
            *)
                echo "Invalid input. Please enter 'y' or 'n'."
                ;;
        esac
    done
	'
	
	: '
	info "################################################################################"
	info "SSH Key"
	info "################################################################################"
	setup_github_ssh
	success "Finished setting up SSH Key"
    '

	info "################################################################################"
	info "Oh-my-zsh"
	info "################################################################################"
	#wait_input
	install_oh_my_zsh
	success "Finished installing Oh-my-zsh"

	info "################################################################################"
	info "Homebrew Packages"
	info "################################################################################"
	#wait_input
	install_packages
	#post_install_packages
	success "Finished installing Homebrew packages"

	info "################################################################################"
	info "Homebrew Fonts"
	info "################################################################################"
	#wait_input
	install_fonts
	success "Finished installing fonts"

	info "################################################################################"
	info "MacOS Apps"
	info "################################################################################"
	#wait_input
	install_macos_apps

	install_masApps
	success "Finished installing macOS apps"

	info "################################################################################"
	info "Configuration"
	info "################################################################################"
	#wait_input
	setup_osx
	success "Finished configuring MacOS defaults. NOTE: A restart is needed"
	#stow_dotfiles
	#success "Finished stowing dotfiles"

	info "################################################################################"
	info "Cloning dev repositories"
	info "################################################################################"
	#wait_input
	clone_dev_projects
	success "Finished cloning dev repositories"

	info "################################################################################"
	info "Cloning tool repositories"
	info "################################################################################"
	#wait_input
	clone_tool_projects
  	success "Cloned all tool repos - follow readme.md install steps"

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