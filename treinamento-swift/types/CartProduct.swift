//
//  CartProduct.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 14/09/23.
//

import Foundation
import SwiftUI

protocol CartProduct: Hashable {
    var quantity: Int { get set }
    var selectedSize: String { get set }
}

struct ConcreteCartProduct: CartProduct {
    let id: String
    let image: String
    let title: String
    let price: Double
    var quantity: Int
    var selectedSize: String
}
