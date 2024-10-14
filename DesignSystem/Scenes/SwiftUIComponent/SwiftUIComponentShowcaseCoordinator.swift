import UIKit
import SwiftUI

final class SwiftUIComponentShowcaseCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var view: UIHostingController<SwiftUIComponentShowcase>?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let swiftUIComponentViewController = UIHostingController(rootView: SwiftUIComponentShowcase())
        presenter.pushViewController(swiftUIComponentViewController, animated: true)
        
        view = swiftUIComponentViewController
    }
}
