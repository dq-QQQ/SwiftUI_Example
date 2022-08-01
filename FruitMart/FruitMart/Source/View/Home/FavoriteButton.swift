//
//  FavoriteButton.swift
//  FruitMart
//
//  Created by Kyu jin Lee on 2022/08/01.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject private var viewModel: ProductViewModel
    let product: ProductModel.ProductInfo
    
    var body: some View {
        Button(action: {
            self.viewModel.toggleFavorite(of: self.product)
        }) {
            Image(systemName: viewModel.imageNameByFavorite(of: product))
                .imageScale(.large)
                .foregroundColor(.peach)
                .frame(width: 32, height: 32)
                .onTapGesture {
                    self.viewModel.toggleFavorite(of: self.product)
                }
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(product: ProductViewModel().choose(0)!)
    }
}
