import UIKit

public extension Toast {
    typealias ButtonHandler = (() -> Void)
    
    struct ContentModel: Equatable {
        var title: String
        var message: String?
        var image: UIImage?
        var buttonContentModel: ButtonContentModel?

        public init(
            title: String,
            message: String? = nil,
            image: UIImage? = nil,
            buttonContentModel: ButtonContentModel? = nil
        ) {
            self.title = title
            self.message = message
            self.image = image
            self.buttonContentModel = buttonContentModel
        }
        
        public struct ButtonContentModel: Identifiable {
            public let id = UUID()
            var title: String
            var action: ButtonHandler
            
            public init(
                title: String,
                action: @escaping ButtonHandler
            ) {
                self.title = title
                self.action = action
            }
        }
    }
}

extension Toast.ContentModel.ButtonContentModel: Equatable {
    public static func == (lhs: Toast.ContentModel.ButtonContentModel, rhs: Toast.ContentModel.ButtonContentModel) -> Bool {
        lhs.id == rhs.id && lhs.title == rhs.title
    }
}
