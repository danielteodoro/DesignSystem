import Foundation
import UIKit

public extension ToastSwiftUI {
    typealias ButtonHandler = (() -> Void)
    
    struct ContentModel: Equatable {
        public struct ButtonContentModel: Identifiable {
            public let id = UUID()
            var title: String
            var action: ButtonHandler
            
            public init(title: String, action: @escaping ButtonHandler) {
                self.title = title
                self.action = action
            }
        }
        
        let title: String
        let message: String?
        let image: UIImage?
        let buttonContentModel: ButtonContentModel?
        
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
    }
}

extension ToastSwiftUI.ContentModel.ButtonContentModel: Equatable {
    public static func == (
        lhs: ToastSwiftUI.ContentModel.ButtonContentModel,
        rhs: ToastSwiftUI.ContentModel.ButtonContentModel
    ) -> Bool {
        lhs.id == rhs.id && lhs.title == rhs.title
    }
}
