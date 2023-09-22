//
//  ProductBack.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 21/09/23.
//

import Foundation

struct ProductResponse: Decodable {
    let products: [ProductBack]
}

struct ProductBack: Decodable {
    let id_product: String
    let images: ProductImages
    let qtd_estoque: Int
    let nome: String
    let sizes: [String]
    let categoria: String
    let description: String
    let price: Double
}

struct ProductImages: Decodable {
    let principal: String
    let others: [String]
}
