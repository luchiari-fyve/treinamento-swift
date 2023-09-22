//
//  Header.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 12/09/23.
//

import SwiftUI

struct Header: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.gray)
                TextField("Pesquisar...", text: $searchText)
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(Color.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color("Surface"), lineWidth: 1)
            )
            
                
            Spacer()
            Circle()
                .frame(width: 40, height: 40)
                .foregroundColor(Color.black)
            
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .frame(height: 65)
        
        Divider()
         .frame(height: 1)
         .padding(.horizontal, 30)
         .background(Color("Surface"))
    }
    
}
