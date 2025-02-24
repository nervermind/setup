# Check for the --test flag
if [[ " $* " == *" --test "* ]]; then
  . ./inputs/apps.sh
  . ./scripts/utils.sh 
  info "Test mode running"
  TEST=true
fi

install_oh_my_zsh() {
  if [[ ! -f ~/.zshrc ]]; then
    info "Installing oh my zsh..."
    if [ "$TEST" = true ]; then
      echo "Test mode: Skipping oh-my-zsh installation"
    else
      'ZSH=~/.oh-my-zsh' ZSH_DISABLE_COMPFIX=true sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
      chmod 744 ~/.oh-my-zsh/oh-my-zsh.sh
      #info "Installing powerlevel10k"
      #git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
    fi
  else
    warn "oh-my-zsh already installed"
  fi
}

# Run the functions if the --test flag is set
if [ "$TEST" = true ]; then
  info "Testing Started"
  install_oh_my_zsh
fi 