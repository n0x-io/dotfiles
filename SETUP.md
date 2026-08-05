# Setup after pulling (Arch)

Everything needed to bring the Cursor Dark theme up on a machine that has just
pulled these changes.

## 1. Packages

```sh
sudo pacman -S --needed papirus-icon-theme ttf-nerd-fonts-symbols-mono
```

| Package | Why |
| --- | --- |
| `papirus-icon-theme` | rofi, dunst and the GTK configs all reference `Papirus-Dark` |
| `ttf-nerd-fonts-symbols-mono` | the tmux status bar uses powerline separators (U+E0B0–E0B3), and `kitty.conf` maps that range to `Symbols Nerd Font Mono` |

Not in the repos: **Berkeley Mono** (`kitty.conf`) and **Hack JBM Ligatured**
(waybar, rofi, hyprlock) are installed by hand.

## 2. Deploy

```sh
cd ~/.dotfiles
stow fish kitty tmux nvim hypr waybar rofi dunst gtktheme
```

> The README suggests `stow *`, which now also picks up `SETUP.md`.
> Use `stow */` or an explicit list.

## 3. Reload

```sh
# fish  - close every running fish session BEFORE pulling (see notes)
exec fish

# tmux  - plugins now bootstrap themselves, no prefix+I needed
tmux kill-server && tmux

# nvim  - installs vscode.nvim, drops everforest
nvim --headless "+Lazy! sync" +qa

# desktop
hyprctl reload
killall -SIGUSR2 waybar
killall dunst              # respawns via dbus
```

kitty: `ctrl+shift+F5` to reload, or restart it. rofi has no daemon.

## 4. GTK theme

The configs are set to `Orchis-Dark-Compact` (Material Design, accent `#1A73E8`).

```sh
sudo pacman -S orchis-theme xdg-desktop-portal-gtk
```

libadwaita ignores `gtk-theme-name`, so GTK4 apps also need the portal settings
and Orchis' own GTK4 stylesheet linked in:

```sh
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface icon-theme   'Papirus-Dark'
gsettings set org.gnome.desktop.interface gtk-theme    'Orchis-Dark-Compact'

mkdir -p ~/.config/gtk-4.0
ln -sf /usr/share/themes/Orchis-Dark-Compact/gtk-4.0/gtk.css ~/.config/gtk-4.0/gtk.css
ln -sf /usr/share/themes/Orchis-Dark-Compact/gtk-4.0/assets  ~/.config/gtk-4.0/assets
```

### Window buttons

Both `settings.ini` files set `gtk-decoration-layout=close,minimize,maximize:`
— everything left of the `:` sits on the **left**, which is macOS placement and
order. That is client-side decoration, so it is all Hyprland apps use.

Orchis' `--tweaks macos` is **not** useful here: it only replaces `xfwm4` and
`metacity-1` assets (Xfce / Marco window managers) and touches no GTK CSS, so it
would change nothing under Hyprland — and it requires building from source,
giving up the packaged theme. Circular red/yellow/green buttons are not
available from Orchis for GTK client-side decorations.

## Notes

- **fish universal variables.** The colours live in `fish/.config/fish/fish_variables`,
  which fish rewrites from memory whenever any universal variable changes. Close
  running fish sessions before pulling so an old session can't write the previous
  palette back over it.
- **`cat` is broken on Arch.** `config.fish` defines `cat` as `batcat …`, which is
  the Debian binary name. Arch's `bat` package installs `/usr/bin/bat`. Either
  `sudo pacman -S bat` and rename the call, or add an alias.
- **nwg-look overwrites GTK config.** It regenerates `.gtkrc-2.0` and the
  `settings.ini` files. Run it *before* editing these by hand, or re-apply after.
- **`gtktheme/.gtkrc-2.0` line 4** includes `/home/n0x/.gtkrc-2.0.mine`, a stale
  path from a previous username. Harmless, but dead.
- **`~/.tmux/plugins/nord-tmux`** is no longer used or tracked. Safe to delete.
