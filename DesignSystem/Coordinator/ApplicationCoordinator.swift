import UIKit

class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    let rootViewController: UINavigationController
    let componentListCoordinator: UIKitComponentShowcaseCoordinator
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        componentListCoordinator = UIKitComponentShowcaseCoordinator(presenter: rootViewController)
    }
    
    func start() {
        window.rootViewController = rootViewController
        componentListCoordinator.start()
        window.makeKeyAndVisible()
    }
    
    func stop() {
        
    }
}
