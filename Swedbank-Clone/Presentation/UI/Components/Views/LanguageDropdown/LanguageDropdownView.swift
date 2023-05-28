//
//  LanguageDropdownView.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 28/05/2023.
//

import SwiftUI
import Localize_Swift
import DevToolsUI

struct LanguageDropdownView: View {
    var body: some View {
        VStack {
            HStack {
                makeFlagImageView()
                Image(systemName: "chevron.down")
            }
        }
    }
}

struct LanguageDropdownView_Previews: PreviewProvider {
    static var previews: some View {
        LocalizedPreview()
        LanguageDropdownView()
    }
}

extension LanguageDropdownView {
    @ViewBuilder
    private func makeFlagImageView() -> some View {
        Image(Globals.makeLanguageFlagName(language: Localize.currentLanguage()))
            .resizable()
            .scaledToFit()
            .frame(width: 20)
    }
}
