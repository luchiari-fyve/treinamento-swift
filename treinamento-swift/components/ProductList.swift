////
////  ProductList.swift
////  treinamento-swift
////
////  Created by Laura Ranucci Luchiari on 21/09/23.
////
//
//import Foundation
//import SwiftUI
//
//struct ProductList: View {
//    @State var filteredProducts: [ProductBack]
//    let columns = [GridItem(), GridItem()]
//    
//    
//    var body: some View {
//        ScrollView(.vertical) {
//            LazyVGrid(columns: columns, spacing: 12) {
//                ForEach(filteredProducts, id: \.id) { product in
//                    NavigationLink(destination: ProductDetails(product: product)){
//                        Card(product: product)
//                    }.buttonStyle(PlainButtonStyle()) // Adicione isso para remover o conflito
//                }
//            }
//            .padding(.horizontal, 18)
//        }
//        .scrollContentBackground(.hidden)
//    }
//}
