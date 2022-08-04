//
//  OrderListView.swift
//  FruitMart
//
//  Created by Kyu jin Lee on 2022/08/04.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import SwiftUI
struct OrderListView: View {
  @EnvironmentObject var orderViewModel: OrderViewModel

  
  var body: some View {
    ZStack {
        if orderViewModel.model.isEmpty {
        emptyOrders
      } else {
        orderList
      }
    }
    .navigationBarTitle("주문 목록")
    .navigationBarItems(trailing: editButton)
  }
}


private extension OrderListView {
  // MARK: View
  
  var orderList: some View {
    List {
      ForEach(orderViewModel.model) {
        OrderRowView(order: $0)
      }
      .onDelete(perform: orderViewModel.deleteOrder(at:))
    }
  }
  
  var emptyOrders: some View {
    VStack(spacing: 25) {
      Image("box")
        .renderingMode(.template)
        .foregroundColor(Color.gray.opacity(0.4))
      
      Text("주문 내역이 없습니다")
        .font(.headline).fontWeight(.medium)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.background)
  }
  
  var editButton: some View {
    !orderViewModel.model.isEmpty
      ? AnyView(EditButton())
      : AnyView(EmptyView())
  }
}
struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}
