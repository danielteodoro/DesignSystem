import UIKit

public final class Toast: UIView {
    enum Constants {
        static let defaultMaxWidth = UIScreen.main.bounds.width - (Spacing.large * 2)
        static let defaultMinHeight = 60.0
    }
    
    // MARK: - Properties
    
    // MARK: Private
    lazy private var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = Spacing.small
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy private var verticalLabelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = Spacing.xSmall
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldLarge
        label.textColor = .backgroundColor
        label.numberOfLines = 1
        label.textAlignment = .left

        return label
    }()
    
    lazy private var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .medium
        label.textColor = .backgroundColor
        label.numberOfLines = 2
        label.textAlignment = .left
        
        return label
    }()
    
    lazy private var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy private var button: UIButton = {
        let button = UIButton()
        button.setTitleColor(.backgroundColor, for: .normal)
        button.setTitleColor(.secondaryBackgroundColor, for: .highlighted)
        button.titleLabel?.font = .heavyMedium
        
        return button
    }()
    
    // MARK: Public
    
    public var estimatedSize: CGSize {
        get {
            systemLayoutSizeFitting(
                CGSize(
                    width: Constants.defaultMaxWidth,
                    height: Constants.defaultMinHeight
                ),
                withHorizontalFittingPriority: .defaultHigh,
                verticalFittingPriority: .defaultLow
            )
        }
    }
    
    // MARK: Content Properties
    
    private var contentModel: ContentModel?
    
    // MARK: - Initializer
    
    public required init(
        contentModel: ContentModel
    ) {
        self.contentModel = contentModel
        
        super.init(frame: .zero)

        setupContent()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupContent()
        setupViews()
    }
    
    // MARK: - View Setup
    
    public func configure(with contentModel: ContentModel) {
        self.contentModel = contentModel
        
        setupContent()
        setupViews()
    }
    
    private func setupViews() {
        clipsToBounds = true
        layer.cornerRadius = Sizes.xxLarge
        backgroundColor = .secondaryForegroundColor
        
        // resets StackViews
        horizontalStackView.removeAllArrangedSubviews()
        verticalLabelsStackView.removeAllArrangedSubviews()
        
        // horizontalStackView
        self.addSubview(horizontalStackView)
        horizontalStackView.setTopAnchor(equalTo: topAnchor, constant: Spacing.large)
        horizontalStackView.setBottomAnchor(equalTo: bottomAnchor, constant: -Spacing.large)
        horizontalStackView.setLeadingAnchor(equalTo: leadingAnchor, constant: Spacing.xLarge)
        horizontalStackView.setTrailingAnchor(equalTo: trailingAnchor, constant: -Spacing.xLarge)
        
        horizontalStackView.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)
        
        // iconImageView
        if contentModel?.image != nil {
            horizontalStackView.addArrangedSubview(iconImageView)
            iconImageView.setSizeAnchor(equalTo: .init(width: Sizes.xxLarge, height: Sizes.xxLarge))
            iconImageView.setContentHuggingPriority(.required, for: .horizontal)
        }
        
        // labels
        horizontalStackView.addArrangedSubview(verticalLabelsStackView)
        verticalLabelsStackView.addArrangedSubview(titleLabel)

        titleLabel.setContentHuggingPriority(.required, for: .horizontal)
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        
        if contentModel?.message != nil {
            verticalLabelsStackView.addArrangedSubview(subtitleLabel)
            
            titleLabel.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)
            subtitleLabel.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)
        }
        
        // button
        if contentModel?.buttonContentModel != nil {
            horizontalStackView.addArrangedSubview(button)
            button.setContentHuggingPriority(.required, for: .horizontal)
            
            horizontalStackView.setCustomSpacing(Spacing.xLarge, after: verticalLabelsStackView)
        }
        
        setAccessibility()
    }
    
    private func setupContent() {
        guard let contentModel else { return }
        titleLabel.text = contentModel.title
        subtitleLabel.text = contentModel.message
        iconImageView.image = contentModel.image
        
        if contentModel.buttonContentModel != nil {
            button.setTitle(contentModel.buttonContentModel?.title, for: .normal)
            button.addAction(
                UIAction(
                    handler: { [weak self] _ in
                        self?.contentModel?.buttonContentModel?.action()
                    }),
                for: .touchUpInside
            )
        }
    }
    
    func setAccessibility() {
        titleLabel.isAccessibilityElement = false
        subtitleLabel.isAccessibilityElement = false
        button.isAccessibilityElement = true
        
        self.isAccessibilityElement = false
        verticalLabelsStackView.isAccessibilityElement = true
        verticalLabelsStackView.accessibilityTraits = [.staticText]
        verticalLabelsStackView.accessibilityLabel = [titleLabel, subtitleLabel]
            .map { $0.accessibilityLabel ?? "" }
            .joined(separator: ", ")
    }
}

#if DEBUG
import SwiftUI

struct Toast_Previews: PreviewProvider {
    static var previews: some View {
        PreviewViewContainer {
            return Toast(
                contentModel: .init(
                    title: "Test title",
                    message: "Test message",
                    image: .checkmark,
                    buttonContentModel: .init(
                        title: "Button title",
                        action: { print("test") }
                    )
                )
            )
        }
    }
}
#endif
