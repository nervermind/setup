# Check for the --test flag
if [[ " $* " == *" --test "* ]]; then
  . ./inputs/apps.sh
  . ./scripts/utils.sh 
  info "Test mode running"
  TEST=true
  OS_VERSION=$(sw_vers -productVersion)
fi

install_masApps() {
    if version_ge "$OS_VERSION" "14.2"; then
    # Install mas apps
        if [[ ${#mas_apps[@]} -gt 0 ]]; then
            info "Installing App Store apps..."
            install_count=0
            skipped_count=0
            for app in "${mas_apps[@]}"; do
                if [ "$TEST" = true ]; then
                    info "Test mode: Skipping installation of App Store app $app"
                    ((skipped_count++))
                else
                    if mas list | grep "$app" >/dev/null; then
			            warn "MAS app $app is already installed"
                        ((skipped_count++))
                    else
                        mas install "$app"
                        ((install_count++))
                    fi
                fi
            done
        else
            info "No App Store apps to install."
        fi
    else
        warn "Skipping mas apps installation. macOS version is less than 14.2"
    fi

    info "Installed $install_count MAS apps."
    warn "Skipped $skipped_count MAS apps."
}

# Run the functions if the --test flag is set
if [ "$TEST" = true ]; then
  info "Testing Started"
  install_masApps
fi 