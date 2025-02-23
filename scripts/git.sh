
# For Dev Tests activate this lines and the one at the end of the file
. ./inputs/repos.sh
. ./scripts/utils.sh 

clone_dev_projects() {
  if [ ! -d ~/dev ]; then
    	mkdir -p ~/dev
    	success "Created ~/dev directory"
	else
    	info "~/dev directory already exists"
	fi
  cd ~/dev 

  cloned_count=0
  existed_count=0

  for repo in "${dev_repos[@]}"; do
    repo_name=$(basename "$repo" .git)
    if [ -d "$repo_name" ]; then
      warn "Repo $repo_name already exists"
      ((existed_count++))
    else
      info clone "$repo"
      ((cloned_count++))
    fi
  done

  info "Cloned $cloned_count dev repos."
  info "$existed_count dev repos already existed."

  cd
}

clone_tool_projects() {
  if [ ! -d ~/tools ]; then
    	mkdir -p ~/tools
    	success "Created ~/tools directory"
	else
    	info "~/tools directory already exists"
	fi
  cd ~/tools

  cloned_count=0
  existed_count=0

  for repo in "${tool_repos[@]}"; do
    repo_name=$(basename "$repo" .git)
    if [ -d "$repo_name" ]; then
      warn "Repo $repo_name already exists"
      ((existed_count++))
    else
      git clone "$repo"
      ((cloned_count++))
    fi
  done

  info "Cloned $cloned_count dev repos."
  info "$existed_count dev repos already existed."

  cd
}

# Uncomment the following lines to test the functions
 clone_dev_projects
 clone_tool_projects