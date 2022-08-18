//
//  ContentView.swift
//  FirebaseNotes
//
//  Created by Kyu jin Lee on 2022/08/14.
//

import SwiftUI


struct NotesView: View {
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    private var repository: NotesRepository = NotesRepository()
    
    @State
    var isNewNotePresented = false
    @State
    var notes: [Note] = []
    
    var body: some View {
        
        NavigationView {
            List(notes) { note in
                NavigationLink(destination: ShowNoteView(note: note)) {
                    VStack(alignment: .leading) {
                        Text(note.title)
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("\(note.date, formatter: Self.taskDateFormat)")
                            .font(.subheadline)
                    }
                }
            }
            .navigationBarTitle("FireNotes", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button {
                isNewNotePresented.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.headline)
            })
            .sheet(isPresented: $isNewNotePresented) {
                NewNoteView(isNewNotePresented: $isNewNotePresented,
                        notes: $notes,
                        repository: repository)
            }
            .task {
                notes = await repository.fetchNotes()
            }
        }
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
