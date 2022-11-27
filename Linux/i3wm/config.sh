# i3 config file (v4)
#
# Please see https://i3wm.org/docs/userguide.html for a complete reference!

set $mod Mod4
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

#Font for window titles.
font pango:Hack Nerd Font Regular 14
#Colors
set $back               #282C34
set $primary            #ABB2BF
set $secondary          #0FE0C9
set $black              #282A2E
set $grey               #3E4452
set $white              #C5C8C6

# class                 border   backgr.  text    indicator child_border
client.focused          #3E4452  #3E4452  $white  #2e9ef4   #3E4452
client.focused_inactive $back    $back    $white  #484e50   $back
client.unfocused        $back    $back    $grey   #292d2e   $back
client.urgent           $back    #900000  $white  #900000   #900000
client.placeholder      $back    #0c0c0c  $white  #000000   #0c0c0c
client.background       $back

# thin borders
hide_edge_borders both

# i3-gaps stuff
for_window [class=".*"] border pixel 2
workspace $ws3 gaps inner 10
smart_borders on
new_window none

#edit gaps mode
#########################################################################
set $mode_gaps Gaps: (o) outer, (i) inner
set $mode_gaps_outer Outer Gaps: +|-|0 (local), Shift + +|-|0 (global)
set $mode_gaps_inner Inner Gaps: +|-|0 (local), Shift + +|-|0 (global)
bindsym $mod+Shift+g mode "$mode_gaps"
mode "$mode_gaps" {
        bindsym o      mode "$mode_gaps_outer"
        bindsym i      mode "$mode_gaps_inner"
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

mode "$mode_gaps_inner" {
        bindsym plus  gaps inner current plus 5
        bindsym minus gaps inner current minus 5
        bindsym 0     gaps inner current set 0

        bindsym Shift+plus  gaps inner all plus 5
        bindsym Shift+minus gaps inner all minus 5
        bindsym Shift+0     gaps inner all set 0

        bindsym Return mode "default"
        bindsym Escape mode "default"
}
mode "$mode_gaps_outer" {
        bindsym plus  gaps outer current plus 5
        bindsym minus gaps outer current minus 5
        bindsym 0     gaps outer current set 0

        bindsym Shift+plus  gaps outer all plus 5
        bindsym Shift+minus gaps outer all minus 5
        bindsym Shift+0     gaps outer all set 0

        bindsym Return mode "default"
        bindsym Escape mode "default"
}
##########################################################################


exec --no-startup-id dex-autostart --autostart --environment i3

# ru/en layout
# toggle with right alt
exec --no-startup-id setxkbmap -model pc105 -layout us,ru -option grp:toggle
exec --no-startup-id nm-applet

exec --no-startup-id google-chrome
exec --no-startup-id code
exec --no-startup-id alacritty
exec --no-startup-id alacritty

# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod


# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        status_command i3status
}


######################################
# keybindings for different actions: #
######################################

# switch/iterate between workspaces
bindsym $mod+Tab workspace next
bindsym $mod+Shift+Tab workspace prev

# start a terminal
bindsym $mod+Return exec alacritty

# kill focused window
bindsym $mod+q kill
#######################################
# rofi
#######################################
# start rofi (window switcher)
bindsym $mod+Shift+d exec --no-startup-id rofi -monitor -1 -show window
# A more modern dmenu replacement is rofi:
bindcode $mod+40 exec "rofi -modi drun,run -show drun"
# keybinding in fancy rofi (automated):
bindsym $mod+F1 exec ~/.config/i3/scripts/keyhint.sh

####################################################
# Backlight control
bindsym XF86MonBrightnessUp exec brightnessctl set +10% && notify-send "Brightness - $(brightnessctl | cut -d '.' -f 1)%"
bindsym XF86MonBrightnessDown exec brightnessctl set 10%- && notify-send "Brightness - $(brightnessctl get / brightnessctl max)%"

bindsym XF86TouchpadToggle exec '~/.config/i3/scripts/toggle_touchpad.sh'
bindsym Print exec scrot -e 'mv $f ~/Pictures/Screenshots/'

# change focus
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+i focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+i move up
bindsym $mod+Shift+l move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child


# switch to workspace
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9
bindsym $mod+Shift+0 move container to workspace number $ws10

# lock screen
bindsym $mod+Shift+Escape exec betterlockscreen -l
# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-msg exit"
# launch telegram
bindsym $mod+Shift+t exec Telegram
# lock screen (supresses empty password attempts)
# bindsym $mod+Shift+Escape exec "loginctl lock-session"
# lauch rofi-pass
bindsym $mod+Shift+p exec rofi-pass
#---------------------------#
#### Workspace behaviour ####
#---------------------------#

# use workspaces on different displays:
# where you have to replace VGA-0/HDMI-0 with the names for your displays
# you can get from xrandr command
#workspace $ws1 output VGA-0
#workspace $ws2 output VGA-0
#workspace $ws3 output HDMI-0
#workspace $ws4 output HDMI-0
#workspace $ws5 output HDMI-0

assign [class="Google-chrome"] $ws1
assign [class="Code"] $ws2
assign [class="Alacritty"] $ws3
assign [class="TelegramDesktop"] $ws5
assign [class="TrueConf"] $ws6

for_window [workspace=$ws2] layout tabbed
for_window [workspace=$ws1] layout tabbed
