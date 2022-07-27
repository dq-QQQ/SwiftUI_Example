//
//  BlueCircle.swift
//  @ViewBuilder
//
//  Created by Kyu jin Lee on 2022/07/27.
//

import SwiftUI

struct BlueCircle<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
            Spacer()
            Circle()
                .fill(Color.blue)
                .frame(width:20, height:30)
        }
        .padding()
    }
}
