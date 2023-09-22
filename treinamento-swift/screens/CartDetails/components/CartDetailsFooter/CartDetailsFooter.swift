//
//  CartDetailsFooter.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 14/09/23.
//

import Foundation
import SwiftUI

struct CartDetailsFooter: View {
    @State var buttonLabel: String
//    var buttonAction: () -> Void
    
    var body: some View {
        VStack {
            Divider()
             .frame(height: 1)
             .padding(.horizontal, 30)
             .background(Color("Surface"))
            HStack(spacing: 10) {
                HStack {
                    Text("\(buttonLabel)")
                        .font(.system(size: 14))
                }
                .padding(.horizontal, 20)
                .frame(height: 45)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .background(Color.black)
                .cornerRadius(6)
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 10)
        }
        
    }
}
