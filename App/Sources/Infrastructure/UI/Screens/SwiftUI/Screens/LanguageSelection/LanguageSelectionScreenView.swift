//
//  LanguageSelectionScreenView.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 28/05/2023.
//

import SwiftUI
import DevToolsUI
import SwedInterfaceAdapters

struct LanguageSelectionScreenView<ViewModel: LanguageSelectionScreenVM>: View {
    
    @ObservedObject var viewModel: ViewModel
    @ObservedObject var loc = AppLocalizationObserver()
    
    var body: some View {
        VStack(spacing: 0) {
            makeHeader()
            makeLangList()
        }
    }
}

struct LanguageSelectionScreenBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        AppLocalizedPreview(language: "lv")
        LanguageSelectionScreenView(viewModel: LanguageSelectionScreenBottomSheetPreviewVM())
    }
}

extension LanguageSelectionScreenView {
    @ViewBuilder
    private func makeHeader() -> some View {
        VStack(spacing: 0) {
            Text("Screen.LanguageSelection.title".runtimeLocalized())
                .frame(maxWidth: .infinity)
                .overlay {
                    HStack {
                        Button {
                            viewModel.onClose()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(SWEDBANKAsset.Colors.orange1.swiftUIColor)
                        }
                        Spacer()
                    }
                }
                .padding()
            Divider()
        }
    }
    
    @ViewBuilder
    private func makeLangList() -> some View {
        List(viewModel.availableLanguages, id: \.self) { code in
            makeLanguageRow(code: code, selected: viewModel.selectedLanguage == code)
                .onTapGesture {
                    viewModel.onChangeLanguage(code: code)
                }
        }
        .listStyle(.plain)
    }
    
    @ViewBuilder
    private func makeLanguageRow(code: String, selected: Bool) -> some View {
        HStack(alignment: .center, spacing: 0) {
            Image(SWEDBANKAsset.Images.makeLanguageFlagName(language: code))
                .resizable()
                .scaledToFit()
                .frame(width: 24)
            Text("Screen.LanguageSelection.\(code)".runtimeLocalized())
                .padding(.leading)
            Spacer()
            if selected {
                Image(systemName: "checkmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14)
                    .foregroundColor(SWEDBANKAsset.Colors.orange1.swiftUIColor)
            }
        }
        .padding(.vertical, 8)
        .contentShape(Rectangle())
    }
}

class LanguageSelectionScreenBottomSheetPreviewVM: LanguageSelectionScreenVM {
    var selectedLanguage: String = "lv"
    var availableLanguages: [String] = ["en", "lv"]
    var router: LanguageSelectionRouter!
}

extension LanguageSelectionScreenBottomSheetPreviewVM {
    func onClose() {}
    func onChangeLanguage(code: String) {}
}
