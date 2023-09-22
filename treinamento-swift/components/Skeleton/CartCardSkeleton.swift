//
//  CartCardSkeleton.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 20/09/23.
//

import Foundation
import SwiftUI

struct CartCardSkeletonView: View {
    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.3))
                .frame(width: 95, height: 110)
                .cornerRadius(5)
            VStack(alignment: .leading){
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.3))
                    .frame(height: 30)
                    .cornerRadius(2)
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.3))
                    .frame(width: 60, height: 24)
                    .cornerRadius(2)
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.3))
                    .frame(width: 70, height: 30)
                    .cornerRadius(2)
            }
        }
    }
}
