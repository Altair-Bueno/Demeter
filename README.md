# Demeter

Demeter is a backup git repository that contains config files on my current
macOS enviroment. Althought all files were created using macOS commandline
utilities, they should work fine with any standard UNIX-like system that uses
`zsh` as it's default shell.

# Restore

So you fucked it up. Now what? No problemo, i've got you covered:

- Install `zsh`

```zsh
# Check the `Linux` section before doing anything
curl "https://raw.githubusercontent.com/Altair-Bueno/Demeter/master/restore.sh" | zsh
```

## Linux

Run these additional instructions **before** running the script above if your
system runs linux

1. Set up `zsh` as the default shell
2. Install all the software listed on `brew_packages.txt`
3. Set up GitHub access token on git using the OS `credential store`. Here are
   instructions for
   [Linux](https://stackoverflow.com/questions/5343068/is-there-a-way-to-cache-https-credentials-for-pushing-commits/18362082#18362082)

# Colorscheme

I'm currently using One Dark. You can find it for:

- [Visual Studio Code](https://github.com/one-dark/vscode-one-dark-theme)
- [iTerm2](https://github.com/one-dark/iterm-one-dark-theme)
- [JetBrains' IDEs](https://github.com/one-dark/jetbrains-one-dark-theme)

# Font

- [Jetbrains Mono](https://www.jetbrains.com/es-es/lp/mono/) for text editors
- [Jetbrains Mono Nerd Fonts](https://www.nerdfonts.com/font-downloads) for the
  console (size 15)

# macOS config

- [Align to grid Finder](https://apple.stackexchange.com/questions/50508/how-can-i-make-all-folders-in-finder-snap-to-grid)
- Set iterm2 configuration folder to `$HOME/Demeter/iterm2`
- [Natural text editing on iTerm2](https://medium.com/@Clovis_app/configuration-of-a-beautiful-efficient-terminal-and-prompt-on-osx-in-7-minutes-827c29391961):
  iTerm → Preferences → Profiles → Keys → Load Preset… → Natural Text Editing

# Other config

- Terminal size: `100x30`

# If you want your own backup system

Check out the [wiki](https://github.com/Altair-Bueno/Demeter/wiki) to learn how
to do a dotfiles backup

# License

- [Scrips](scripts/) are licensed under the MIT license
- [restore.sh](restore.sh) is licensed under the MIT license
- [database icon](Icon?) licensed under MIT by
  [VigoKrumins](https://github.com/VigoKrumins/folder-icons/)
- Other files under the [backup folder](backup/) have different licenses and
  belong to their respective owners
