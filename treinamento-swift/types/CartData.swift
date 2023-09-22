//
//  CartData.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 15/09/23.
//

import Foundation
import SwiftUI

class CartData: ObservableObject {
    @Published var productsInCart: [CartProductFromBackend] = []
    let USER_ID = CartConstants.USER_ID
    let API_URL = CartConstants.API_URL
    let API_CART = CartConstants.API_CART
    
    func getAllProductsFromCart(completion: @escaping () -> Void) {
        guard let url = URL(string: API_CART) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    let products = try JSONDecoder().decode([CartProductFromBackend].self, from: data)
                    DispatchQueue.main.async {
                        self.productsInCart = products
                        completion()
                    }
                } catch {
                    print("Erro ao decodificar o JSON recebido: \(error)")
                }
            }
        }.resume()
    }
    
    func addProductToCart(product: ProductBack, quantity: Int, selectedSize: String) {
        guard var urlComponents = URLComponents(string: "https://rluihpcsg3.execute-api.us-east-1.amazonaws.com/v1/cart?") else {
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "id_user", value: USER_ID),
            URLQueryItem(name: "id_product", value: product.id_product),
            URLQueryItem(name: "qtd_product", value: String(quantity)),
            URLQueryItem(name: "action", value: "add"),
            URLQueryItem(name: "size", value: selectedSize)
        ]
        
        guard let url = urlComponents.url else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erro ao enviar a requisição: \(error.localizedDescription)")
            } else if let data = data {
                if String(data: data, encoding: .utf8) != nil {
                    DispatchQueue.main.async {
                    }
                }
            }
        }.resume()
    }
    
    func removeProductFromCart(product: CartProductFromBackend) {
        guard var urlComponents = URLComponents(string: "https://rluihpcsg3.execute-api.us-east-1.amazonaws.com/v1/cart?") else {
            return
        }

        urlComponents.queryItems = [
            URLQueryItem(name: "id_user", value: USER_ID),
            URLQueryItem(name: "id_product", value: product.id_product),
            URLQueryItem(name: "qtd_product", value: String(product.qtd_product)),
            URLQueryItem(name: "action", value: "remove"),
            URLQueryItem(name: "size", value: product.size)
        ]

        guard let url = urlComponents.url else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erro ao enviar a requisição: \(error.localizedDescription)")
            } else if let data = data {
                if let responseMessage = String(data: data, encoding: .utf8) {
                }
            }
        }.resume()
        getAllProductsFromCart{}
    }
    
    func getAmountOfProducts() -> Int {
        return productsInCart.reduce(0) { $0 + $1.qtd_product }
    }
    
    func getTotalPrice() -> Double {
        return productsInCart.reduce(0.0) { $0 + ($1.amount * Double($1.qtd_product)) }
    }
    
//    func addToCart(_ product: ConcreteCartProduct) {
//        productsInCart.append(product)
//        API.addProductToCart(idUser: USER_ID, idProduct: product.id, quantity: product.quantity, size: product.selectedSize) { success, error in
//            if success {
//                print("CARTDATA: Produto adicionado ao carrinho com sucesso!")
//            } else {
//                print("CARTDATA: Erro ao adicionar o produto ao carrinho: \(error?.localizedDescription ?? "Erro desconhecido")")
//            }
//        }
//    }
//
//    func removeFromCart(_ product: ConcreteCartProduct) {
//        if let index = productsInCart.firstIndex(of: product) {
//            productsInCart.remove(at: index)
//        }
//        API.updateProductInCart(idUser: USER_ID, idProduct: product.id, quantity: 0, size: "") { success, error in
//            if success {
//                print("CARTDATA: Produto removido do carrinho com sucesso!")
//            } else {
//                print("CARTDATA: Erro ao remover o produto do carrinho: \(error?.localizedDescription ?? "Erro desconhecido")")
//            }
//        }
//
//    }
//
//    func removeAllFromCart() {
//        productsInCart.removeAll()
//
//    }
//
//    func getAllFromCart() -> [ConcreteCartProduct] {
//        API.getProductsInCart(idUser: USER_ID) { productList, error in
//            if let productList = productList {
//                productsInCart = productList
//            } else {
//                print("Erro CARTDATA ao obter produtos no carrinho: \(error?.localizedDescription ?? "Erro desconhecido")")
//            }
//        }
//        return productsInCart
//    }
}
