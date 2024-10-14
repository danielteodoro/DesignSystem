import SwiftUI

public struct SwiftUIComponentShowcase: View {
    // Title
    @State private var toastTitle: String = "Toast Title"
    
    // Subtitle
    @State private var shouldDisplayToastSubtitle: Bool = false
    @State private var subtitle: String = "Toast subtitle here"
    
    // Image
    @State private var shouldDisplayToastIcon: Bool = false
    
    // Button
    @State private var shouldDisplayToastButton: Bool = false
    @State private var buttonTitle: String = "Button title"
    
    // Toast
    @State private var showToast = false
    @State private var toastDuration = 5
    
    // Alert
    @State private var showingAlert: Bool = false
    
    public var body: some View {
        HStack {
            Spacer()
            
            VStack(alignment: .leading, spacing: Spacing.xLarge) {
                VStack(alignment: .leading, spacing: Spacing.medium) {
                    Text("Toast Title")
                    TextField("Test text here", text: $toastTitle)
                        .border(.bar)
                }
                VStack(alignment: .leading, spacing: Spacing.medium) {
                    HStack(spacing: Spacing.medium) {
                        Text("Should display subtitle")
                        Toggle("", isOn: $shouldDisplayToastSubtitle)
                            .labelsHidden()
                    }
                    TextField("Test", text: $subtitle)
                        .border(.bar)
                }
                VStack(alignment: .leading, spacing: Spacing.medium) {
                    HStack(spacing: Spacing.medium) {
                        Text("Should display Toast icon image")
                        Toggle("", isOn: $shouldDisplayToastIcon)
                            .labelsHidden()
                    }
                }
                VStack(alignment: .leading, spacing: Spacing.medium) {
                    HStack(spacing: Spacing.medium) {
                        Text("Should display button")
                        Toggle("", isOn: $shouldDisplayToastButton)
                            .labelsHidden()
                    }
                    TextField("Test", text: $buttonTitle)
                        .border(.bar)
                }
                Button {
                    withAnimation {
                        showToast = true
                    }
                } label: {
                    Text("Display Toast")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .padding()
                
                Spacer()
            }
            
            Spacer()
        }
        .navigationTitle("SwiftUI")
        .toast(
            toastContentModel: .init(
                title: toastTitle,
                message: shouldDisplayToastSubtitle ? subtitle : nil,
                image: shouldDisplayToastIcon ? .add : nil,
                buttonContentModel: shouldDisplayToastButton ? .init(
                    title: "Button title",
                    action: { showingAlert.toggle() }
                )
                : nil
            ),
            duration: $toastDuration,
            show: $showToast
        )
        .alert("Button Tapped", isPresented: $showingAlert) {
            Button("Ok", role: .cancel) { }
        }
    }
}

#Preview {
    SwiftUIComponentShowcase()
}
