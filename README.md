<h1 align="center">Welcome to Evan's dotfiles 👋</h1>
💻 neovim, fish, tmux, git, homebrew, neovim - my whole world

![Image](https://user-images.githubusercontent.com/39482599/168496790-cd12b404-9c22-4d21-9b34-a04da5b380b6.png)

## Initial Setup and Installation

### Backup

1. dump brew and mas packages

```bash
brew bundle dump --describe --file=~/Backup/Brewfile
```

2. dump NPM packages

```bash
npm list --global --parseable --depth=0 | sed '1d' | awk '{gsub(/\/.*\//,"",$1); print}' > ~/Backup/Npmfile
```

3. dump pip packages

```bash
pip freeze > ~/backup/Pipfile
```

4. dump cargo packages

```bash
cargo install --list | grep -v '    ' | sed 's/ .*://' >> ~/Backup/Cargofile
```

5. dump fish plugins

```bash
cp ~/.config/fish/fish_plugins ~/Backup/FISHFILE
```

### Installation

1. install brew and mas packages

```bash
brew bundle install --file=~/Backup/Brewfile
```

2. install NPM packages

```bash
xargs npm install --global < ~/Backup/Npmfile
```

3. install pip packages

```bash
pip install -r ~/Backup/Pipfile
```

4. install cargo packages

```bash
xargs cargo install < ~/Backup/Cargofile
```

5. install TPM(tmux) packages

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

~/.tmux/plugins/tpm/bin/install_plugins
```

6. install packer(Neovim) packages

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim -c 'PackerSync'
```

### Update

```
./update.sh
```

## Local Settings

### Fish Setup

Check out [config.fish](.config/fish/config.fish) with awesome aliaes and functions.
Currently, I use [starship](https://starship.rs) as my shell prompt, here is my [config](.config/starship/config.toml).

### Neovim Setup

|                         | Vim        | Neovim                    |
| ----------------------- | ---------- | ------------------------- |
| Main Configuration File | `~/.vimrc` | `~/.config/nvim/init.lua` |
| Configuration directory | `~/.vim`   | `~/.config/nvim`          |

### Tmux Setup

Tmux is configured in [~/.tmux.conf](.tmux.conf).

### Color scheme

Everything is [Dracula](https://draculatheme.com)!

## Fonts

I am currently using [JetBrains Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono) as my default font, which also includes Nerd Font for special effect.

## Author

👤 **Evan**

- Website: medium.com/navepnow
- Twitter: [@NavePnow](https://twitter.com/NavePnow)
- GitHub: [@NavePnow](https://github.com/NavePnow)

## Show your support

Give a ⭐️ if this project helped you!

<a href="https://www.patreon.com/NavePnow">
  <img src="https://c5.patreon.com/external/logo/become_a_patron_button@2x.png" width="160">
</a>

