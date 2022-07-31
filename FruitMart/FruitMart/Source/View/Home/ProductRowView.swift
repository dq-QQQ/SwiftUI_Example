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
    
    var body: some View {
        HStack {
            productImage
            productCheck
        }
        .frame(height:150)
        .background(Color.primary.colorInvert())
        .cornerRadius(6)
        .shadow(color:Color.primaryShadow, radius: 6)
    }
}

private extension ProductRowView {
    var productImage: some View {
        Image(product?.imageName ?? "")
            .resizable()
            .scaledToFill()
            .frame(width: 140)
            .clipped()
    }
    
    var productCheck: some View {
        VStack(alignment:.leading) {
            Text(product?.name ?? "nil")
                .font(.headline)
                .fontWeight(.medium)
                .padding(.bottom, 6)
            Text(product?.description ?? "nil")
                .font(.footnote)
            Spacer()
            HStack {
                Text("₩").font(.footnote) +
                Text("\(product?.price ?? 0)")
                    .font(.headline)
                Spacer()
                Image(systemName: "heart")
                Image(systemName: "cart")
            }
        }
        .padding()
    }
}


struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(product: ProductViewModel().choose(0))
    }
}
