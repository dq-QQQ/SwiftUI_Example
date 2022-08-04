//
//  OrderViewModel.swift
//  FruitMart
//
//  Created by Kyu jin Lee on 2022/08/01.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import SwiftUI

final class OrderViewModel: ObservableObject {
    @Published var model: [OrderModel] =  []
    
    func placeOrder(product: ProductModel.ProductInfo, quantity: Int) {
        let nextID = OrderModel.orderSequence.next()!
        let order = OrderModel(id: nextID, product: product, quantity: quantity)
        model.append(order)
        print("ho")
    }
    
    func deleteOrder (at indexes: IndexSet) {
        guard let index = indexes.first else {
            return
        }
        model.remove(at: index)
    }
}

