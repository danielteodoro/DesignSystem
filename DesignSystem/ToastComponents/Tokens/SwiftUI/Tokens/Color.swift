import SwiftUI

public extension ShapeStyle where Self == Color {
    static var foregroundStyleColor: Color { Color(UIColor.foregroundColor) }
    
    static var backgroundStyleColor: Color { Color(UIColor.backgroundColor) }
}
