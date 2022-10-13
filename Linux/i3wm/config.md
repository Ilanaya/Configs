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


