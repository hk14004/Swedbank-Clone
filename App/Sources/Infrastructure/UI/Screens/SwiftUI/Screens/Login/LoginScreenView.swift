//
//  LoginScreenView.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 27/05/2023.
//

import SwiftUI
import DevToolsUI
import SwedInterfaceAdapters

struct LoginScreenView<ViewModel: LoginScreenVM>: View {
    
    @ObservedObject var viewModel: ViewModel
    @ObservedObject var loc = AppLocalizationObserver()
    
    @State private var pin: String = ""
    var body: some View {
        VStack() {
            languageSelectorView
            Spacer()
            titleView
            Spacer()
            
            Text(AppStrings.Screen.Login.enterPin)
                .font(AppTypography.body.scaledFontSwiftUI)
                .foregroundStyle(SWEDBANKAsset.Colors.text2.swiftUIColor)
            PinProgressView(maxPinLength: viewModel.maxPinLength, currentPin: $pin)
            
            PinGridView(addDigit: { digit in
                addDigit("\(digit)")
            }, removeDigit: {
                deleteDigit()
            }, onFaceIDTapped: {
                
            })
            .padding(.init(top: 12, leading: 0, bottom: 48, trailing: 0))
        }
        .background(SWEDBANKAsset.Colors.background2.swiftUIColor.ignoresSafeArea())
    }
    
    func addDigit(_ digit: String) {
        if pin.count < viewModel.maxPinLength {
            pin += digit
        }
        if pin.count == viewModel.maxPinLength {
            viewModel.onLoginAttempt(pinCode: pin)
        }
    }
    
    func deleteDigit() {
        if !pin.isEmpty {
            pin.removeLast()
        }
    }
    
    private var titleView: some View {
        Text(AppStrings.Screen.Login.greeting(viewModel.customerName))
            .font(AppTypography.title7.scaledFontSwiftUI)
            .foregroundColor(SWEDBANKAsset.Colors.accent1.swiftUIColor)
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

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        AppLocalizedPreview(language: "lv")
        LoginScreenView(viewModel: LoginScreenVMPreview())
    }
}

private class LoginScreenVMPreview: LoginScreenVM {
    var maxPinLength: Int { 3 }
    @Published var loadingPublisher: Bool = false
    var customerName: String = "James Bond"
    var router: LoginScreenRouter!
    func onLoginAttempt(pinCode: String) {}
    func onFaceIDTapped() {}
    func onLanguageChangeTap() {}
}
