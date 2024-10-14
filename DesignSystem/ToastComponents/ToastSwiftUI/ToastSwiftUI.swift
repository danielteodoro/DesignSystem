import SwiftUI

public struct ToastSwiftUI: View, Equatable {
    
    // MARK: - Properties
    let contentModel: ContentModel
//    @Binding var show: Bool
    
    // MARK: Views
    private var textVStack: some View {
        VStack(alignment: .leading, spacing: Spacing.xSmall) {
            Text(contentModel.title)
                .titleStyle()
            if (contentModel.message != nil) {
                Text(contentModel.message ?? "")
                    .subtitleStyle()
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: false)
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.5, minHeight: 40)
            }
        }
        
    }
    
    public var body: some View {
        ZStack {
            Color(UIColor.secondaryForegroundColor)
            HStack(alignment: .center) {
                if let image = contentModel.image {
                    Image(uiImage: image)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Sizes.xxLarge, height: Sizes.xxLarge)
                }
                
                Spacer(minLength: Spacing.small)
                
                textVStack
                
                if let buttonContentModel = contentModel.buttonContentModel {
                    Spacer(minLength: Spacing.xLarge)
                    
                    Button(action: { buttonContentModel.action() }) {
                        Text(buttonContentModel.title)
                            .font(.heavyMedium)
                            .foregroundStyle(.backgroundStyleColor)
                    }
                }
                else {
                    Spacer(minLength: Spacing.small)
                }
            }
            .padding(
                EdgeInsets(
                    top: Spacing.large,
                    leading: Spacing.xLarge,
                    bottom: Spacing.large,
                    trailing: Spacing.xLarge
                )
            )
        }
        .accessibilityElement(children: .combine)
        .cornerRadius(Spacing.xxLarge)
        .fixedSize(horizontal: true, vertical: true)
        .frame(
            minWidth: 100,
            maxWidth: UIScreen.main.bounds.size.width - Spacing.xxLarge,
            minHeight: 60,
            maxHeight: 100
        )
    }
    
    public init(contentModel: ContentModel) {
        self.contentModel = contentModel
    }
}

#Preview {
    ToastSwiftUI(
        contentModel: .init(
            title: "Test title",
            message: "Test message Test message Test message",
            image: .checkmark,
            buttonContentModel: .init(
                title: "Button title",
                action: { print("Button pressed")}
            )
        )
    )
}

extension Binding: @retroactive Equatable where Value == Bool {
    public static func == (lhs: Binding, rhs: Binding) -> Bool {
        lhs.wrappedValue == rhs.wrappedValue
    }
}
