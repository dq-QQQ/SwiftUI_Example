//
//  InfoViewModel.swift
//  MyInfo
//
//  Created by Kyu jin Lee on 2022/07/29.
//

import Foundation
import SwiftUI
import Combine

class InfoViewModel: ObservableObject {
    @Published private var model = InfoModel()
    let objectWillChange = PassthroughSubject<InfoViewModel,Never>()
    
    var currentPage: String = "InputInfoView" {
        didSet{
            objectWillChange.send(self)
        }
    }
    
    func setModelData(_ name: String,
                      _ birth: Date,
                      _ age: Int,
                      _ gender: String,
                      _ dream: String) {
        model.setInfo(name, birth, age, gender, dream)
    }
    
    func getModel() -> (name: String,
                        birth: Date,
                        age: Int,
                        gender: String,
                        dream: String) { model.getInfo() }
}
