//
//  FirebaseNotesApp.swift
//  FirebaseNotes
//
//  Created by Kyu jin Lee on 2022/08/14.
//

import SwiftUI
import Firebase

@main
struct FirebaseNotesApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NotesView()
        }
    }
}
