#!/usr/bin/env osascript

function dunamiup {
/usr/bin/env osascript <<-EOF
  tell application "SonicWall Mobile Connect"
	 open location "mobileconnect://connect/?name=Dunami"
  end tell
EOF
}

function dunamidown {
/usr/bin/env osascript <<-EOF
  tell application "SonicWall Mobile Connect"
  	open location "mobileconnect://disconnect/"
  end tell
EOF
}
