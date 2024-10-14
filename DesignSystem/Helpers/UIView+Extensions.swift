import UIKit

extension UIView {
    
    // MARK: - Edges
    
    @inlinable func setTopAnchor(equalTo referenceAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat) {
        topAnchor.constraint(equalTo: referenceAnchor, constant: constant).isActive = true
    }
    
    @inlinable func setBottomAnchor(equalTo referenceAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat) {
        bottomAnchor.constraint(equalTo: referenceAnchor, constant: constant).isActive = true
    }
    
    @inlinable func setLeadingAnchor(equalTo referenceAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat) {
        leadingAnchor.constraint(equalTo: referenceAnchor, constant: constant).isActive = true
    }
    
    @inlinable func setTrailingAnchor(equalTo referenceAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat) {
        trailingAnchor.constraint(equalTo: referenceAnchor, constant: constant).isActive = true
    }
    
    // MARK: - Center
    
    @inlinable func setCenterXAnchor(equalTo referenceAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat) {
        centerXAnchor.constraint(equalTo: referenceAnchor, constant: constant).isActive = true
    }
    
    @inlinable func setCenterYAnchor(equalTo referenceAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat) {
        centerYAnchor.constraint(equalTo: referenceAnchor, constant: constant).isActive = true
    }
    
    // MARK: - Sizing
    
    @inlinable func setHeightAnchor(equalTo constant: CGFloat) {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    @inlinable func setWidthAnchor(equalTo constant: CGFloat) {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    @inlinable func setSizeAnchor(equalTo size: CGSize) {
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
    }
}
