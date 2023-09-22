//
//  ProductDetails.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 13/09/23.
//

import SwiftUI

struct ProductDetails: View {
    @State var product: ProductBack
    @State var selectedSize: String? = nil
    @State var selectedImage: String
    @State private var selectedImageIndex: Int = 0
    @State private var addToCartDisabled = true
    @State private var image: UIImage? = nil
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var cartData: CartData
    
    func setSelectedImage() {
        selectedImage = product.images.principal
    }
    
    init(product: ProductBack) {
        self._product = State(initialValue: product)
        self._selectedImage = State(initialValue: product.images.principal)
    }
    
    let rows = [GridItem(.fixed(60))]
    
    
    var body: some View {
        VStack (spacing: 0) {
            VStack (spacing: 0) {
                VStack (spacing: 0){
                    if let image = image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 290)
                            .frame(height: 270)
                            .clipShape(Rectangle())
                    } else {
                        Color(white: 0.9)
                            .frame(width: 160, height: 145)
                            .onAppear {
                                loadImageFromURL(imageUrl: product.images.principal)
                            }
                            .cornerRadius(5)
                    }
                    ZStack {
                        Circle()
                            .foregroundColor(.white)
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                        .frame(width: 45, height: 45)
                        .offset(x: -160, y: -225)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                }
                .frame(maxHeight: 190)
                
                
                ScrollView(.horizontal){
                    LazyHGrid(rows: rows) {
                        ForEach(0..<product.images.others.count, id: \.self) { value in
                            AsyncImage(url: URL(string: product.images.others[value])) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 70, height: 50)
                                        .clipShape(Rectangle())
                                        .cornerRadius(3)
                                        .onTapGesture {
                                            selectedImageIndex = value
                                            selectedImage = product.images.others[value]
                                            loadImageFromURL(imageUrl: selectedImage)
                                        }
                                case .failure(let error):
                                    Text("Erro ao carregar a imagem: \(error.localizedDescription)")
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            
                        }
                    }.frame(maxHeight: 74)
                }
                .frame(height: 70)
                .padding(.horizontal, 12)
                .padding(.top, 16)
                
            }
            
            VStack(alignment: .leading) {
                Text(product.categoria)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(product.nome)
                    .font(.system(size: 18))
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: 12, alignment: .leading)
                    .truncationMode(.tail)
                    .padding(.vertical, 4)
                
                Text(product.description)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading) {
                    Text("Tamanhos")
                        .font(.system(size: 18))
                        .bold()
                        .padding(.top, 4)
                    
                    HStack(spacing: 0) {
                        ForEach(0..<product.sizes.count, id: \.self) { value in
                            Text(String(product.sizes[value]))
                                .frame(maxWidth: 60, maxHeight: 42, alignment: .center)
                                .font(.system(size: 14))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(selectedSize == product.sizes[value] ? Color.black : Color("Surface"), lineWidth: 1)
                                        .frame(width: 50, height: 38)
                                )
                                .onTapGesture {
                                    selectedSize = product.sizes[value]
                                }
                        }
                    }
                    
                    
                }
                
            }.padding(.horizontal, 12)
            
            Spacer()
            
            let cartProduct = ProductBack(
//                id_prod: product.id_product,
//                image: product.images.principal,
//                title: product.nome,
//                price: product.price,
//                quantity: 1,
//                selectedSize: selectedSize != nil ? String(product.sizes[selectedSize!]) : ""
                id_product: product.id_product,
                images: product.images,
                qtd_estoque: 1,
                nome: product.nome,
                sizes: product.sizes,
                categoria: product.categoria,
                description: product.description,
                price: product.price
            )
            
            ProductDetailsFooter(product: cartProduct, selectedSize: selectedSize ?? "", addToCartDisabled: $addToCartDisabled)
                .navigationBarBackButtonHidden(true)
                .environmentObject(cartData)
                .onChange(of: selectedSize) { newSize in
                    addToCartDisabled = newSize == nil
                }
            
        }
    }
    
    func loadImageFromURL(imageUrl: String) {
        guard let url = URL(string: imageUrl) else {
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
