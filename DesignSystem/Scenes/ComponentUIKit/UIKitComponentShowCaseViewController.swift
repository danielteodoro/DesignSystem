import UIKit

final class UIKitComponentShowCaseViewController: UIViewController {
    // MARK: - Properties
    weak var coordinator: UIKitComponentShowcaseCoordinator?
    
    // MARK: View Properties
    lazy private var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .top
        stackView.spacing = Spacing.medium
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    // Title Component
    private lazy var titleComponent: ComponentInfoInputView = {
        let component = ComponentInfoInputView(
            title: "Toast title",
            shouldDisplayTextField: true,
            textFieldContent: "Title here"
        )
        return component
    }()
    
    // Subtitle Component
    private lazy var subtitleComponent: ComponentInfoInputView = {
        let component = ComponentInfoInputView(
            title: "Should display Toast subtitle",
            shouldDisplayTextField: true,
            textFieldContent: "Subtitle text here",
            shouldDisplaySwitch: true
        )
        return component
    }()
    
    // Image Component
    private lazy var imageComponent: ComponentInfoInputView = {
        let component = ComponentInfoInputView(
            title: "Should display Toast icon image",
            shouldDisplaySwitch: true
        )
        return component
    }()
    
    // Button Component
    private lazy var buttonComponent: ComponentInfoInputView = {
        let component = ComponentInfoInputView(
            title: "Should display Toast Button",
            shouldDisplayTextField: true,
            textFieldContent: "Button title",
            shouldDisplaySwitch: true
        )
        return component
    }()

    // Display Toast Button
    private lazy var displayButton: UIButton = {
        let button = UIButton()
        button.setTitle("Display Toast", for: .normal)
        button.setTitleColor(.foregroundColor, for: .normal)
        button.backgroundColor = .secondaryBackgroundColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.setContentHuggingPriority(.required, for: .horizontal)
        
        button.layer.cornerRadius = Sizes.small
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(presentToastMessage), for: .touchUpInside)
        return button
    }()
    
    // SwiftUI Button
    private lazy var swiftUIButton: UIButton = {
        let button = UIButton()
        button.setTitle("See SwiftUI Version", for: .normal)
        button.setTitleColor(.foregroundColor, for: .normal)
        button.backgroundColor = .secondaryBackgroundColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.setContentHuggingPriority(.required, for: .horizontal)
        
        button.layer.cornerRadius = Sizes.small
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(presentSwiftUIVersion), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "UIKit"
        view.backgroundColor = .backgroundColor
        
        setupViews()
        
        // keyboard dismiss
        setDismissKeyboard()
    }
    
    // MARK: View Setup
    func setupViews() {
        view.addSubview(verticalStackView)
        verticalStackView.setTopAnchor(equalTo: view.layoutMarginsGuide.topAnchor, constant: Spacing.small)
        verticalStackView.setLeadingAnchor(equalTo: view.leadingAnchor, constant: Spacing.small)
        verticalStackView.setTrailingAnchor(equalTo: view.trailingAnchor, constant: Spacing.small)
        
        verticalStackView.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
        verticalStackView.addArrangedSubview(titleComponent)
        verticalStackView.addArrangedSubview(subtitleComponent)
        verticalStackView.addArrangedSubview(imageComponent)
        verticalStackView.addArrangedSubview(buttonComponent)
        verticalStackView.addArrangedSubview(displayButton)
        verticalStackView.addArrangedSubview(swiftUIButton)
        
        displayButton.setCenterXAnchor(equalTo: verticalStackView.centerXAnchor, constant: 0)
        
        verticalStackView.setCustomSpacing(Spacing.xLarge, after: displayButton)
        swiftUIButton.setCenterXAnchor(equalTo: verticalStackView.centerXAnchor, constant: 0)
    }

    @objc func presentToastMessage() {
        self.presentToast(
            .init(
                title: titleComponent.textfieldValue,
                message: subtitleComponent.isActive ? subtitleComponent.textfieldValue : nil,
                image: imageComponent.isActive ? .checkmark : nil,
                buttonContentModel: buttonComponent.isActive ?
                    .init(
                        title: buttonComponent.textfieldValue,
                        action: {
                            let alertCloseAction = UIAlertAction(title: "Close", style: .cancel)
                            let alertViewController = UIAlertController(title: "Toast Button Pressed", message: nil, preferredStyle: .alert)
                            alertViewController.addAction(alertCloseAction)
                            self.present(alertViewController, animated: true)
                        })
                : nil
            )
        )
    }
    
    @objc func presentSwiftUIVersion() {
        coordinator?.navigateToSwiftUI()
    }
}

#if DEBUG
import SwiftUI

struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        PreviewViewControllerContainer {
            UIKitComponentShowCaseViewController()
        }
    }
}
#endif
