//
//  ContentView.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 12/09/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State private var isCartDisplayed = false
    @State private var searchText = ""
    @State var isLoading = true
    
    @State private var products: [ProductBack] = []
    @State private var productsInCart: [CartProductFromBackend] = []
    
    @EnvironmentObject var cartData: CartData
    
    let columns = [GridItem(), GridItem()]
    
    var filteredProducts: [ProductBack] {
        if searchText.isEmpty {
            return products
        } else {
            return products.filter { product in
                return product.nome.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Header(searchText: $searchText)
                
                HStack {
                    HStack {
                        Text("Todos os produtos")
                            .font(.system(size: 16))
                        Text("(3 produtos)")
                            .font(.system(size: 12))
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
                    Text("Visualizar todos")
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 24)
                .padding(.top, 8)
                
                if (isLoading) {
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(0..<3, id: \.self) {_ in
                            VStack() {
                                CardSkeletonView(isLoading: isLoading)
                                    .frame(maxWidth: .infinity)
                            }.frame(height: 220)
                        }
                        
                    }
                } else {
                    ScrollView{
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(filteredProducts, id: \.id_product) { product in
                                NavigationLink(destination: ProductDetails(product: product).environmentObject(cartData)) {
                                    Card(product: product)
                                }
                            }
                        }
                    }
                    
                }
                
                Spacer()
                
                NavigationLink(destination: Cart().navigationBarBackButtonHidden(true).environmentObject(cartData)) {
                    let formattedPrice = String(format: "R$ %.2f", cartData.getTotalPrice())
                    
                    HStack {
                        HStack {
                            Image(systemName: "cart")
                            Text("Visualizar carrinho")
                        }
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                            Text("\(cartData.getAmountOfProducts())")
                                .font(.system(size: 10))
                                .foregroundColor(.black)
                        }
                        .frame(width: 13, height: 13)
                        .offset(x: -163, y: -8)
                        Spacer()
                        Text(formattedPrice)
                    }
                    .padding(.horizontal, 20)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                }
                
                Footer()
            }
            .onAppear {
                fetchProducts()
                cartData.getAllProductsFromCart{}
            }
        }
    }
    
    func fetchProducts() {
        guard let url = URL(string: "https://rluihpcsg3.execute-api.us-east-1.amazonaws.com/v1/products") else{
            return
        }
        URLSession.shared.dataTask(with: url) {data, _, error in
            if let error = error{
                print(error.localizedDescription)
            }
            else if let data = data {
                do {
                    let productResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.products = productResponse.products
                        self.isLoading = false
                    }
                } catch {
                    print("Erro ao decodificar o JSON e trazer os produtos. Erro: \(error) Local do erro: \(error.localizedDescription)")
                }
                
            }
        }.resume()
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
