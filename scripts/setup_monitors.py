#!/usr/bin/python3
import subprocess

xrandr_cmd = "/usr/bin/xrandr --output eDP-1 --off --output DP-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --primary --mode 1920x1080 --pos 0x0 --rotate normal"
feh_cmd = "feh --bg-fill /home/alex/git/dotfiles/background.jpg"

xrandr_out = subprocess.check_output("xrandr", shell=True)
xrandr_output = xrandr_out.decode().strip()

dp_connected = "DP-1 connected" in xrandr_output
hdmi_connected = "HDMI-2 connected" in xrandr_output

if dp_connected and hdmi_connected:
    # work setup : both external monitors connected
    
    # adjust monitor output
    subprocess.check_output(xrandr_cmd, shell=True)
    
    # adjust background
    subprocess.check_output(feh_cmd, shell=True)


