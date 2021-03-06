# Install OS
Download and install [Ubuntu Server LTS](https://ubuntu.com/download/server)
```bash
add-apt-repository universe
apt update && apt upgrade
timedatectl set-timezone Europe/Stockholm
systemctl mask systemd-networkd-wait-online.service
```

# Initial setup
```bash
apt install make gcc
cd ~
git clone https://github.com/Peglah/dotfiles.git
cp -r ~/dotfiles/.config ~/
cp ~/dotfiles/.bash_aliases ~/
cp ~/dotfiles/.bashrc ~/
cp ~/dotfiles/.xinitrc ~/
chmod +x ~/.xinitrc
```

## [Suckless](https://suckless.org/)
Dependencies:
```bash
apt install libx11-dev libxft-dev libxinerama-dev xinit
```

[feh](https://feh.finalrewind.org/) and [font-manager](https://github.com/FontManager/font-manager)
```bash
apt install feh font-manager unclutter-xfixes
```

Compile and install dwm, dmenu, st and slstatus
```bash
cd ~/dotfiles/suckless/dwm && make clean install
cd ~/dotfiles/suckless/dmenu && make clean install
cd ~/dotfiles/suckless/st && make clean install
cd ~/dotfiles/suckless/slstatus && make clean install
```

`reboot` and `startx`
```bash
font-manager -i ~/dotfiles/fonts/FiraMono/*
```

## [Remote desktop](http://xrdp.org/)
```bash
apt install xrdp
ln -s ~/.xinitrc ~/.xsession
```

## [Mosh](https://mosh.org/)
```bash
apt install mosh
```

## [Ignore laptop lid](https://askubuntu.com/questions/141866/keep-ubuntu-server-running-on-a-laptop-with-the-lid-closed)
```bash
sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=ignore/' /etc/systemd/logind.conf
service systemd-logind restart
```

## [Disable sleep](https://linux-tips.us/how-to-disable-sleep-and-hibernation-on-ubuntu-server/)
```bash
systemctl mask sleep.target
systemctl mask suspend.target
systemctl mask hibernate.target
systemctl mask hybrid-sleep.target
```

## [Touchpad tap-to-click](https://linux.die.net/man/1/synclient)
```bash
apt install xserver-xorg-input-synaptics
synclient MaxSpeed=1
synclient VertEdgeScroll=0
```

## Change Caps Lock and ESC
```bash
sed -i '0,/Caps_Lock/s//Escape/' /usr/share/X11/xkb/symbols/pc
sed -i '0,/Escape/s//Caps_Lock/' /usr/share/X11/xkb/symbols/pc
rm -rf /var/lib/xkb/*
reboot
```

## [Power management](https://pm-utils.freedesktop.org/wiki/)
```bash
apt install pm-utils
```

# Software setup
## Programs
### [fastfetch](https://github.com/LinusDierheimer/fastfetch)
Dependencies:
```bash
apt install cmake
```

Download, compile and install:
```bash
cd /tmp
git clone https://github.com/LinusDierheimer/fastfetch
cd fastfetch
mkdir -p build
cd build
cmake ..
cmake --build . --target fastfetch
cp fastfetch /usr/local/bin/
```

### [ly](https://github.com/fairyglade/ly)
Dependencies:
```bash
apt install build-essential libpam0g-dev libxcb-xkb-dev
```

Download, compile and install:
```bash
cd /tmp
git clone --recurse-submodules https://github.com/nullgemm/ly
cd ly
make
make run
make install
systemctl enable ly.service
systemctl disable getty@tty2.service
```

### [Ranger](https://github.com/ranger/ranger)
```bash
apt install ranger
```

[Ranger - Syntax for preview](https://unix.stackexchange.com/questions/435696/how-to-enable-syntax-highlighting-in-ranger-preview)
```bash
apt install highlight
```

[Ranger - Preview for video](https://github.com/ranger/ranger/wiki/Video-Previews)
```bash
apt install ffmpegthumbnailer
```

### [Mplayer](http://www.mplayerhq.hu/)
```bash
apt install mplayer
```

### [Neovim](https://neovim.io/)
```bash
cd /tmp
curl -L -O https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.deb
apt install ./nvim-linux64.deb
```

### Network Manager
```bash
apt install network-manager
```

### [a4term](https://a4term.com/)
https://github.com/martanne/dvtm/issues/10

### [btop++](https://github.com/aristocratos/btop)
```bash
apt install btop
```

### [bat](https://github.com/sharkdp/bat)
```bash
apt install bat
```

# **TODO**
music
Install ALSA
$ sudo apt-get install libasound2 libasound2-plugins alsa-utils alsa-oss

Install PulseAudio:
$ sudo apt-get install pulseaudio pulseaudio-utils

Set Group Memberships for PA:
$ sudo usermod -aG pulse,pulse-access <username>

Run the PulseaudioServer:
$ pulseaudio -D

Following command tells us if a sink is recognized by PulseAudio:
$ pacmd list-sinks

Remember sinkname for output below.
This command will play a sound file to a given sink:
$ pacmd play-file <filename> <sinkname>

We may need to unmute audio devices:
for ALSA: use alsamixer
for Pulseaudio: use pacmd set-sink-mute n 0 where n is the sink index (likely 0)
For further CLI commands see also the Pulse Audio Wiki
To configure Pulseaudio Server to our needs we may need to edit /etc/pulse/default.pa and /etc/pulse/daemon.conf that come with self-explanatory. notes.


apt install ncmpcpp mopidy mopidy-mpd mopidy-alsamixer
usermod -a -G audio peglah
make sure aplay can play
curl -O https://www.kozco.com/tech/piano2.wav
mkdir -p ~/.config/ncmpcpp/
cp /usr/share/doc/ncmpcpp/examples/config ~/.config/ncmpcpp/
echo http://fm02-ice.stream.khz.se/fm02_mp3 > ~/banditrock.m3u
sudo mv ~/banditrock.m3u /var/lib/mopidy/m3u/

sudo su
mopidyctl config >> /etc/mopidy/mopidy.conf
exit

fix viz
/etc/mopidy/mopidy.conf
output = tee name=t t. ! queue ! autoaudiosink t. ! queue ! audioresample ! audioconvert ! audio/x-raw,rate=44100,channels=2,format=S16LE ! wavenc ! filesink location=/tmp/mpd.fifo

systemctl enable mopidy
systemctl start mopidy

Keybindings
TODO SXHKD
