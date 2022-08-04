//
//  MyPageView.swift
//  FruitMart
//
//  Created by Kyu jin Lee on 2022/08/04.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        NavigationView {
            Form {
                orderInfoSection
            }
            .navigationBarTitle("마이페이지")
        }
    }
    
    var orderInfoSection: some View {
        Section(header: Text("주문정보").fontWeight(.medium)) {
            NavigationLink(destination: OrderListView()) {
                Text("주문목록")
            }
            .frame(height:44)
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
