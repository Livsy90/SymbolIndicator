# SymbolIndicator

A lightweight and customizable loading indicator built with **SwiftUI’s new `SymbolEffect` API**, designed for a clean and modern look using SF Symbols.

![SwiftUI](https://img.shields.io/badge/SwiftUI-Compatible-blue)
![iOS](https://img.shields.io/badge/iOS-17+-lightgrey)
![License](https://img.shields.io/badge/License-MIT-green)

## Overview

[Demo](https://www.youtube.com/watch?v=hImoILm2mSg)

[Article](https://livsycode.com/swiftui/custom-progress-indicator-with-swiftui-symbol-effects/)

`SymbolIndicator` is a reusable SwiftUI component that provides a scalable, motion-aware loading indicator using SF Symbols and the new `SymbolEffect` APIs introduced in iOS 17 and refined in iOS 18.  
It automatically respects **`ControlSize`**, **Dynamic Type scaling**, and **Reduce Motion accessibility settings**.

---

## Features

- ✅ Built on top of the native `SymbolEffect` and `VariableColorSymbolEffect`
- ⚙️ Adjustable animation speed
- 🧩 Works with all `ControlSize` values (`mini`, `small`, `regular`, `large`, `extraLarge`)
- ♿ Fully supports accessibility (Reduce Motion, custom accessibility labels)
- 🔁 Automatically uses continuous or repeating symbol effects depending on iOS version
- 🧱 Clean API for fluent configuration

---

## Usage

### Basic Example

```swift
import SwiftUI
import SymbolIndicator

struct ContentView: View {
    var body: some View {
        SymbolIndicator(effect: .variableColor)
    }
}
```
Customization

You can easily customize the control size, symbol, speed, and accessibility label using a fluent API:
```swift
SymbolIndicator(.large, effect: .variableColor)
    .symbol("hourglass")
    .speed(2.0)
    .accessibilityLabel("Loading content")
```
