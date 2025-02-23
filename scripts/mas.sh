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
            for app in "${mas_apps[@]}"; do
                if [ "$TEST" = true ]; then
                    info "Test mode: Skipping installation of App Store app $app"
                else
                    mas install "$app"
                fi
            done
        else
            info "No App Store apps to install."
        fi
    else
        warn "Skipping mas apps installation. macOS version is less than 14.2"
    fi
}

# Run the functions if the --test flag is set
if [ "$TEST" = true ]; then
  info "Testing Started"
  install_masApps
fi 