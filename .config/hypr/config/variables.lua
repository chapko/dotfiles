-- Hyprland default apps

TERMINAL = "xdg-terminal-exec"
FILE_MANAGER = "dolphin"
BROWSER = os.getenv("BROWSER") or "firefox"
EDITOR = os.getenv("EDITOR") or "gnome-text-editor --new-window"
CALCULATOR = "gnome-calculator"

-- Monitors
MONITOR1 = ""
PRIMARY_MONITOR = MONITOR1

-- Workspaces
NUM_WPM = 5 -- Number of workspaces per monitor (Max 10)
