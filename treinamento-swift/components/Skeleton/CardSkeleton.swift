//
//  CardSkeleton.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 18/09/23.
//

import Foundation
import SwiftUI

struct CardSkeletonView: View {
    let isLoading: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.3))
                .frame(width: 160, height: 145)
                .cornerRadius(5)
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.3))
                .frame(width: 160, height: 30)
                .cornerRadius(2)
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.3))
                .frame(width: 80, height: 22)
                .cornerRadius(2)
        }
    }
}
