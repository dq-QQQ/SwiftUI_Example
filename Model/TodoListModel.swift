//
//  TodoListModel.swift
//  Widget
//
//  Created by Kyu jin Lee on 2022/08/12.
//

import Foundation

struct TodoListModel : Identifiable {
    var id = UUID()
    var task: String = ""
    var doOrNot = false
    
    func compareID(_ compareid: UUID) -> Bool {
        compareid == id ? true : false
    }
    
    mutating func doneTask() {
        doOrNot.toggle()
    }
}
