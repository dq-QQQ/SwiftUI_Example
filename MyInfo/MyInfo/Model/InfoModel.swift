//
//  InfoModel.swift
//  MyInfo
//
//  Created by Kyu jin Lee on 2022/07/29.
//

import Foundation

struct InfoModel {
    private var info: (name: String,
                       birth: Date,
                       age: Int,
                       gender: String,
                       dream: String) = ("", Date(), 0, "", "")
    
    mutating func setInfo(_ name: String,
                          _ birth: Date,
                          _ age: Int,
                          _ gender: String,
                          _ dream: String) {
        info.0 = name
        info.1 = birth
        info.2 = age
        info.3 = gender
        info.4 = dream
    }
    
    func getInfo() -> (name: String,
                       birth: Date,
                       age: Int,
                       gender: String,
                       dream: String) { info }
}
