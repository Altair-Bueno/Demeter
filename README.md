# Demeter

Demeter is a backup git repository that contains the config files of my macOS
and Linux environments. `backup/` is symlinked into `$HOME`, so `~/.config`
lives inside this repository; `backup/.config/.gitignore` is an allowlist of
the configs worth tracking.

## Requisites

- Linux:
  - Install `zsh` and set it up as the default shell (`man chsh`)
  - Install curl
  - Set up a valid `secretservice` such as
    [Gnome Keyring`](https://wiki.archlinux.org/title/GNOME/Keyring)
- macOS: xcode tools will be automatically installed. No need to do anything
  other than upgrading the system.

## Restore

```zsh
curl "https://raw.githubusercontent.com/Altair-Bueno/Demeter/master/restore.sh" | zsh
```

## macOS additional config

- [Align to grid Finder](https://apple.stackexchange.com/questions/50508/how-can-i-make-all-folders-in-finder-snap-to-grid)
- Set iterm2 configuration folder to `$HOME/Demeter/iterm2`

## If you want your own backup system

Check out the [wiki](https://github.com/Altair-Bueno/Demeter/wiki) to learn how
to do a dotfiles backup

## License

- [Scrips](scripts/) are licensed under the MIT license
- [restore.sh](restore.sh) is licensed under the MIT license
- [database icon](Icon?) licensed under MIT by
  [VigoKrumins](https://github.com/VigoKrumins/folder-icons/)
- Other files under the [backup folder](backup/) have different licenses and
  belong to their respective owners
