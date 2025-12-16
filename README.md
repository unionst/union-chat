# UnionChat

A SwiftUI-native iMessage replica SDK.

## Features

- 🎨 Polished chat bubbles with automatic tail positioning and avatars
- 💬 Text, media metadata, delivery state, and read receipts modeling
- 📱 Modern input bar with configurable capabilities and async send hooks
- 📡 Smooth scrolling, typing indicators, and scroll-to-bottom button
- ⚙️ Flexible modifiers to control headers, autoscroll, and message visibility
- 🚀 Backed by UIKit performance while remaining SwiftUI-friendly

## Documentation

Full documentation is available at [swiftipedia.org/documentation/unionchat](https://swiftipedia.org/documentation/unionchat)

## Installation

Add UnionChat using Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/unionst/union-chat.git", from: "0.2.0")
]
```

Then add `UnionChat` to the target that needs it.

## Quick Start

```swift
import SwiftUI
import UnionChat

struct ConversationView: View {
    @State private var messages: [DemoMessage] = DemoMessage.seed
    
    var body: some View {
        Chat(messages)
            .chatInputPlaceholder("Message Alex…")
            .chatInputCapabilities([.camera, .photoLibrary, .files])
            .onChatSend { text, media in
                guard let text else { return }
                let reply = DemoMessage(
                    text: text,
                    role: .me
                )
                await MainActor.run {
                    messages.append(reply)
                }
            }
    }
}
```

### Messages

UnionChat renders any collection of values that conform to `ChatMessage`:

```swift
struct DemoMessage: ChatMessage {
    let id: UUID
    let text: String
    let role: ChatRole
    let timestamp: Date
    var seenAt: Date?
    
    init(
        id: UUID = UUID(),
        text: String,
        role: ChatRole,
        timestamp: Date = .now,
        seenAt: Date? = nil
    ) {
        self.id = id
        self.text = text
        self.role = role
        self.timestamp = timestamp
        self.seenAt = seenAt
    }
}
```

- `ChatRole` differentiates `.me`, `.system`, and `.user(id:displayName:)`.
- `seenAt` defaults are provided via protocol extensions.
- `MessageMedia` enumerates built-in attachments such as images, video, audio, files, locations, and polls.

## Customisation

- **Input**: `chatInputPlaceholder(_:)`, `chatInputCapabilities(_:)`, and `onChatSend(perform:)` control the keyboard accessory and async send flow.
- **Scrolling**: `chatDefaultScrollAnchor(_:)` helps manage scroll behavior.
- **Headers**: `chatHeader { }` injects SwiftUI views above the transcript, and `ChatView.header(_:avatar:avatarURL:action:)` renders the built-in `UnionHeader`.
- **Typing**: `ChatView.typingIndicators(_:content:)` displays people currently typing with custom views.
- **Bubble Styling**: Use `ChatBubbleShape` and supporting SwiftUI modifiers to match your brand.

All modifiers are standard SwiftUI extensions, so they compose naturally with the rest of your view hierarchy.

## Examples

The `Sources/union-chat/Examples` folder includes:
- `_ChatExample.swift` — interactive showcase with live message simulation
- `Message.swift` — reference implementation of a `ChatMessage`
- Previews for scroll-to-bottom button, typing indicators, and more

Run the example target in Xcode to explore the full experience.

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 6.1+

## Licensing

UnionChat is distributed under the commercial license found in `LICENSE-COMMERCIAL.md`. SaaS subscribers receive binary access and updates while their subscription is active. Consulting clients retain perpetual internal-use rights to the source code delivered during their engagement and may receive future binary updates only as specified in their consulting or maintenance agreement. Redistributing the source or binaries outside your organization is prohibited. Contact hello@unionst.com to discuss alternative terms or evaluate source access.

## Architecture

- SwiftUI API (`Chat`) manages configuration and composition.
- UIKit-powered `ChatView` drives collection view rendering, layout, and keyboard handling.
- Shared environment values wire up modifiers, input configuration, scroll state, and read receipts.

This hybrid approach keeps the API declarative while delivering smooth animations, predictable scrolling, and resilience for large transcripts.
