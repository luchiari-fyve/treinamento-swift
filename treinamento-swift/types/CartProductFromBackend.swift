//
//  CartProductFromBackend.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 22/09/23.
//

import Foundation

struct CartProductFromBackend: Equatable, Decodable {
    let id_product: String
    let size: String
    let qtd_product: Int
    let image: String
    let date_expiration: String?
    let category: String
    let amount: Double
    let id_user: String
    let actived: Bool
    let name: String
}
