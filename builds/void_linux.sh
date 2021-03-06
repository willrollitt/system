# Development
xbps-install -Sy gcc base-devel pkgconfig pkgconf libX11-devel libXft-devel libXinermama-devel ncurses-devel libinput-devel wlroots-devel

# X11/Wayland window managers
xbps-install -Sy xorg-minimal i3 sway elogind i3status mesa-dri

# X11 Programs
xbps-install -Sy setxkbmap xrdb xdotool nitrogen rxvt-unicode xsel scrot feh connman-gtk xrandr arandr 

# Fonts
xbps-install -Sy terminus-font tff-ubuntu-font-family

# Virtual machine
xbps-install -Sy qemu kvm virt-manager 

# Web browsers
xbps-install -Sy firefox icecat elinks lynx tor torbrowser-launcher

# Internet
xbps-install -Sy mutt connman connman-ncurses onionshare torsocks dbus wicd

# Audio
xbps-install -Sy pulseaudio ncpamixer

# System tools
xbps-install -Sy sudo tmux git wget make zsh bash tty-clock acpi

# Vi/Vim like programs
xbps-install -Sy vim vifm vimpc vimiv vimb hexer cointop neovim

# Misc
xbps-install -Sy neofetch dialog tig

# Games
xbps-install -Sy ltris

# Enable things at boot
ln -s /etc/sv/dbus /var/service
ln -s /etc/sv/connmand /var/service
ln -s /etc/sv/libvirtd /var/service

# Folders
HOME = /home/will

mv config .config
cp -r .config $HOME/
mv fonts .fonts
cp -r .fonts $HOME/
mv local .local
cp -r .local $HOME/
mv vim .vim
cp -r .vim $HOME/
cp .zshrc $HOME/ && cp .bashrc $HOME/
cp .tmux.conf $HOME/
cp .vimrc $HOME/
cp .Xresources $HOME/
cp .xinitrc $HOME/
cp .i3status.conf $HOME/
cp XTerm $HOME/

# My home folder structure
mkdir -p $HOME/Documents
mkdir -p $HOME/Downloads
mkdir -p $HOME/Programs
mkdir -p $HOME/Games
mkdir -p $HOME/Videos
mkdir -p $HOME/Music
mkdir -p $HOME/Crypto
mkdir -p $HOME/Iso
mkdir -p $HOME/Pictures

# Vi/Vim like htop
git clone https://github.com/KoffeinFlummi/htop-vim.git
./autogen.sh && ./configure && make 
