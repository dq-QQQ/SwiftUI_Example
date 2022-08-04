//
//  Home.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var viewModel: ProductViewModel
    
    var body: some View {
        NavigationView {
            if #available(iOS 14.0, *) {
                List(viewModel.getProduct()) { product in
                    NavigationLink(destination: ProductDetatilView(product: product)){
                        ProductRowView(product: product)
                    }
                }
                .navigationTitle("dq's Fruit Mart")
            } else {
                List(viewModel.getProduct()) { product in
                    NavigationLink(destination: ProductDetatilView(product: product)){
                        ProductRowView(product: product)
                    }
                }
            }
        }
        
    }
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(ProductViewModel())
    }
}
