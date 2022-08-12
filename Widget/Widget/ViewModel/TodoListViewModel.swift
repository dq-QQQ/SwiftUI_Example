//
//  TodoListViewModel.swift
//  Widget
//
//  Created by Kyu jin Lee on 2022/08/12.
//

import Foundation
import SwiftUI

class TodoListViewModel: ObservableObject {
    @Published var model: [TodoListModel] = []
    
    func addTodoList(_ todo: String) {
        model.append(TodoListModel(task: todo))
    }
    
    func doneTask(_ todo: UUID) {
        model[findModelIndex(todo)].doneTask()
    }
    
    func getName(_ todo: UUID) -> String {
        return model[findModelIndex(todo)].task
    }
    
    func getState(_ todo: UUID) -> Bool {
        return model[findModelIndex(todo)].doOrNot ? true : false
    }
    
    func findModelIndex(_ todo: UUID) -> Int {
        var i: Int = 0
        while i < model.count {
            if model[i].compareID(todo){
                break;
            }
            i += 1
        }
        return i
    }
}
