import AppKit

final class AppDelegate: NSObject, NSApplicationDelegate {
    private var window: NSWindow!
    private var messageLabel: NSTextField!

    func applicationDidFinishLaunching(_ notification: Notification) {
        let contentRect = NSRect(x: 0, y: 0, width: 440, height: 260)
        window = NSWindow(
            contentRect: contentRect,
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered,
            defer: false
        )
        window.title = "Hello World"
        window.center()
        window.minSize = NSSize(width: 360, height: 220)

        let content = NSView(frame: contentRect)
        window.contentView = content

        let icon = NSTextField(labelWithString: "👋")
        icon.font = NSFont.systemFont(ofSize: 42)
        icon.alignment = .center
        icon.translatesAutoresizingMaskIntoConstraints = false

        messageLabel = NSTextField(labelWithString: "Hello, World!")
        messageLabel.font = NSFont.systemFont(ofSize: 28, weight: .semibold)
        messageLabel.alignment = .center
        messageLabel.translatesAutoresizingMaskIntoConstraints = false

        let button = NSButton(title: "Say Hello", target: self, action: #selector(sayHello))
        button.bezelStyle = .rounded
        button.keyEquivalent = "\r"
        button.translatesAutoresizingMaskIntoConstraints = false

        let subtitle = NSTextField(labelWithString: "A tiny native macOS app")
        subtitle.font = NSFont.systemFont(ofSize: 12)
        subtitle.textColor = .secondaryLabelColor
        subtitle.alignment = .center
        subtitle.translatesAutoresizingMaskIntoConstraints = false

        [icon, messageLabel, button, subtitle].forEach { content.addSubview($0) }

        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: content.centerXAnchor),
            icon.topAnchor.constraint(equalTo: content.topAnchor, constant: 28),

            messageLabel.centerXAnchor.constraint(equalTo: content.centerXAnchor),
            messageLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 12),

            button.centerXAnchor.constraint(equalTo: content.centerXAnchor),
            button.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 18),

            subtitle.centerXAnchor.constraint(equalTo: content.centerXAnchor),
            subtitle.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 18)
        ])

        window.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }

    @objc private func sayHello() {
        messageLabel.stringValue = "Hello from your Mac!"
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}

@main
struct HelloWorldMacApp {
    static func main() {
        let app = NSApplication.shared
        let delegate = AppDelegate()
        app.delegate = delegate
        app.setActivationPolicy(.regular)
        app.run()
        // Keep the delegate alive for the lifetime of the app.
        _ = delegate
    }
}
