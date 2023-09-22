//
//  Address.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 15/09/23.
//

import Foundation
import SwiftUI

struct Address: View {
    @State var CEPValue: String = ""
    @State var logValue: String = ""
    @State var numValue: String = ""
    @State var bairroValue: String = ""
    @State var compValue: String = ""
    @State var cidValue: String = ""
    @State var estValue: String = ""
    @State private var currentStep: Int = 2
    let totalSteps = CartConstants.CART_STEPS
    
    var body: some View {
        CartDetailsHeader(title: "Endereço", currentStep: currentStep, totalSteps: totalSteps)
        VStack {
            TitledInput(title: "CEP", size: 1, padding: 16, value: $CEPValue).padding(.bottom, 8)
            HStack {
                TitledInput(title: "Logradouro", size: 0.7, padding: 12, value: $logValue)
                TitledInput(title: "Número", size: 0.3, padding: 12, value: $numValue)
            }.padding(.bottom, 8)
            TitledInput(title: "Bairro", size: 1, padding: 16, value: $bairroValue).padding(.bottom, 8)
            TitledInput(title: "Complemento", size: 1, padding: 16, value: $compValue).padding(.bottom, 8)
            HStack {
                TitledInput(title: "Cidade", size: 0.7, padding: 12, value: $cidValue)
                TitledInput(title: "Estado", size: 0.3, padding: 12, value: $estValue)
            }
            Spacer()

        }.padding(.top, 16)
        
        NavigationLink(destination: Completion().navigationBarBackButtonHidden(true)) {
            CartDetailsFooter(buttonLabel: "Finalizar")
        }
    }
}
