import SwiftUI

public extension Text {
    func titleStyle(tintColor: Color = .backgroundStyleColor) -> some View {
        modifier(TitleModifier(tintColor: tintColor))
    }
    
    func subtitleStyle() -> some View {
        modifier(SubtitleModifier())
    }
}

fileprivate struct TitleModifier: ViewModifier {
    var tintColor: Color = .backgroundStyleColor
    
    func body(content: Content) -> some View {
        content
            .lineLimit(1)
            .font(.boldLarge)
            .foregroundStyle(tintColor)
    }
}

fileprivate struct SubtitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.leading)
            .font(.medium)
            .foregroundStyle(.backgroundStyleColor)
    }
}

