//
//  Product.swift
//  FruitMart
//
//  Created by Kyu jin Lee on 2022/07/31.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import Foundation

struct ProductModel {
    private var products: [ProductInfo]
    
    init(filename: String) {
        self.products = Bundle.main.decode(filename: filename, as: [ProductInfo].self)
    }
    
    mutating func toggleFavorite(of product: ProductInfo) {
        guard let index = products.firstIndex(of: product) else {
            return
        }
        products[index].isFavorite.toggle()
    }
    
    func choose(_ i: Int) -> ProductInfo? {
        if i < products.count {
            return products[i]
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
        products
    }
    
    struct ProductInfo: Decodable, Identifiable, Equatable {
        var id: String { name }
        let name: String
        let imageName: String
        let price: Int
        let description: String
        var isFavorite: Bool = false
//        var quantity: Int = 1
    }
}
