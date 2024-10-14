import UIKit

public extension UIFont {
    // MARK: - Normal
    
    /// System Font
    /// size: 10
    static var xSmall: UIFont {
        return .systemFont(ofSize: Sizes.xSmall)
    }
    
    /// System Font
    /// size: 12
    static var small: UIFont {
        return .systemFont(ofSize: Sizes.small)
    }
    
    /// System Font
    /// size: 14
    static var medium: UIFont {
        return .systemFont(ofSize: Sizes.medium)
    }
    
    /// System Font
    /// size: 16
    static var large: UIFont {
        return .systemFont(ofSize: Sizes.large)
    }
    
    /// System Font
    /// size: 20
    static var xLarge: UIFont {
        return .systemFont(ofSize: Sizes.xLarge)
    }
    
    // MARK: - Bold
    
    /// System Font
    /// size: 10
    /// weight: bold
    static var boldXSmall: UIFont {
        return .boldSystemFont(ofSize: Sizes.xSmall)
    }
    
    /// System Font
    /// size: 12
    /// weight: bold
    static var boldSmall: UIFont {
        return .boldSystemFont(ofSize: Sizes.small)
    }
    
    /// System Font
    /// size: 14
    /// weight: bold
    static var boldMedium: UIFont {
        return .boldSystemFont(ofSize: Sizes.medium)
    }
    
    /// System Font
    /// size: 16
    /// weight: bold
    static var boldLarge: UIFont {
        return .boldSystemFont(ofSize: Sizes.large)
    }
    
    /// System Font
    /// size: 20
    /// weight: bold
    static var boldXLarge: UIFont {
        return .boldSystemFont(ofSize: Sizes.xLarge)
    }
    
    // MARK: - Heavy
    
    /// System Font
    /// size: 10
    /// weight: heavy
    static var heavyXSmall: UIFont {
        return .systemFont(ofSize: Sizes.xSmall, weight: .heavy)
    }
    
    /// System Font
    /// size: 12
    /// weight: heavy
    static var heavySmall: UIFont {
        return .systemFont(ofSize: Sizes.small, weight: .heavy)
    }
    
    /// System Font
    /// size: 14
    /// weight: heavy
    static var heavyMedium: UIFont {
        return .systemFont(ofSize: Sizes.medium, weight: .heavy)
    }
    
    /// System Font
    /// size: 16
    /// weight: heavy
    static var heavyLarge: UIFont {
        return .systemFont(ofSize: Sizes.large, weight: .heavy)
    }
    
    /// System Font
    /// size: 20
    /// weight: heavy
    static var heavyXLarge: UIFont {
        return .systemFont(ofSize: Sizes.xLarge, weight: .heavy)
    }
}
