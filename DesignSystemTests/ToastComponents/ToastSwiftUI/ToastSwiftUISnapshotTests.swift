import XCTest
import SnapshotTesting

import DesignSystem

final class ToastSwiftUISnapshotTests: XCTestCase {
    func test_toastSwiftUI_withTitle() {
        let toast = ToastSwiftUI(contentModel: .init(title: "Hello World"))
        
        assertSnapshot(
            of: toast,
            as: .image(
                layout: .fixed(
                    width: UIScreen.main.bounds.size.width,
                    height: 200
                )
            )
        )
    }
    
    func test_toastSwiftUI_withTitleAndImage() {
        let toast = ToastSwiftUI(
            contentModel: .init(title: "Hello World",
                                image: .add
                               )
        )
        
        assertSnapshot(
            of: toast,
            as: .image(
                layout: .fixed(
                    width: UIScreen.main.bounds.size.width,
                    height: 200
                )
            )
        )
    }
    
    func test_toastSwiftUI_withTitleAndMessage() {
        let toast = ToastSwiftUI(
            contentModel: .init(title: "Hello World",
                               message: "This is a test message"
                               )
        )
        
        assertSnapshot(
            of: toast,
            as: .image(
                layout: .fixed(
                    width: UIScreen.main.bounds.size.width,
                    height: 200
                )
            )
        )
    }
    
    func test_toastSwiftUI_withTitleAndButton() {
        let toast = ToastSwiftUI(
            contentModel: .init(
                title: "Hello World",
                buttonContentModel: .init(
                    title: "Button title",
                    action: { }
                )
            )
        )
        
        assertSnapshot(
            of: toast,
            as: .image(
                layout: .fixed(
                    width: UIScreen.main.bounds.size.width,
                    height: 200
                )
            )
        )
    }
    
    func test_toastSwiftUI_withTitleMessageAndImage() {
        let toast = ToastSwiftUI(
            contentModel: .init(
                title: "Hello World",
                message: "This is a test message",
                image: .add
            )
        )
        
        assertSnapshot(
            of: toast,
            as: .image(
                layout: .fixed(
                    width: UIScreen.main.bounds.size.width,
                    height: 200
                )
            )
        )
    }
    
    func test_toastSwiftUI_withTitleMessageAndButton() {
        let toast = ToastSwiftUI(
            contentModel: .init(
                title: "Hello World",
                message: "This is a test message",
                buttonContentModel: .init(
                    title: "Button title",
                    action: { }
                )
            )
        )
        
        assertSnapshot(
            of: toast,
            as: .image(
                layout: .fixed(
                    width: UIScreen.main.bounds.size.width,
                    height: 200
                )
            )
        )
    }
    
    func test_toastSwiftUI_withTitleMessageImageAndButton() {
        let toast = ToastSwiftUI(
            contentModel: .init(
                title: "Hello World",
                message: "This is a test message",
                image: .add,
                buttonContentModel: .init(
                    title: "Button title",
                    action: { }
                )
            )
        )
        
        assertSnapshot(
            of: toast,
            as: .image(
                layout: .fixed(
                    width: UIScreen.main.bounds.size.width,
                    height: 200
                )
            )
        )
    }
}
