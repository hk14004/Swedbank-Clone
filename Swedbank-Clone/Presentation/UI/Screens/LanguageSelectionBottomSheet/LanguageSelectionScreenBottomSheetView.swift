//
//  LanguageSelectionScreenBottomSheet.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 28/05/2023.
//

import SwiftUI
import DevToolsUI
import Localize_Swift

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
        LocalizedPreview(langCode: "lv")
        LanguageSelectionScreenBottomSheetView(viewModel: LanguageSelectionScreenBottomSheetPreviewVM())
    }
}

extension LanguageSelectionScreenBottomSheetView {
    @ViewBuilder
    private func makeHeader() -> some View {
        VStack(spacing: 0) {
            Text("LanguageSelection.title".localized())
                .frame(maxWidth: .infinity)
                .overlay {
                    HStack {
                        Button {
                            
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
            makeLanguageRow(code: code)
        }
        .listStyle(.plain)
    }
    
    @ViewBuilder
    private func makeLanguageRow(code: String) -> some View {
        HStack(alignment: .center, spacing: 0) {
            Image(Globals.makeLanguageFlagName(language: code))
                .resizable()
                .scaledToFit()
                .frame(width: 24)
            Text(code)
                .padding(.leading)
        }
        .padding(.vertical, 8)
    }
}

class LanguageSelectionScreenBottomSheetPreviewVM {
    var selectedLanguage: String = "lv"
    var availableLanguages: [String] = ["en", "lv"]
}

extension LanguageSelectionScreenBottomSheetPreviewVM: LanguageSelectionScreenBottomSheetVM {
    func onClose() {
        
    }
    
    func onChangeLanguage(code: String) {
        
    }
    
}
