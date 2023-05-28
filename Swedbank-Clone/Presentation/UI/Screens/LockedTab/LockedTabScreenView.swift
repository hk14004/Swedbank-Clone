//
//  LockedTabScreenView.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 27/05/2023.
//

import SwiftUI
import DevToolsUI
import Localize_Swift

struct LockedTabScreenView<ViewModel: LockedTabScreenVM>: View {
    
    @ObservedObject var viewModel: ViewModel
    
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
                Image(viewModel.tabDescriptionIconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 200)
                Text(viewModel.title.localized())
                    .font(.title)
                    .foregroundColor(Asset.Colors.color3.swiftUIColor)
                    .padding(.top)
                Text(viewModel.subtitle.localized())
                    .padding(.top)
            }
            .layoutPriority(1)
            Spacer()
            LoginButtonView(action: {
                viewModel.onAuthTapped()
            })
            .padding(.vertical)
        }
        .padding()
        .background(Color(viewModel.backgroundColorName))
        .navigationBarHidden(true)
    }
}

struct LockedTabView_Previews: PreviewProvider {
    static var previews: some View {
        LocalizedPreview()
        LockedTabScreenView(viewModel: LockedTabScreenVMPreview())
    }
}

private class LockedTabScreenVMPreview {

    var navigationBindings: LockedTabScreenVMNavigationBindings = .init()
    
    var backgroundColorName: String = "color4"
    
    var tabDescriptionIconName: String = Asset.Images.Icons.icOverviewDescription.name
    
    var title: String = "LockedTab.Overview.title"
    
    var subtitle: String = "LockedTab.Overview.subtitle"
    
}

extension LockedTabScreenVMPreview: LockedTabScreenVM {
    func onLanguageChangeTap() {
        
    }
    func onAuthTapped() {
        
    }
}
