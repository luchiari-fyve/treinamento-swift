//
//  Counter.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 15/09/23.
//

import Foundation
import SwiftUI

struct Counter: View {
    @Binding var quantityCounter: Int
    
    var body: some View {
        HStack {
            VStack {
                Image(systemName: "minus")
            }
                .frame(width: 15, height: 20)
                .onTapGesture {
                    decreaseProductQuantity()
                }
            
            Text("\(quantityCounter)")
            
            VStack {
                Image(systemName: "plus")
            }
                .frame(width: 15, height: 20)
                .onTapGesture {
                    increaseProductQuantity()
                }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color("Surface"), lineWidth: 1)
                .frame(width: 80, height: 40)
        )
    }
    
    private func increaseProductQuantity() {
        quantityCounter += 1
    }
    
    private func decreaseProductQuantity() {
        if quantityCounter > 1 {
            quantityCounter -= 1
        }
    }
}
