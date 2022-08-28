[keyd](https://github.com/rvaiya/keyd) - key remapping tool which supports both Wayland and X server 

1. Install keyd
2. Put `keyd.config` in `/etc/keyd/default.conf`

If error occur, try:
1. `sudo systemctl status keyd`

if status isn't `active`:
1. `sudo systemctl enable keyd`
1. `sudo systemctl start keyd`
