import UIKit

extension UIColor {
    
    /// - Parameters:
    ///   - lightColor: Color for Light Mode
    ///   - darkColor:  Color for Dark Mode
    static func themeColor(lightColor: UIColor, darkColor: UIColor) -> UIColor {
        return UIColor(dynamicProvider: { return $0.userInterfaceStyle == .dark ? darkColor : lightColor })
    }
    
    // MARK: - Background Colors
    static let backgroundColor: UIColor = UIColor.themeColor(lightColor: .white, darkColor: .black)
    
    static let secondaryBackgroundColor: UIColor = UIColor.themeColor(lightColor: .lightGray, darkColor: .darkGray)
    
    // MARK: - Foreground Colors
    static let foregroundColor: UIColor = UIColor.themeColor(lightColor: .black, darkColor: .white)
    
    static let secondaryForegroundColor: UIColor = UIColor.themeColor(lightColor: .darkGray, darkColor: .lightGray)
}
