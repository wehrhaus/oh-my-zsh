#!/usr/bin/env osascript

function dunamiup {
/usr/bin/env osascript <<-EOF
  # tell application "SonicWall Mobile Connect"
	#  open location "mobileconnect://connect/?name=Dunami"
  # end tell
  tell application "Tunnelblick"
    disconnect all
    connect "justin.wehrman"
    get state of first configuration where name = "justin.wehrman"
    repeat until result = "CONNECTED"
        delay 1
        get state of first configuration where name = "justin.wehrman"
    end repeat
  end tell
EOF
}

function dunamidown {
/usr/bin/env osascript <<-EOF
  # tell application "SonicWall Mobile Connect"
  # 	open location "mobileconnect://disconnect/"
  # end tell
  tell application "Tunnelblick"
    disconnect all
  end tell
EOF
}

function dunamistatus {
/usr/bin/env osascript <<-EOF
  tell application "Tunnelblick"
    get state of configurations
  end tell
EOF
}
