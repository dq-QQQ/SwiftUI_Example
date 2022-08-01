//
//  QuantitySelector.swift
//  FruitMart
//
//  Created by Kyu jin Lee on 2022/08/01.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import SwiftUI

struct QuantitySelector: View {
    @Binding var quantity: Int
    var range: ClosedRange<Int> = 1...20
    
    
    var body: some View {
        HStack {
            buttonPlusMinus(-1, "minus.circle.fill")
            
            Text("\(quantity)")
                .bold()
                .font(Font.system(.title, design: .monospaced))
                .frame(minWidth: 40, maxWidth: 60)
            
            buttonPlusMinus(1, "plus.circle.fill")
        }
    }
}

extension QuantitySelector {
    private func buttonPlusMinus(_ num: Int, _ imageName: String) -> some View {
        Button(action: { self.changeQuantity(num) }) {
            Image(systemName: imageName)
                .imageScale(.large)
                .padding()
        }
        .foregroundColor(Color.gray.opacity(0.5))
    }
    
    private func changeQuantity(_ num: Int) {
        if range ~= quantity + num {
            quantity += num
        }
    }
}

struct QuantitySelector_Previews: PreviewProvider {
    static var previews: some View {
        QuantitySelector(quantity: .constant(10))
    }
}
