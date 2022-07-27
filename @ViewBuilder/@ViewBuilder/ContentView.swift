//
//  ContentView.swift
//  @ViewBuilder
//
//  Created by Kyu jin Lee on 2022/07/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            BlueCircle {
                Text("Example 1")
            }
            BlueCircle {
                Text("Example 2")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
