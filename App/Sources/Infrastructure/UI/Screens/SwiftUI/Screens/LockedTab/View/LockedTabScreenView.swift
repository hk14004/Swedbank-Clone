//
//  LockedTabScreenView.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 27/05/2023.
//

import SwiftUI
import DevToolsUI
import SwedInterfaceAdapters

struct LockedTabScreenView<ViewModel: LockedDashboardVM>: View {
    
    @ObservedObject var viewModel: ViewModel
    @ObservedObject var loc = AppLocalizationObserver()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                LanguageDropdownView()
                    .onTapGesture {
                        viewModel.onLanguageChangeTap()
                    }
            }
            
            Spacer()
            Group {
                Image(viewModel.presentation.tabDescriptionIconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 200)
                Text(viewModel.presentation.title.runtimeLocalized())
                    .font(.title)
                    .foregroundColor(Colors.orange1.swiftUIColor)
                    .padding(.top)
                Text(viewModel.presentation.subtitle.runtimeLocalized())
                    .padding(.top)
            }
            .layoutPriority(1)
            Spacer()
            LoginButtonView(action: {
                viewModel.onLoginTapped()
            })
            .padding(.vertical)
        }
        .padding()
        .background(Color(viewModel.presentation.backgroundColorName).ignoresSafeArea())
        .navigationBarHidden(true)
    }
}

struct LockedTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppLocalizedPreview(language: "lv")
        LockedTabScreenView(viewModel: LockedTabScreenVMPreview())
    }
}

private class LockedTabScreenVMPreview {

    var presentation: SwedInterfaceAdapters.LockedDashboardPresentationConfig {
        .init(title: "Screen.LockedTab.Overview.title", subtitle: "Screen.LockedTab.Overview.subtitle", backgroundColorName: "White3", tabDescriptionIconName: "ic_overview_description")
    }
    var router: LockedDashboardRouter!
    
}

extension LockedTabScreenVMPreview: LockedDashboardVM {
    
    
    func onLoginTapped() {
        
    }
    
    func onLanguageChangeTap() {
        
    }

}
