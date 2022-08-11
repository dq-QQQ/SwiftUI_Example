//
//  ExpadingListModel.swift
//  ExpandingList
//
//  Created by Kyu jin Lee on 2022/08/11.
//

import Foundation

struct Backpack: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var content: [Backpack]?
}
