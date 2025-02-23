#!/usr/bin/env bash

################
### Logging Colors
################

reset_color=$(tput sgr 0)

info() {
	printf "%s[*] %s%s\n" "$(tput setaf 4)" "$1" "$reset_color"
}

success() {
	printf "%s[*] %s%s\n" "$(tput setaf 2)" "$1" "$reset_color"
}

err() {
	printf "%s[*] %s%s\n" "$(tput setaf 1)" "$1" "$reset_color"
}

warn() {
	printf "%s[*] %s%s\n" "$(tput setaf 3)" "$1" "$reset_color"
}

############
### Functions
############

version_ge() {
    # Returns 0 (true) if $1 >= $2, else 1 (false)
    [ "$(printf '%s\n' "$2" "$1" | sort -V | head -n1)" = "$2" ]
}