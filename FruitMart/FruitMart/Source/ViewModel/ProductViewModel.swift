//
//  ProductViewModel.swift
//  FruitMart
//
//  Created by Kyu jin Lee on 2022/07/31.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published private var model = ProductModel(filename: "ProductData.json")
    
    func choose(_ i: Int) -> ProductModel.ProductInfo? {
        if let product = model.choose(i) {
            return product
        } else {
            return nil
        }
    }
    
    func toggleFavorite(of product: ProductModel.ProductInfo) {
        model.toggleFavorite(of: product)
    }
    
    func imageNameByFavorite(of product: ProductModel.ProductInfo) -> String {
        product.isFavorite ? "heart.fill": "heart"
    }
    
    func getProduct() -> [ProductModel.ProductInfo] {
        model.getProduct()
    }
}
