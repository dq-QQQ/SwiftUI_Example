//
//  ContentView.swift
//  @Environment
//
//  Created by Kyu jin Lee on 2022/07/27.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject private var musicPlayer: MusicPlayer
    
    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationView {
                List(musicPlayer.songs) { song in
                    SongView(song: song)
                }
                .listStyle(.plain)
                .navigationTitle("Music Player")
            }
            MiniPlayerView()
                .background(.gray)
                .offset(y: 44)
        }
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MusicPlayer())
    }
}
