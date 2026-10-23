#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"

APP_NAME="HelloWorld"
APP="$PWD/$APP_NAME.app"

mkdir -p "$APP/Contents/MacOS"
swiftc -parse-as-library HelloWorld.swift -o "$APP/Contents/MacOS/$APP_NAME" \
  -framework AppKit

cat > "$APP/Contents/Info.plist" <<'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleName</key><string>HelloWorld</string>
    <key>CFBundleDisplayName</key><string>Hello World</string>
    <key>CFBundleIdentifier</key><string>com.example.helloworld</string>
    <key>CFBundleExecutable</key><string>HelloWorld</string>
    <key>CFBundlePackageType</key><string>APPL</string>
    <key>LSMinimumSystemVersion</key><string>12.0</string>
    <key>NSHighResolutionCapable</key><true/>
</dict>
</plist>
PLIST

echo "Built: $APP"
open "$APP"
