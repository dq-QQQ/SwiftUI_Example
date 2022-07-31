//
//  Product.swift
//  FruitMart
//
//  Created by Kyu jin Lee on 2022/07/31.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import Foundation

struct ProductModel {
    private var product: [ProductInfo]
    
    
    init(filename: String) {
        self.product = Bundle.main.decode(filename: filename, as: [ProductInfo].self)
    }
    
    func choose(_ i: Int) -> ProductInfo? {
        if i < product.count {
            return product[i]
        } else {
            return nil
        }            
    }
    /* choose 이용해서는 이렇게 사용가능
     VStack {
         ProductRowView(product: viewModel.choose(0))
         ProductRowView(product: viewModel.choose(1))
         ProductRowView(product: viewModel.choose(2))
     }
     */
    
    func getProduct() -> [ProductInfo] {
        product
    }
    
    struct ProductInfo: Decodable, Identifiable {
        var id: String { name }
        let name: String
        let imageName: String
        let price: Int
        let description: String
        var isFavorite: Bool = false
    }
}
