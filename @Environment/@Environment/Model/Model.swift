//
//  Model.swift
//  @Environment
//
//  Created by Kyu jin Lee on 2022/07/27.
//

import Foundation

struct Song: Identifiable, Equatable {
    var id = UUID()
    let artist: String
    let name: String
    let cover: String
}
