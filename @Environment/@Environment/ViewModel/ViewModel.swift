//
//  ViewModel.swift
//  @Environment
//
//  Created by Kyu jin Lee on 2022/07/27.
//

import Foundation

import SwiftUI

class MusicPlayer: ObservableObject {
    @Published var currentSong: Song?
    
    let songs = [
        Song(artist: "Luke", name: "99", cover: "cover0"),
        Song(artist: "Foxing", name: "No Trespassing", cover: "cover1"),
        Song(artist: "Breaking Benjamin", name: "Phobia", cover: "cover2"),
        Song(artist: "J2", name: "Solenoid", cover: "cover3"),
        Song(artist: "Wildflower Clothing", name: "Lightning Bottles", cover: "cover4"),
        Song(artist: "The Broken Spirits", name: "Rubble", cover: "cover5"),
    ]
    
    func pressButton(song: Song) {
        if currentSong == song {
            currentSong = nil
        } else {
            currentSong = song
        }
    }
}
