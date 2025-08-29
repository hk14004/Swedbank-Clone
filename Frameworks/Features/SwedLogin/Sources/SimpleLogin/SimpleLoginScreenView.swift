import SwiftUI
import Combine

struct SimpleLoginScreenView<ViewModel: SimpleLoginScreenVM>: View {
    @ObservedObject public var viewModel: ViewModel

    public var body: some View {
        VStack(spacing: 16) {
            Text("Login")
                .font(.largeTitle)
                .padding(.bottom, 20)

            // Username Input
            TextField("Username", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            // Password Input
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            // Login Button
            Button(action: {
                viewModel.login()
            }) {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    Text("Login")
                        .bold()
                        .frame(maxWidth: .infinity)
                }
            }
            .disabled(viewModel.isLoading || viewModel.username.isEmpty || viewModel.password.isEmpty)
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
    }
}


struct SimpleLoginScreenView_Previews: PreviewProvider {
    class DummyVM: SimpleLoginScreenVM {
        var router: SimpleLoginScreenRouter!
        
        @Published var username: String = ""
        @Published var password: String = ""
        @Published var isLoading: Bool = false
        @Published var errorMessage: String? = "Invalid credentials"

        func login() {
            // Simulate login action
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isLoading = false
                self.errorMessage = self.username == "user" && self.password == "pass" ? nil : "Login failed"
            }
        }
    }

    static var previews: some View {
        SimpleLoginScreenView(viewModel: DummyVM())
    }
}
