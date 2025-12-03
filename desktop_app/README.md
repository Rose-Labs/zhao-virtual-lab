# Paper Enhancement Desktop App

A macOS desktop application that launches the Paper Enhancement Pipeline Streamlit interface with one click.

## What This Does

This desktop app automatically:
1. Opens a Terminal window
2. Navigates to your `virtual_lab` directory
3. Activates the Python virtual environment
4. Loads environment variables from `.env`
5. Launches the Streamlit web interface for paper enhancement

## Prerequisites

Before building the app, ensure you have:
- Completed the Virtual Lab setup (see main README)
- Created and configured your `.env` file with API keys
- Installed all Python dependencies in `venv/`
- The `virtual_lab` directory located at `~/virtual_lab`

## Building the App

To create the desktop application:

```bash
cd ~/virtual_lab/desktop_app
./build_app.sh
```

This will create `Paper Enhancement.app` on your Desktop.

## Installation

1. After building, drag `Paper Enhancement.app` to your Desktop or Applications folder
2. Double-click to launch
3. The Streamlit interface will open in your default browser at `http://localhost:8501`

### First-Time Security Note

On macOS Ventura or later, you may need to:
1. Right-click the app → "Open" (first time only)
2. Click "Open" in the security dialog
3. Or go to System Settings → Privacy & Security and allow the app

## Files

- `paper_enhancement.applescript` - AppleScript source code
- `PaperEnhancement.icns` - Custom app icon
- `build_app.sh` - Build script that creates the .app bundle
- `README.md` - This file

## Customization

### Changing the Launch Command

Edit `paper_enhancement.applescript` to modify what command runs when you open the app. The current command is:

```applescript
tell application "Terminal"
	activate
	do script "cd ~/virtual_lab && source venv/bin/activate && set -a && source .env && set +a && streamlit run paper_enhancement/streamlit_app.py"
end tell
```

After editing, rebuild the app using `./build_app.sh`.

### Using a Different Directory

If your `virtual_lab` is not at `~/virtual_lab`, update the path in `paper_enhancement.applescript` before building.

## Troubleshooting

### App Won't Open

If double-clicking doesn't work:
- Right-click → "Open" to bypass Gatekeeper
- Check System Settings → Privacy & Security for blocked apps
- Rebuild the app: `./build_app.sh`

### No Terminal Window Appears

The app needs permission to control Terminal:
- Go to System Settings → Privacy & Security → Automation
- Ensure the app has permission to control Terminal

### Streamlit Won't Start

Check that:
- The `~/virtual_lab` path is correct
- Your virtual environment exists: `~/virtual_lab/venv/`
- The `.env` file exists with your API keys
- Streamlit is installed: `source ~/virtual_lab/venv/bin/activate && which streamlit`

## Technical Details

This is an AppleScript application compiled into a macOS .app bundle. When launched, it:
- Uses AppleScript to control the Terminal application
- Runs a shell command that sets up the environment and launches Streamlit
- Is code-signed with an ad-hoc signature for local use

## License

Same license as the parent Virtual Lab project.
