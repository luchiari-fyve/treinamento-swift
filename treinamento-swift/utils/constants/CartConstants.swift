//
//  CartConstants.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 20/09/23.
//

import Foundation

struct CartConstants {
    static let CART_STEPS = 3
    static let USER_ID = "0017"
    static let API_URL = "https://rluihpcsg3.execute-api.us-east-1.amazonaws.com/v1/"
    static let API_PRODUCTS = API_URL + "products/"
    static let API_CART = API_URL + "cart?id_user=\(USER_ID)"
}
