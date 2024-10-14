import SwiftUI

public extension View {
    func toast(toastContentModel: ToastSwiftUI.ContentModel, duration: Binding<Int> = .constant(5), show: Binding<Bool>) -> some View {
        self.modifier(ToastPresenterModifier.init(toastContentModel: toastContentModel, show: show, duration: duration))
    }
}

fileprivate struct ToastPresenterModifier : ViewModifier {
    @Binding var show: Bool
    @Binding var duration: Int
    
    let toastView: ToastSwiftUI
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if show {
                VStack {
                    Spacer()
                    HStack {
                        Spacer(minLength: Spacing.large)
                        
                        toastView
                            .onAppear(perform: {
                                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(duration)) {
                                    withAnimation {
                                        self.show = false
                                    }
                                }
                            })
                        
                        Spacer(minLength: Spacing.large)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .bottom)
                .transition(.move(edge: .bottom))
            }
        }
    }
    
    init(toastContentModel: ToastSwiftUI.ContentModel, show: Binding<Bool>, duration: Binding<Int>) {
        self.toastView = ToastSwiftUI(contentModel: toastContentModel)
        self._show = show
        self._duration = duration
    }
}
