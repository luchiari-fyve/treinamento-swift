//
//  TitledInput.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 15/09/23.
//

import Foundation
import SwiftUI

struct TitledInput: View {
  let title: String
  let size: Double
  let padding: Double
  @Binding var value: String
    
  var body: some View {
    VStack(alignment: .leading){
      Text(title)
        .font(.caption)
        .foregroundColor(Color.black)
        .fontWeight(.medium)
      TextField(title, text: $value)
        .font(.system(size: 16))
        .foregroundColor(Color.gray)
        .padding(10)
        .overlay(
          RoundedRectangle(cornerRadius: 4)
            .stroke(Color("Surface"), lineWidth: 1)
        )
    }
    .frame(width: (UIScreen.main.bounds.width * size) - padding)
  }
}
