# UnionChat

A modern, flexible chat interface framework for iOS built with SwiftUI.

## Installation

### Swift Package Manager

Add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/unionst/union-chat.git", .upToNextMajor(from: "1.0.0"))
]
```

Or add it in Xcode:
1. File → Add Package Dependencies
2. Enter: `https://github.com/unionst/union-chat.git`

## Features

- Modern SwiftUI-based chat interface
- Customizable message bubbles and styling
- Support for various message types and media
- Smooth animations and interactions
- Built on the Union design system

## Quick Start

```swift
import SwiftUI
import UnionChat

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let role: ChatRole
    let timestamp: Date
}

struct ContentView: View {
    @State private var messages: [ChatMessage] = []
    
    var body: some View {
        Chat(messages) { message in
            Message(message.text, role: message.role, timestamp: message.timestamp)
        }
        .onChatSend { text, _ in
            guard let text else { return }
            messages.append(ChatMessage(text: text, role: .me, timestamp: Date()))
        }
        .tint(.blue)
    }
}
```

That's it! UnionChat handles scrolling, animations, keyboard management, and provides a beautiful, customizable interface out of the box.

## License

See [LICENSE](LICENSE) for details.

