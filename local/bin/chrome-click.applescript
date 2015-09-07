
tell application "Google Chrome"
  activate
  repeat with i from 1 to 35
      tell application "System Events"
          delay 2.0
          keystroke "r" using {control down}
      end tell
  end repeat
end tell
