//
//  MiniPlayerView.swift
//  @Environment
//
//  Created by Kyu jin Lee on 2022/07/27.
//

import SwiftUI

struct MiniPlayerView: View {
    @EnvironmentObject private var musicPlayer: MusicPlayer
    
    var body: some View {
        if let currentSong = musicPlayer.currentSong {
            SongView(song: currentSong)
                .padding(.all, 24)
        } else {
            EmptyView()
        }
    }
}

struct MiniPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayerView()
            .environmentObject(MusicPlayer())
    }
}
