//
//  ExpandingListViewModel.swift
//  ExpandingList
//
//  Created by Kyu jin Lee on 2022/08/11.
//

import Foundation

class Elements {
    static let dollar = Backpack(name: "Dollar", icon: "dollarsign.circle")
    static let won = Backpack(name: "Won", icon: "wonsign.circle")
    let currencies = Backpack(name: "Currencies", icon: "coloncurrencysign.circle", content: [dollar, won])
    
    static let pencil = Backpack(name: "Pencil", icon: "pencil.circle")
    static let hammer = Backpack(name: "Hammer", icon: "hammer")
    static let paperClip = Backpack(name: "Paperclip", icon: "paperclip")
    static let glass = Backpack(name: "Magnifying Glass", icon: "magnifyingglass")
    static let bin = Backpack(name: "Bin", icon: "arrow.up.bin", content: [paperClip, glass])
    
    let tools = Backpack(name: "Tools", icon: "folder", content: [pencil, hammer, bin])
}
