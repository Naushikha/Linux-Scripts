# Configure Bash
- Enable history search: 
```
echo -e '"\e[A": history-search-backward\n"\e[B": history-search-forward' >> ~/.inputrc
```

# Configure Gnome Shortcuts
```
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control><Super>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control><Super>Right']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Control><Shift><Super>Left']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Control><Shift><Super>Right']"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"
gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Shift><Super>s']"
```

# Install Google Chrome
```
https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
```

# Install Gnome Extensions
```
sudo apt install gnome-tweaks
sudo apt install gnome-shell-extension-manager
```
## Essential Extensions
- **Top Bar Organizer @julian** : change placement of extensions
- **TopHat  @fflewddur**: system stat monitoring
- **Freon @ushakov** : temp monitoring
- **Quick Close in Overview @paolo** : middle click close
- **Adjust Display Brightness @bruno** : ddc/ci controls
- **WinTile @nowsci** : MS windows like tiling

# Mod WinTile Extension
```
gedit /home/naush/.local/share/gnome-shell/extensions/wintile@nowsci.com/extension.js
```
- Look for "changeBinding(mutterKeybindingSettings" > 
"toggle-tiled-left" and "toggle-tiled-right".
- Change secondary shortcut to "\<Control>\<Alt>\<Shift>\<Super>Left & Right"

# Install TLP
```
sudo apt install tlp tlp-rdw
sudo systemctl enable tlp.service
sudo tlp start
```

# Install Development Tools
```
sudo apt install git
git config --global user.name Naushikha
git config --global user.email dev@naushikha.com
```
- Setup SSH key with GitHub
```
https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
```
# Install Necessary Tools
## Wayland Gamma Correction Tool
```
git clone https://github.com/zb3/gnome-gamma-tool
```
## Blueman for Bluetooth Management
```
sudo apt install blueman
```

