#!/bin/bash
# Build script for Paper Enhancement desktop app
# This creates a macOS .app bundle from the AppleScript source

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
APP_NAME="Paper Enhancement"
OUTPUT_DIR="$HOME/Desktop"

echo "Building ${APP_NAME}.app..."

# Compile AppleScript to .app bundle
osacompile -o "${OUTPUT_DIR}/${APP_NAME}.app" "${SCRIPT_DIR}/paper_enhancement.applescript"

echo "✓ App compiled"

# Copy custom icon
if [ -f "${SCRIPT_DIR}/PaperEnhancement.icns" ]; then
    cp "${SCRIPT_DIR}/PaperEnhancement.icns" "${OUTPUT_DIR}/${APP_NAME}.app/Contents/Resources/"

    # Update Info.plist to use custom icon
    /usr/libexec/PlistBuddy -c "Set :CFBundleIconFile PaperEnhancement" "${OUTPUT_DIR}/${APP_NAME}.app/Contents/Info.plist"
    echo "✓ Custom icon installed"
fi

# Fix executable name to match Info.plist
if [ -f "${OUTPUT_DIR}/${APP_NAME}.app/Contents/MacOS/applet" ]; then
    mv "${OUTPUT_DIR}/${APP_NAME}.app/Contents/MacOS/applet" "${OUTPUT_DIR}/${APP_NAME}.app/Contents/MacOS/PaperEnhancement"
    /usr/libexec/PlistBuddy -c "Set :CFBundleExecutable PaperEnhancement" "${OUTPUT_DIR}/${APP_NAME}.app/Contents/Info.plist"
    echo "✓ Executable renamed"
fi

# Remove extended attributes and re-sign
xattr -cr "${OUTPUT_DIR}/${APP_NAME}.app"
codesign --force --deep --sign - "${OUTPUT_DIR}/${APP_NAME}.app" 2>&1 | grep -v "replacing existing signature" || true
echo "✓ App signed"

echo ""
echo "✅ ${APP_NAME}.app created successfully!"
echo "   Location: ${OUTPUT_DIR}/${APP_NAME}.app"
echo ""
echo "You can now drag it to your Desktop or Applications folder."
