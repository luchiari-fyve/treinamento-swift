//
//  CartProductCard.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 14/09/23.
//

import Foundation
import SwiftUI

struct CartProductCard: View {
    @State var product: CartProductFromBackend
    @State private var image: UIImage? = nil
    @State private var isLoadingImage = true
    @EnvironmentObject var cartData: CartData

    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2

        let formattedValue = formatter.string(from: NSNumber(value: product.amount))

        return ("\(formattedValue ?? "")")
    }

    var body: some View {
        HStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 95, height: 110)
                    .clipShape(Rectangle())
                    .cornerRadius(5)
            } else {
                Color(white: 1)
                    .frame(width: 95, height: 110)
                    .cornerRadius(5)
                    .onAppear(perform: loadImageFromURL)
            }
            VStack(alignment: .leading) {
                VStack {
                    Text(product.name)
                        .font(.system(size: 16))
                        .foregroundColor(Color.black)
                        .frame(height: 12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .truncationMode(.tail)
                    Text("R$ \(formattedPrice)")
                        .font(.system(size: 14))
                        .foregroundColor(Color.green)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Spacer()
                HStack {
                    Counter(quantityCounter: .constant(Int(product.qtd_product) )).padding(.leading, 12)
                    Spacer()
                    ZStack {
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .overlay(
                                Circle()
                                    .stroke(Color("Surface"), lineWidth: 1)
                            )

                        Image(systemName: "trash")
                            .foregroundColor(.black)
                            .onTapGesture {
//                                API.updateProductInCart(idUser: "0017", idProduct: product.id_product, quantity: 0, size: "") { success, error in
//                                    if success {
//                                        print("Produto removido do carrinho com sucesso!")
//                                    } else {
//                                        print("Erro ao remover o produto ao carrinho: \(error?.localizedDescription ?? "Erro desconhecido")")
//                                    }
//                                }
                                print("sadsdasdadadasd")
                                cartData.removeProductFromCart(product: product)
                                
                            }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.vertical, 8)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 110)
        .padding(.horizontal, 12)
    }
    
    func loadImageFromURL() {
            guard let url = URL(string: product.image) else {
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data, error == nil {
                    if let uiImage = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.image = uiImage
                        }
                    }
                }
            }.resume()
        }
}
