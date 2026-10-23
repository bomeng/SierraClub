# HelloWorld for macOS — fixed build

This version uses AppKit instead of SwiftUI, so it avoids the missing `SwiftUIMacros.StateMacro` error.

## Build and run
1. Unzip this folder.
2. Open Terminal and `cd` into the extracted `HelloWorldMac_fixed` folder.
3. Run:

   ```bash
   chmod +x build.sh
   ./build.sh
   ```

The script creates `HelloWorld.app` and opens it.

## Requirements
- macOS 12 or later
- Swift compiler and macOS SDK (install Apple's command-line developer tools with `xcode-select --install` if needed)

The build script uses `swiftc -parse-as-library` to support the `@main` entry point. This app is not signed or notarized for distribution.
