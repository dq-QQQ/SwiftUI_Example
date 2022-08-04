//
//  ProductDetatilView.swift
//  FruitMart
//
//  Created by Kyu jin Lee on 2022/07/31.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import SwiftUI

struct ProductDetatilView: View {
    @State private var quantity: Int = 1
    @State private var showingAlert: Bool = false
    @State private var showingPopup: Bool = false
    @EnvironmentObject private var orderViewModel: OrderViewModel
    let product: ProductModel.ProductInfo
    
    var body: some View {
        if #available(iOS 15, *) {
            wholeView
                .popup(isPresented: $showingPopup) {
                    Text("주문 완료")
                        .font(.system(size: 24))
                        .bold()
                        .kerning(2)
                }
                .edgesIgnoringSafeArea(.top)
                .alert(Text("주문 확인"), isPresented: $showingAlert, actions: {
                Button("취소") { }
                    Button("확인") { orderViewModel.placeOrder(product: product, quantity: quantity); showingPopup = true}
            }, message: {
                Text("진짜 구매하시겠습니까")
            })
        } else {
            wholeView
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("주문 확인"), message: Text("\(product.name)을 \(quantity)개만큼 구매하시겠습니까"), primaryButton: .default(Text("확인"), action: {}), secondaryButton: .cancel(Text("취소")))
                }
        }
    }
}

extension ProductDetatilView {
    var wholeView: some View {
        VStack {
            productImage
            orderView
        }
    }
    
    var productImage: some View {
        GeometryReader {_ in
            Image(self.product.imageName)
                .resizable()
                .scaledToFill()
        }
    }
    
    var orderView: some View {
        GeometryReader {
            VStack(alignment:.leading) {
                self.productDescription
                Spacer()
                self.priceInfo
                self.placeOrderButton
            }
            .padding(32)
            .frame(height: $0.size.height + 50)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -5)
        }
    }
    
    var productDescription: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(product.name)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                Spacer()
                FavoriteButton(product: product)
            }
            Text(splitText(product.description))
                .foregroundColor(.secondText)
                .fixedSize()
        }
    }
    
    func splitText(_ text: String) -> String {
        guard !text.isEmpty else {
            return text
        }
        let centerIdx = text.index(text.startIndex, offsetBy: text.count / 2)
        let centerSpaceIdx = text[..<centerIdx].lastIndex(of: " ") ??
        text[centerIdx...].firstIndex(of: " ") ??
        text.index(before: text.endIndex)
        let afterSpaceIdx = text.index(after: centerSpaceIdx)
        let lhsString = text[..<afterSpaceIdx].trimmingCharacters(in: .whitespaces)
        let rhsString = text[afterSpaceIdx...].trimmingCharacters(in: .whitespaces)
        return String(lhsString + "\n" + rhsString)
    }
    
    var priceInfo: some View {
        let price = quantity * product.price
        return HStack {
            (Text("₩") + Text("\(price)").font(.title))
                .fontWeight(.medium)
            Spacer()
            QuantitySelector(quantity: $quantity)
        }
        .foregroundColor(.black)
    }
    
    var placeOrderButton: some View {
        Button(action: {
            self.showingAlert = true
        }) {
            Capsule()
                .fill(Color.peach)
                .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 55)
                .overlay(Text("주문하기")
                    .font(.system(size: 20)).fontWeight(.medium)
                    .foregroundColor(.white))
                .padding(.bottom, 40)
        }
        .buttonStyle(ShrinkButtonStyle())
    }
}

struct ProductDetatilView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetatilView(product: ProductModel(filename: "ProductData.json").choose(0)!)
            .environmentObject(ProductViewModel())
    }
}
