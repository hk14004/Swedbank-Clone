//
//  LanguageSelectionScreenBottomSheet.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 28/05/2023.
//

import SwiftUI
import DevToolsUI
import DevToolsLocalization

struct LanguageSelectionScreenBottomSheetView<ViewModel: LanguageSelectionScreenBottomSheetVM>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            makeHeader()
            makeLangList()
        }
    }
}

struct LanguageSelectionScreenBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        RuntimeLocalizedPreview(language: "lv")
        LanguageSelectionScreenBottomSheetView(viewModel: LanguageSelectionScreenBottomSheetPreviewVM())
    }
}

extension LanguageSelectionScreenBottomSheetView {
    @ViewBuilder
    private func makeHeader() -> some View {
        VStack(spacing: 0) {
            Text(L10n.LanguageSelection.title.runtimeLocalized())
                .frame(maxWidth: .infinity)
                .overlay {
                    HStack {
                        Button {
                            viewModel.onClose()
                        } label: {
                            Image(systemName: "x.circle")
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                }
                .padding(8)
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
            Image(Globals.makeLanguageFlagName(language: code))
                .resizable()
                .scaledToFit()
                .frame(width: 24)
            Text(Globals.makeLanguageNameKey(language: code).runtimeLocalized())
                .padding(.leading)
            Spacer()
            if selected {
                Image(systemName: "checkmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14)
                    .foregroundColor(Asset.Colors.color2.swiftUIColor)
            }
        }
        .padding(.vertical, 8)
        .contentShape(Rectangle())
    }
}

class LanguageSelectionScreenBottomSheetPreviewVM {
    var navigationBindings: LanguageSelectionScreenBottomSheetVMNavigationBindings = .init()
    var selectedLanguage: String = "lv"
    var availableLanguages: [String] = ["en", "lv"]
}

extension LanguageSelectionScreenBottomSheetPreviewVM: LanguageSelectionScreenBottomSheetVM {
    
    func onClose() {
        
    }
    
    func onChangeLanguage(code: String) {
        
    }
    
}
