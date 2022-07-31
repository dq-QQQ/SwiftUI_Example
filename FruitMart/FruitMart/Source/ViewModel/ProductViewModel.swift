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
    
    func getProduct() -> [ProductModel.ProductInfo] {
        model.getProduct()
    }
}
