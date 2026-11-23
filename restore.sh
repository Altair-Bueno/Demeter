#!/bin/zsh

###############################################################################
# Altair Bueno MIT license                                                    #
# https://github.com/Altair-Bueno/Demeter                                     #
#                                                                             #
# Clones Demeter and symlinks its configs into $HOME on macOS and Linux.      #
###############################################################################

###############################################################################
# Settings
###############################################################################
set -ex
# Remote VCS
export REMOTE_URL="${REMOTE_URL:-https://github.com/Altair-Bueno/Demeter}"
# Where is the backup folder. VSC folder name and system folder must match
export DEMETER="$HOME/Demeter"
required_paths=( "$HOME/.cache/zsh/" )

###############################################################################
# Functions
function preamble {
	for p in $required_paths
	do
		mkdir -p "$p"
	done
}

function clone_demeter_repository {
	# Restoring backup
	if [[ -d "$DEMETER" ]]
	then
		: "Found already existing Demeter folder ($DEMETER)"
		if [[ $(git -C "$DEMETER" config --get remote.origin.url) == "$REMOTE_URL" ]]
		then
			echo "Updating backup..."
			git -C "$DEMETER" pull
			git -C "$DEMETER" submodule update --init --recursive
		else 
			: "This script expected a different remote server, exiting..."
			exit 1
		fi
	else 
		: "Found no backup on $DEMETER. Cloning from remote"
		git -C "$(dirname "$DEMETER")" clone "$REMOTE_URL"
	fi
}

function link_backup {
	: "Linking backup"
	for TEMP in $DEMETER/backup/*(D)
	do
		ln -nfs "$TEMP" "$HOME/"
	done
}

function setup_macos() {
  : Install xcode commandline tools
  xcode-select --install || true

  : Link macos config
  rm "$HOME/.gitconfig" || true
  ln -nfs "$DEMETER/macOS/.gitconfig" "$HOME/.gitconfig"

  : Installing HomeBrew and software "https://github.com/Homebrew/install/#install-homebrew-on-macos-or-linux"
  export NONINTERACTIVE=1
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew bundle install --global
}

function setup_linux {
    # Linux specific config
	rm "$HOME/.gitconfig" || true
	ln -nfs "$DEMETER/linux/.gitconfig" "$HOME/.gitconfig"
}

###############################################################################
# Script
preamble
clone_demeter_repository
link_backup

case $(uname) in
  'Darwin')
    setup_macos
    ;;
  'Linux')
    setup_linux
    ;;
esac

