//
//  NotesViewModel.swift
//  FirebaseNotes
//
//  Created by Kyu jin Lee on 2022/08/14.
//
//
//import Foundation
//import Firebase
//import FirebaseFirestoreSwift
//
//class NotesRepository: ObservableObject {
//    @Published private var dbCollection = Firestore.firestore().collection("notes")
//
//    func newNote(title: String, date: Date, body: String) async -> [Note] {
//        let note = Note(id: UUID().uuidString, title: title, date: date, body: body)
//        _ = try? dbCollection.addDocument(from: note)
//        return await fetchNotes()
//    }
//
//    func fetchNotes() async -> [Note] {
//        guard let snapshot = try? await dbCollection.getDocuments() else {
//            return []
//        }
//
//        let notes: [Note] = snapshot.documents.compactMap { document in
//            try? document.data(as: Note.self)
//        }
//        return notes.sorted {
//            $0.date < $1.date
//        }
//    }
//}

import Foundation
import Firebase
import FirebaseFirestoreSwift

class NotesRepository:ObservableObject {
    private let dbCollection = Firestore.firestore().collection("notes")
    
    
    func newNote(title: String, date: Date, body: String) async -> [Note] {
        let note = Note(id: UUID().uuidString, title: title, date: date, body: body)
        _ = try? dbCollection.addDocument(from: note)
        return await fetchNotes()
    }
    
    func fetchNotes() async -> [Note] {
        guard let snapshot = try? await dbCollection.getDocuments() else {
            return []
        }
        
        let notes: [Note] = snapshot.documents.compactMap { document in
            try? document.data(as: Note.self)
        }
        
        return notes.sorted {
            $0.date < $1.date
        }
    }
}
