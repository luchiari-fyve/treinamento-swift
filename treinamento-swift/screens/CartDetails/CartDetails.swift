////
////  CartDetails.swift
////  treinamento-swift
////
////  Created by Laura Ranucci Luchiari on 14/09/23.
////
//
//import Foundation
//import SwiftUI
//
//struct CartDetails: View {
//    @State private var currentStep: Int = 1
//    @Binding var isPresented: Bool
//
//    let totalSteps = CartConstants.CART_STEPS
//
//    func changeCurrentStep() {
//        if (currentStep == totalSteps) {
//            print("final")
//            isPresented = false
//        }
//        else if (currentStep < totalSteps) {
//            currentStep += 1
//        }
//    }
//
//    var body: some View {
//        NavigationView {
//            Divider()
//                .frame(height: 1)
//                .padding(.horizontal, 30)
//                .background(Color("Surface"))
//
//
//            HStack(spacing: 10) {
//                HStack {
//                    Text("Continuar")
//                        .font(.system(size: 14))
//                }
//                .padding(.horizontal, 20)
//                .frame(height: 45)
//                .frame(maxWidth: .infinity)
//                .foregroundColor(Color.white)
//                .background(Color.black)
//                .cornerRadius(6)
//                .onTapGesture {
//                    changeCurrentStep()
//                }
//
//            }
//            .padding(.horizontal, 30)
//            .padding(.vertical, 10)
//        }
//    }
//}
