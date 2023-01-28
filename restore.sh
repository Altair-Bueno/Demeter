#!/bin/zsh

###############################################################################
# Restore 1.0                                                                 #
# Altair Bueno MIT license                                                    #
# https://github.com/Altair-Bueno/Demeter                                     #
#                                                                             #
# This script will only setup the symlinks required for commandline utilities #
# such as vim, git or zsh. For some utilities, you may need some extra        #
# configuration, specially if the target system is not macOS (eg: setting zsh #
# as the default shell)                                                       #
#                                                                             #
# To see the full list of installed utilities, see [README.md](README.md)     #
###############################################################################

###############################################################################
# Settings
###############################################################################
set -ex
# Remote VCS
export REMOTE_URL="${REMOTE_URL:-https://github.com/Altair-Bueno/Demeter}"
# Where is the backup folder. VSC folder name and system folder must match
export DEMETER="$HOME/Demeter"
###############################################################################

function preamble {
	required_paths=( "$HOME/.cache/zsh/" )

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
		# Delete the file before making the symlink, just in case
		rm "$HOME/$TEMP" 2> /dev/null || true
		ln -nfs "$TEMP" "$HOME/"
	done
}

function setup_macos() {
  : Install xcode commandline tools
  xcode-select --install || true

  : Installing HomeBrew and software "https://github.com/Homebrew/install/#install-homebrew-on-macos-or-linux"
  export NONINTERACTIVE=1
  command -v brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
  cat "$DEMETER/brew_packages.txt" | xargs brew install

  : Link macos config
  rm "$HOME/.gitconfig" 2> /dev/null
  ln -nfs "$DEMETER/macOS/.gitconfig" "$HOME/.gitconfig"

  : Setting up git credential helper "https://gist.github.com/nepsilon/0fd0c779f76d7172f12477ba9d71bb66"
  git config --global credential.helper osxkeychain
}

preamble
clone_demeter_repository
link_backup

if [[ $(uname) == 'Darwin' ]]
then
	setup_macos
elif [[ $(uname) == 'Linux' ]]
then
    # Linux specific config
	rm "$HOME/.gitconfig"
	ln -nfs "$DEMETER/linux/.gitconfig" "$HOME/.gitconfig"
	
elif [[ $(uname) == 'FreeBSD' ]]
then
    # FreeBSD specific config
	rm "$HOME/.gitconfig"
	ln -nfs "$DEMETER/bsd/.gitconfig" "$HOME/.gitconfig"
fi
