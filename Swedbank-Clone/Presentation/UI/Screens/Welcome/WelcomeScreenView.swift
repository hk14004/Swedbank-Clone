//
//  WelcomeScreenView.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 17/05/2023.
//

import SwiftUI

struct WelcomeScreenView<ViewModel: WelcomeScreenVM>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            makeBackgroundView()
            makeCenterView()
            VStack {
                Spacer()
                makeMenuStackView()
                    .padding(.horizontal)
            }
        }
    }
    
}

extension WelcomeScreenView {
    @ViewBuilder
    private func makeBackgroundView() -> some View {
        Rectangle()
            .foregroundColor(.black)
            .edgesIgnoringSafeArea(.all)
            .overlay {
                Image(Asset.Images.Background.welcomeBackground.name)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.8)
            }
    }
    
    @ViewBuilder
    private func makeCenterView() -> some View {
        Text("Welcome")
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.black)
    }
    
    @ViewBuilder
    private func makeMenuStackView() -> some View {
        VStack {
            Button {
                viewModel.onAlreadyCustomerTapped()
            } label: {
                Text("Already a customer")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Asset.Colors.color1.swiftUIColor)
                    .cornerRadius(8)
            }
            
            Button {
                viewModel.onAlreadyCustomerTapped()
            } label: {
                Text("Become a customer")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(8)
            }
        }
    }
}
