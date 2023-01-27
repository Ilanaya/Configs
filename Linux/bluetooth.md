Workflow:
1. `bluetoothctl`
2. `scan on
3. trust/pair *device MAC address*
4. connect *device MAC address*
   In case of some weird errors try `remove *device MAC address*`, `connect *device MAC address*`
   `sudo systemctl restart bluetooth.service`