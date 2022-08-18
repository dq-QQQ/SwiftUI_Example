//
//  NotesModel.swift
//  FirebaseNotes
//
//  Created by Kyu jin Lee on 2022/08/14.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: String
    let title: String
    let date: Date
    let body: String
}
