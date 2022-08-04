//
//  FruitCard.swift
//  FruitMart
//
//  Created by Kyu jin Lee on 2022/08/04.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import SwiftUI

struct FruitCard: View {
    let imageName: String
    let size: CGSize
    let cornerRadius: CGFloat
    
    init(_ imageName: String,
         size: CGSize = CGSize(width: 240, height: 200),
         cornerRadius: CGFloat = 14) {
        self.imageName = imageName
        self.size = size
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: size.width, height: size.height)
            .cornerRadius(cornerRadius)
    }
}
//
//struct FruitCard_Previews: PreviewProvider {
//    static var previews: some View {
//        FruitCard()
//    }
//}
