import UIKit
import SwiftUI

public extension UIViewController {
    /// Present Toast in ViewController's view
    ///  - Parameters:
    ///     - contentModel: model with necessary data to be displayed by the Toast
    ///     - duration: amount of time the Toast will be displayed for
    func presentToast(_ contentModel: Toast.ContentModel, duration: CGFloat = 5) {
        // Reomves pre-existing Toasts
        removeExistingToasts()
        
        let toastView = Toast(contentModel: contentModel)
        
        // Sets Toast's frame and adds it to ViewController's view
        toastView.frame = CGRect(
            x: (view.frame.size.width - toastView.estimatedSize.width) / 2,
            y: view.frame.size.height,
            width: toastView.estimatedSize.width,
            height: toastView.estimatedSize.height
        )
        view.addSubview(toastView)
        
        // Display animation
        UIView.animate(withDuration: 0.25) { [weak self] in
            guard let self else { return }
            toastView.frame = CGRect(
                x: (view.frame.size.width - toastView.estimatedSize.width) / 2,
                y: view.frame.size.height - toastView.estimatedSize.height - Spacing.xLarge,
                width: toastView.estimatedSize.width,
                height: toastView.estimatedSize.height
            )
        } completion: { didCompleteAnimation in
            // Accessibility Focus when displaying
            UIAccessibility.post(notification: .screenChanged, argument: toastView)
            
            // Ending animation
            if didCompleteAnimation {
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    UIView.animate(withDuration: 0.5) { [weak self] in
                        guard let self else { return }
                        toastView.frame = CGRect(
                            x: (view.frame.size.width - toastView.estimatedSize.width) / 2,
                            y: view.frame.size.height,
                            width: toastView.estimatedSize.width,
                            height: toastView.estimatedSize.height
                        )
                    } completion: { didCompleteAnimation in
                        if didCompleteAnimation {
                            // Remove Toast
                            toastView.removeFromSuperview()
                        }
                    }
                }
            }
        }
    }
    
    private func removeExistingToasts() {
        self.view.subviews
            .filter { $0.self is Toast}
            .forEach { $0.removeFromSuperview() }
    }
}
