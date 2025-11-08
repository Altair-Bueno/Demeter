ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SHELL     = ${ROOT_DIR}/sysupgrade.runner

export DEBUG =
export HOMEBREW_COLOR ?= always
export COLOR ?= always


brew-update: export SYSUPGRADE_STEP_NAME:=brew-update
brew-update:
	@brew update


brew-packages: export SYSUPGRADE_STEP_NAME:=brew-packages
brew-packages : brew-update
	@brew upgrade


brew-casks: export SYSUPGRADE_STEP_NAME:=brew-casks
brew-casks: brew-update
	@brew upgrade --casks --greedy

brew: export SYSUPGRADE_STEP_NAME:=brew
brew: brew-casks brew-packages
	@brew cleanup
	@brew bundle dump --global -f

.PHONY: brew brew-packages brew-casks brew-update

arch-yay: export SYSUPGRADE_STEP_NAME:=arch-yay
arch-yay:
	@yay

arch: export SYSUPGRADE_STEP_NAME:=arch
arch: arch-yay

.PHONY: arch arch-yay

# This target may fail if rustup is installed via a package manager
rustup-self: export SYSUPGRADE_STEP_NAME:=rustup-self
rustup-self:
	-@rustup self update

rust-release-stable: export SYSUPGRADE_STEP_NAME:=rust-release-stable
rust-release-stable: rustup-self
	@rustup update stable

cargo-packages: export SYSUPGRADE_STEP_NAME:=cargo-packages
cargo-packages: rust-release-stable
	@cargo install-update -a

rust: export SYSUPGRADE_STEP_NAME:=rust
rust: rustup-self rust-release-stable cargo-packages

.PHONY: rust rustup-self rust-release-stable cargo-packages

uv-packages: export SYSUPGRADE_STEP_NAME:=uv-packages
uv-packages:
	@uv tool upgrade --all

python: export SYSUPGRADE_STEP_NAME:=python
python: uv-packages

.PHONY: python uv-packages

pnpm-packages: export SYSUPGRADE_STEP_NAME:=pnpm-packages
pnpm-packages:
	@pnpm update -g

node: export SYSUPGRADE_STEP_NAME:=node
node: pnpm-packages

.PHONY: node pnpm-packages

flatpack-packages: export SYSUPGRADE_STEP_NAME:=flatpack-packages
flatpack-packages:
	@flatpak update -y

flatpack: export SYSUPGRADE_STEP_NAME:=flatpack
flatpack: flatpack-packages

.PHONY: flatpack flatpack-packages

sysconfig-submodules: export SYSUPGRADE_STEP_NAME:=sysconfig-submodules
sysconfig-submodules:
	@git -C "${DEMETER}" submodule foreach --recursive git fetch --quiet origin
	@git -C "${DEMETER}" submodule foreach --recursive git checkout --quiet FETCH_HEAD

sysconfig: export SYSUPGRADE_STEP_NAME:=sysconfig
sysconfig: sysconfig-submodules

.PHONY: sysconfig sysconfig-submodules
