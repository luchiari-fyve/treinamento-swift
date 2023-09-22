//
//  Footer.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 12/09/23.
//

import SwiftUI

struct Footer: View {
    var body: some View {
        Spacer(minLength: 0)
        Divider()
         .frame(height: 1)
         .padding(.horizontal, 30)
         .background(Color("Surface"))
        HStack {
            VStack {
                Text(.init(systemName: "square.grid.2x2"))
                Text("Listagem")
                    .font(.system(size: 12))
            }
            Spacer()
            VStack {
                Text(.init(systemName: "list.clipboard")).foregroundColor(Color.gray)
                Text("Pedidos")
                    .font(.system(size: 12))
                    .foregroundColor(Color.gray)
            }
        }
        .padding(.horizontal, 45)
        .padding(.vertical, 10)
    }
}
