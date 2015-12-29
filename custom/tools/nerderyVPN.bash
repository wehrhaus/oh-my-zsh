#!/usr/bin/env osascript

function vpnup {
/usr/bin/env osascript <<-EOF
    tell application "System Events"
        tell current location of network preferences
            set VPNservice to service "Nerdery" -- name of the VPN service
            if exists VPNservice then
                if current configuration of VPNservice is not connected then
                    connect VPNservice
                end if
            end if
        end tell
    end tell
EOF
}

function vpndown {
/usr/bin/env osascript <<-EOF
    tell application "System Events"
        tell current location of network preferences
            set VPNservice to service "Nerdery" -- name of the VPN service
            if exists VPNservice then
                if current configuration of VPNservice is connected then
                    disconnect VPNservice
                end if
            end if
        end tell
    end tell
EOF
}