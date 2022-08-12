//
//  ContentView.swift
//  Widget
//
//  Created by Kyu jin Lee on 2022/08/11.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = TodoListViewModel()
    @State var todoList: String = ""
    
    var body: some View {
        VStack {
            List {
                ForEach($viewModel.model) { todo in                    HStack {
                        Text(viewModel.getName(todo.id))
                        Spacer()
                        if !viewModel.getState(todo.id) {
                            Image(systemName: "circle")
                        } else {
                            Image(systemName: "circle.fill")
                        }
                    }
                    .onTapGesture {
                        viewModel.doneTask(todo.id)
                    }
                }
            }
            HStack {
                TextField("할 일", text: $todoList)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button {
                    viewModel.addTodoList(todoList)
                } label: {
                    Text("add")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.trailing, 20)
            }
//            .padding()
            
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
