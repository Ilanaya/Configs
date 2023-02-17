* Enable natural scrolling and tap to click:

`/usr/share/X11/xorg.conf.d/40-libinput.conf` -> 

```bash
Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "NaturalScrolling" "True"
        Option "Tapping" "on"
EndSection
```

* The layout is switched by pressing right alt 
* For correct `i3status` display install font-awesome icons

* Easy remap desired keys with xmodmap:
```bash
$ xmodmap -pke | grep TouchpadToggle
keycode 199 = XF86TouchpadToggle NoSymbol XF86TouchpadToggle
$ xmodmap -pke | grep F5
keycode  71 = F5 F5 F5 F5 F5 F5 XF86Switch_VT_5
$ xmodmap -e "keycode 71 = XF86TouchpadToggle"
```