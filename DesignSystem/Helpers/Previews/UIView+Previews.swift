import SwiftUI

struct PreviewViewContainer<T: UIView>: UIViewRepresentable {
    let view: T

    init(_ viewBuilder: @escaping () -> T) {
        view = viewBuilder()
    }
    
    // MARK: - UIViewRepresentable
    func makeUIView(context: Context) -> T {
        return view
    }
    
    func updateUIView(_ view: T, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
