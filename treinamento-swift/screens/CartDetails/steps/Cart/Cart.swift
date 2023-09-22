//
//  Cart.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 14/09/23.
//

import Foundation
import SwiftUI

struct Cart: View {
    @State private var cartProducts: [CartProductFromBackend] = []
    @State private var currentStep: Int = 1
    let totalSteps = CartConstants.CART_STEPS
    @EnvironmentObject var cartData: CartData
    @State var isLoading: Bool = true
    @State var isButtonDisabled = false
    let userId = "0017"
    let columns = [GridItem()]
    
    var body: some View {
        CartDetailsHeader(title: "Carrinho", additional: "Limpar", currentStep: currentStep, totalSteps: totalSteps)
        VStack (alignment: .leading) {
            VStack {
                ScrollView(.vertical) {
//                    LazyVGrid(columns: columns, spacing: 12) {
//                        ForEach(cartProducts, id: \.id_product) { product in
//                            CartProductCard(product: product)
//                        }
//                    }
//                    .padding(.horizontal, 18)
                    if (isLoading) {
                        VStack(spacing: 12) {
                            ForEach(0..<3, id: \.self) { _ in
                                CartCardSkeletonView().padding(.horizontal, 12)
                            }
                        }
                    } else {
                        if (cartData.productsInCart.isEmpty) {
                            Text("Nada por aqui...")
                                .font(.system(size: 18))
                                .foregroundColor(Color.gray)
                                .onAppear(perform: setButtonDisabled)
                        }
                        else {
                            ForEach(cartData.productsInCart, id: \.id_product) { product in
                                CartProductCard(product: product).environmentObject(cartData)
                            }
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .padding(.top, 12)
            }
            
            Spacer()
        }
        .onAppear {
            cartData.getAllProductsFromCart {
                isLoading = false
            }
        }
        
        NavigationLink(destination: Address().navigationBarBackButtonHidden(true)) {
            CartDetailsFooter(buttonLabel: "Continuar")
        }
    }
    
    private func setButtonDisabled() {
        isButtonDisabled = true
    }
}
