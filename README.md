# Demeter

Demeter is a backup git repository that contains config files on my current
macOS enviroment. Althought all files were created using macOS commandline
utilities, they should work fine with any standard UNIX-like system that uses
`zsh` as it's default shell.

# Restore

So you fucked it up. Now what? No problemo, i've got you covered:

1. Run this:

```bash
curl "https://raw.githubusercontent.com/Altair-Bueno/Demeter/master/restore.sh" | bash
```

2. Install brew packages
3. Set up `zsh` as the default shell
4. Set up GitHub access token on git using the OS `credential store`. Here are
   instructions for
   [macOS](https://gist.github.com/nepsilon/0fd0c779f76d7172f12477ba9d71bb66)
   and
   [Linux](https://stackoverflow.com/questions/5343068/is-there-a-way-to-cache-https-credentials-for-pushing-commits/18362082#18362082)

# Installed packages

[Homebrew (macOS)](brew_packages.txt)
# omz

First install [omz](https://ohmyz.sh/)

## External plugins

- [zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete)
- [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting) 

## Theme

I'm using [powerlevel10k](https://github.com/romkatv/powerlevel10k). The, 
[p10k](backup/.p10k.zsh) script is already on this backup, so just install the
theme after running the restore script

# Colorscheme

I'm currently using One Dark. You can find it for:

- [Visual Studio Code](https://github.com/one-dark/vscode-one-dark-theme)
- [iTerm2](https://github.com/one-dark/iterm-one-dark-theme)
- [JetBrains' IDEs](https://github.com/one-dark/jetbrains-one-dark-theme)
- [nvim](https://github.com/navarasu/onedark.nvim)

# Font

- [Jetbrains Mono](https://www.jetbrains.com/es-es/lp/mono/) for text editors
- [Jetbrains Mono Nerd Fonts](https://www.nerdfonts.com/font-downloads) for the
  console (size 15)

# macOS config

- [Align to grid Finder](https://apple.stackexchange.com/questions/50508/how-can-i-make-all-folders-in-finder-snap-to-grid)
- Set iterm2 configuration folder to `"$HOME/Demeter/iterm2"`

# LaTex & pandoc

- [Theme](https://github.com/Wandmalfarbe/pandoc-latex-template)
- [Mermaid filter](https://github.com/raghur/mermaid-filter)

# Other config

- Terminal size: `100x30`
- [Natural text editing on iTerm2](https://medium.com/@Clovis_app/configuration-of-a-beautiful-efficient-terminal-and-prompt-on-osx-in-7-minutes-827c29391961):
  iTerm → Preferences → Profiles → Keys → Load Preset… → Natural Text Editing

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
