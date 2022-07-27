//
//  ContentView.swift
//  @State
//
//  Created by Kyu jin Lee on 2022/07/27.
//

import SwiftUI

struct ContentView: View {
    @State private var todos = [
        Todo(description: "@State 공부", done: true),
        Todo(description: "@ObservedObject 공부", done: false),
        Todo(description: "@Environment 공부", done: false)
    ]
    
    
    var body: some View {
        ZStack(alignment: .bottom){
            List($todos) { $todo in
                HStack {
                    Text(todo.description)
                    Spacer()
                    Image(systemName: todo.done ? "checkmark.square" : "square")
                }
                .onTapGesture {
                    todo.changeDoneState()
                }
            }
            InputTodoView(todos: $todos)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct Todo: Identifiable {
    let id = UUID()
    let description: String
    var done: Bool
    
    mutating func changeDoneState() {
        done.toggle()
    }
}

struct InputTodoView: View {
    @State private var newTodoDescription: String = ""
    @Binding var todos: [Todo]
    
    var body: some View {
        HStack {
            TextField("Todo", text:$newTodoDescription)
            Spacer()
            Button {
                guard !newTodoDescription.isEmpty else {
                    return
                }
                todos.append(Todo(description: newTodoDescription, done: false))
                newTodoDescription = ""
            } label : {
                Text("Add")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .foregroundColor(.white)
                    .background(.green)
                    .cornerRadius(5)
            }
        }
        .frame(height: 60)
        .padding(.horizontal, 24)
        .padding(.bottom, 30)
        .background(Color.gray)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
