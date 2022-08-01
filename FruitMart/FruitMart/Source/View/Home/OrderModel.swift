//
//  OrderModel.swift
//  FruitMart
//
//  Created by Kyu jin Lee on 2022/08/01.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import Foundation

struct OrderModel: Identifiable {
    static var orderSequence = sequence(first: 1) { $0 + 1 }
    
    let id: Int
    let product : ProductModel.ProductInfo
    let quantity: Int
    
    var price: Int {
        product.price * quantity
    }
}
