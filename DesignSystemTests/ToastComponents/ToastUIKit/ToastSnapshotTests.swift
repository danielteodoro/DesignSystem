import XCTest
import SnapshotTesting

import DesignSystem

final class ToastSnapshotTests: XCTestCase {
    func test_toast_withTitle() {
        let toast = Toast(contentModel: .init(title: "Hello World"))
        toast.frame.size = .init(
            width: toast.estimatedSize.width,
            height:  toast.estimatedSize.height
        )
        
        assertSnapshot(of: toast, as: .image)
    }
    
    func test_toast_withTitleAndImage() {
        let toast = Toast(
            contentModel: .init(
                title: "Hello World",
                image: .checkmark
            )
        )
        toast.frame.size = .init(
            width: toast.estimatedSize.width,
            height:  toast.estimatedSize.height
        )
        
        assertSnapshot(of: toast, as: .image)
    }
    
    func test_toast_withTitleAndMessage() {
        let toast = Toast(
            contentModel: .init(
                title: "Hello World",
                message: "Hello World Subtitle"
            )
        )
        toast.frame.size = .init(
            width: toast.estimatedSize.width,
            height:  toast.estimatedSize.height
        )
        
        assertSnapshot(of: toast, as: .image)
    }
    
    func test_toast_withTitleAndButton() {
        let toast = Toast(
            contentModel: .init(
                title: "Hello World",
                buttonContentModel: .init(
                    title: "Button title",
                    action: {}
                )
            )
        )
        toast.frame.size = .init(
            width: toast.estimatedSize.width,
            height:  toast.estimatedSize.height
        )
        
        assertSnapshot(of: toast, as: .image)
    }
    
    func test_toast_withTitleMessageAndImage() {
        let toast = Toast(
            contentModel: .init(
                title: "Hello World",
                message: "Hello World Subtitle",
                image: .checkmark
            )
        )
        toast.frame.size = .init(
            width: toast.estimatedSize.width,
            height:  toast.estimatedSize.height
        )
        
        assertSnapshot(of: toast, as: .image)
    }
    
    func test_toast_withTitleMessageAndButton() {
        let toast = Toast(
            contentModel: .init(
                title: "Hello World",
                message: "Hello World Subtitle",
                buttonContentModel: .init(
                    title: "Button title",
                    action: {}
                )
            )
        )
        toast.frame.size = .init(
            width: toast.estimatedSize.width,
            height:  toast.estimatedSize.height
        )
        
        assertSnapshot(of: toast, as: .image)
    }
    
    func test_toast_withTitleMessageImageAndButton() {
        let toast = Toast(
            contentModel: .init(
                title: "Hello World",
                message: "Hello World Subtitle",
                image: .checkmark,
                buttonContentModel: .init(
                    title: "Button title",
                    action: {}
                )
            )
        )
        toast.frame.size = .init(
            width: toast.estimatedSize.width,
            height:  toast.estimatedSize.height
        )
        
        assertSnapshot(of: toast, as: .image)
    }
}
