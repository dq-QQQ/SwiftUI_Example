//
//  ProductRowView.swift
//  FruitMart
//
//  Created by Kyu jin Lee on 2022/07/31.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import SwiftUI

struct ProductRowView: View {
    let product: ProductModel.ProductInfo?
    @EnvironmentObject var orderViewModel: OrderViewModel
    @State private var willAppear: Bool = false
//    @Binding var quickOrder: ProductModel?
    
    var body: some View {
        HStack {
            productImage
            productCheck
        }
        .frame(height:150)
        .background(Color.primary.colorInvert())
        .cornerRadius(6)
        .shadow(color:Color.primaryShadow, radius: 6)
        .opacity(willAppear ? 1 : 0)
        .onAppear() {
            withAnimation {
                self.willAppear = true
            }
        }
    }
}

private extension ProductRowView {
    var productImage: some View {
        Image("")
            .resizable()
            .scaledToFill()
            .frame(width: 100)
            .clipped()
    }
    
    var productCheck: some View {
        VStack(alignment:.leading) {
            Text("")
                .font(.headline)
                .fontWeight(.medium)
                .padding(.bottom, 6)
            Text("")
                .font(.footnote)
//            Spacer()
//            HStack {
//                Text("₩").font(.footnote) +
//                Text("\(product?.price ?? 0)")
//                    .font(.headline)
//                Spacer()
//                FavoriteButton(product: product!)
//                Button(action : {}) {
//                    Image(systemName: "cart")
//                        .onTapGesture { orderViewModel.placeOrder(product: product!, quantity: 1) }
//                }
//                .buttonStyle(ShrinkButtonStyle())
//            }
        }
        .padding()
    }
    
}


struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(product: ProductViewModel().choose(0))
            .environmentObject(ProductViewModel())
    }
}
