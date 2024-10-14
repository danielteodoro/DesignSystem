import UIKit

class ComponentInfoInputView: UIView {
    // MARK: - Properties
    
    // MARK: Private
    lazy private var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = Spacing.xSmall
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy private var horizontalTitleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = Spacing.xSmall
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var componentTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldLarge
        label.textColor = .foregroundColor
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var componentSwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = false
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        
        return switchControl
    }()
    
    private lazy var componentTextField: UITextField = {
        let textField = UITextField()
        textField.text = "Toast default subtitle"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    private var shouldDisplayTextField: Bool = false
    
    public var isActive: Bool {
        get {
            return componentSwitch.isOn
        }
    }
    
    public var textfieldValue: String {
        get {
            return componentTextField.text ?? ""
        }
    }
    
    //MARK: - Initializer
    required init(
        title: String,
        shouldDisplayTextField: Bool = false,
        textFieldContent: String? = nil,
        shouldDisplaySwitch: Bool = false
    ) {
        super.init(
            frame: .init(
                x: 0,
                y: 0,
                width: UIScreen.main.bounds.width - Spacing.xxLarge,
                height: 75
            )
        )
        componentTitleLabel.text = title
        componentSwitch.isHidden = !shouldDisplaySwitch
        self.shouldDisplayTextField = shouldDisplayTextField
        componentTextField.text = textFieldContent
        
        setupViews()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        self.addSubview(verticalStackView)
        verticalStackView.setTopAnchor(equalTo: topAnchor, constant: Spacing.small)
        verticalStackView.setBottomAnchor(equalTo: bottomAnchor, constant: -Spacing.small)
        verticalStackView.setLeadingAnchor(equalTo: leadingAnchor, constant: Spacing.small)
        verticalStackView.setTrailingAnchor(equalTo: trailingAnchor, constant: -Spacing.small)
        
        verticalStackView.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
        
        verticalStackView.addArrangedSubview(horizontalTitleStackView)
        if shouldDisplayTextField {
            verticalStackView.addArrangedSubview(componentTextField)
        }
        
        horizontalTitleStackView.addArrangedSubview(componentTitleLabel)
        horizontalTitleStackView.addArrangedSubview(componentSwitch)
        
        componentTextField.setWidthAnchor(equalTo: UIScreen.main.bounds.width - Spacing.xxLarge)
    
        componentTitleLabel.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
        componentSwitch.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
        componentTextField.setContentHuggingPriority(.required, for: .horizontal)
    }
}

#if DEBUG
import SwiftUI

struct ComponentInfoInputView_Previews: PreviewProvider {
    static var previews: some View {
        // 1
        PreviewViewContainer {
            return ComponentInfoInputView(title: "Title", shouldDisplayTextField: true, textFieldContent: "Description", shouldDisplaySwitch: true)
        }
    }
}
#endif
