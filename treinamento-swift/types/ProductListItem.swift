//
//  File.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 15/09/23.
//

import Foundation
import SwiftUI

struct ProductListItem: Identifiable, Hashable {
    let id: String
    let image: String
    let title: String
    let price: Double
    var quantity: Int

    init(from product: Product, quantity: Int) {
        self.id = product.id
        self.image = product.mainImageUrl
        self.title = product.title
        self.price = product.price
        self.quantity = quantity
    }
    
    func hash(into hasher: inout Hasher) {
           hasher.combine(id)
       }
}
