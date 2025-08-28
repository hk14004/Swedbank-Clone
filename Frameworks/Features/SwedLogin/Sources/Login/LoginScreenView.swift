//
//  LoginScreenView.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 27/05/2023.
//

import SwiftUI
import DevToolsUI
import SwedDesignSystem

struct LoginScreenView<ViewModel: LoginScreenVM>: View {
    
    @ObservedObject var viewModel: ViewModel
    @ObservedObject var loc = AppLocalizationObserver()
    
    var body: some View {
        VStack() {
            languageSelectorView
            Spacer()
            titleView
            Spacer()
            
            Text(AppStrings.Screen.Login.enterPin)
                .font(AppTypography.body.scaledFontSwiftUI)
                .foregroundStyle(AppColors.text2.swiftUIColor)
            PinProgressView(
                maxPinLength: viewModel.maxPinLength,
                currentPin: .init(
                    get: {
                        viewModel.currentPin
                    },
                    set: { _ in })
            )
            
            PinGridView(addDigit: { digit in
                viewModel.onAddDigit("\(digit)")
            }, removeDigit: {
                viewModel.onRemoveDigit()
            }, onFaceIDTapped: {
                viewModel.onFaceIDTapped()
            })
            .padding(.init(top: 12, leading: 0, bottom: 48, trailing: 0))
        }
        .background(AppColors.background2.swiftUIColor.ignoresSafeArea())
    }
    
    private var titleView: some View {
        Text(AppStrings.Screen.Login.greeting(viewModel.customerName))
            .font(AppTypography.title7.scaledFontSwiftUI)
            .foregroundColor(AppColors.accent1.swiftUIColor)
    }
    
    private var languageSelectorView: some View {
        HStack {
            Spacer()
            LanguageDropdownView()
                .onTapGesture {
                    viewModel.onLanguageChangeTap()
                }
        }
        .padding()
    }
}

#Preview {
    AppLocalizedPreview(language: "lv")
    LoginScreenView(viewModel: LoginScreenVMPreview())
}

private class LoginScreenVMPreview: LoginScreenVM {
    @Published var currentPin: String = ""
    var maxPinLength: Int { 3 }
    @Published var loadingPublisher: Bool = false
    var customerName: String = "James"
    var router: LoginScreenRouter!
    func onLoginAttempt(pinCode: String) {}
    func onFaceIDTapped() {}
    func onLanguageChangeTap() {}
    func onAddDigit(_ digit: String) {}
    func onRemoveDigit() {}
}
