//
//  Footer.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 13/09/23.
//

import SwiftUI

struct ProductDetailsFooter: View {
    @State var product: ProductBack
    @State private var quantityCounter = 1
    @State var selectedSize: String
    @Binding var addToCartDisabled: Bool
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var cartData: CartData
    
    var body: some View {
        let formattedPrice = String(format: "R$ %.2f", calculateTotalPrice())
        Divider()
         .frame(height: 1)
         .padding(.horizontal, 30)
         .background(Color("Surface"))
        HStack(spacing: 10) {
            Counter(quantityCounter: $quantityCounter)
            Spacer()
            HStack {
                Text("Adicionar")
                Spacer()
                Text("\(formattedPrice)")
                
            }
                .padding(.horizontal, 20)
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .background(addToCartDisabled ? Color.gray : Color.black)
                .cornerRadius(6)
                .onTapGesture {
                    cartData.addProductToCart(product: product, quantity: quantityCounter, selectedSize: selectedSize)
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(addToCartDisabled)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
    }
    
    private func increaseProductQuantity() {
        quantityCounter += 1
    }
    
    private func decreaseProductQuantity() {
        if quantityCounter > 1 {
            quantityCounter -= 1
        }
    }
    
    private func calculateTotalPrice() -> Double {
        return product.price * Double(quantityCounter)
    }
}
