xrandr --output DP-1 --rate 144 --mode 1920x1080 --right-of HDMI-1
xrandr --output HDMI-1 --rate 144 --mode 1920x1080

xset r rate 120 30

killall dwmblocks ; dwmblocks &
killall volumeicon ; volumeicon &
killall flameshot ; flameshot &
killall polkit-gnome-authentication-agent-1 ; /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
killall dunst ; dunst &
killall xrootgif ; xrootgif /home/rxn/pics/wallpapers/lake.gif &
killall xcompmgr ; xcompmgr &
killall volumeicon ; volumeicon &
