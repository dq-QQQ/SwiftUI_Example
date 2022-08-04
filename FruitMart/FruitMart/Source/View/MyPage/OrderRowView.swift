//
//  OrderRowView.swift
//  FruitMart
//
//  Created by Kyu jin Lee on 2022/08/04.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import SwiftUI

struct OrderRowView: View {
    let order: OrderModel
    
    var body: some View {
        HStack {
            Image(order.product.imageName)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                Text(order.product.name)
                    .font(.headline).fontWeight(.medium)
                Text("₩\(order.price)  |  \(order.quantity)개")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
        .frame(height: 100)
    }
}
//
//struct OrderRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderRowView()
//    }
//}
