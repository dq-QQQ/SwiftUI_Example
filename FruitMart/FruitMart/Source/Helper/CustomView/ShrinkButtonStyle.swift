//
//  ShrinkButtonStyle.swift
//  FruitMart
//
//  Created by Kyu jin Lee on 2022/08/02.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import SwiftUI

struct ShrinkButtonStyle: ButtonStyle {
    var minScale: CGFloat = 0.9
    var minOpacity: Double = 0.6
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? minScale : 1)
            .opacity(configuration.isPressed ? minOpacity : 1)
    }
}

//struct ShrinkButtonStyle_Previews: PreviewProvider {
//    static var previews: some View {
//        ShrinkButtonStyle()
//    }
//}
