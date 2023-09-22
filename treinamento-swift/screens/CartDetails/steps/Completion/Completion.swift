//
//  Completion.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 14/09/23.
//

import Foundation
import SwiftUI

struct Completion: View {
    @State private var currentStep: Int = 3
    let totalSteps = CartConstants.CART_STEPS
    
    var body: some View {
        CartDetailsHeader(title: "Concluído", currentStep: currentStep, totalSteps: totalSteps)
        VStack (alignment: .center) {
            Image(systemName: "checkmark.seal")
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .padding(.bottom, 4)
            Text("Pedido finalizado com sucesso").font(.system(size: 16)).padding(.vertical, 4)
            Text("Para acompanhar os seus pedidos basta acessar o menu pedidos dentro do aplicativo")
                .font(.system(size: 14))
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 16)
                .padding(.horizontal, 16)
            Spacer()
        }.padding(.vertical, 56)
        
        NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
            CartDetailsFooter(buttonLabel: "Concluir")
        }
    }
    
}
