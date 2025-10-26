import SwiftUI

public struct SymbolIndicator<T>: View  where T: IndefiniteSymbolEffect, T: SymbolEffect {
    
    private var overriddenControlSize: ControlSize?
    private var speed: Double = 1.5
    private var effect: T
    private var symbol: String = "ellipsis"
    private var accessibilityLabel: LocalizedStringKey = "loading indicator"
    private var controlSize: ControlSize {
        overriddenControlSize ?? envControlSize
    }
    
    @Environment(\.controlSize) private var envControlSize
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @ScaledMetric private var base: CGFloat = 40
    
    private var size: CGFloat {
        switch controlSize {
        case .mini: base * 0.5
        case .small: base * 0.75
        case .regular: base
        case .large: base * 1.5
        case .extraLarge: base * 2.5
        @unknown default: base * 1.75
        }
    }
    
    private var repeating: SymbolEffectOptions {
        if #available(iOS 18.0, *) {
            .repeat(.continuous)
        } else {
            .repeating
        }
    }
    
    public init(
        _ controlSize: ControlSize? = nil,
        effect: T = VariableColorSymbolEffect.variableColor
    ) {
        self.overriddenControlSize = controlSize
        self.effect = effect
    }
    
    public var body: some View {
        if reduceMotion {
            image
        } else {
            image
                .symbolEffect(
                    effect,
                    options: repeating.speed(speed)
                )
        }
    }
    
    private var image: some View {
        Image(systemName: symbol)
            .font(.system(size: size, weight: .heavy))
            .foregroundStyle(.primary)
            .accessibilityLabel(accessibilityLabel)
    }
}

public extension SymbolIndicator {
    func symbol(_ symbol: String) -> Self {
        var copy = self
        copy.symbol = symbol
        return copy
    }
    
    func speed(_ speed: Double) -> Self {
        var copy = self
        copy.speed = speed
        return copy
    }
    
    func accessibilityLabel(_ key: LocalizedStringKey) -> Self {
        var copy = self
        copy.accessibilityLabel = key
        return copy
    }
    
    func accessibilityLabel(_ text: String) -> Self {
        var copy = self
        copy.accessibilityLabel = LocalizedStringKey(text)
        return copy
    }
}

#Preview {
    ForEach(ControlSize.allCases, id: \.self) { size in
        Text(size.title)
        SymbolIndicator(size, effect: .variableColor)
            .symbol("ellipsis")
            .padding()
    }
}

fileprivate extension ControlSize {
    var title: String {
        switch self {
        case .mini: "Mini"
        case .small: "Small"
        case .regular: "Regular"
        case .large: "Large"
        case .extraLarge: "Extra Large"
        @unknown default: "Unknown"
        }
    }
}
