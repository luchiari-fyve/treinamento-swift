//
//  CartDetailsHeader.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 14/09/23.
//

import Foundation
import SwiftUI

struct CartDetailsHeader: View {
    @State var title: String
    @State var additional: String?
    @State var currentStep: Int
    @State var totalSteps: Int
    @Environment(\.presentationMode) var presentationMode
   
    var body: some View {
        VStack {
            HStack(){
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                Spacer()
                Text(title)
                    .font(.system(size: 14))
                Spacer()
                Text(additional ?? "         ")
                    .font(.system(size: 10))
                    .foregroundColor(Color.gray)
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            
            GeometryReader { geometry in
                Rectangle()
                    .frame(maxWidth: CGFloat(currentStep) * geometry.size.width / CGFloat(totalSteps) )
                    .frame(height: 5)
            }
        }.frame(height: 55)
    }
    
}
