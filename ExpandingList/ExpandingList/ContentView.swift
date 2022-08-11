//
//  ContentView.swift
//  ExpandingList
//
//  Created by Kyu jin Lee on 2022/08/11.
//

import SwiftUI

struct ContentView: View {
    let viewModel = Elements()
    var bagContents: [Backpack] {
        return [viewModel.currencies, viewModel.tools]
    }
    var body: some View {
        List(bagContents, children: \.content) { row in
            Image(systemName: row.icon)
            Text(row.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
