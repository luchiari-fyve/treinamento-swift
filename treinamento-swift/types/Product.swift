//
//  Product.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 13/09/23.
//

import Foundation
import SwiftUI

struct Product: Identifiable {
    let id: String
    let mainImageUrl: String
    let category: String
    let title: String
    let price: Double
    let description: String
    let otherImagesUrl: [String]
    let sizes: [String]
    let storageQuantity: Int
}
