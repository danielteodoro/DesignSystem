import UIKit

final class UIKitComponentShowcaseCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var view: UIKitComponentShowCaseViewController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let componentViewController = UIKitComponentShowCaseViewController()
        componentViewController.coordinator = self
        presenter.pushViewController(componentViewController, animated: true)
        view = componentViewController
    }
    
    func navigateToSwiftUI() {
        let coordinator = SwiftUIComponentShowcaseCoordinator(presenter: presenter)
        coordinator.start()
    }
}
