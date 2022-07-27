//
//  PlayerView.swift
//  @Environment
//
//  Created by Kyu jin Lee on 2022/07/27.
//

import SwiftUI

struct PlayerView: View {
    @EnvironmentObject private var musicPlayer: MusicPlayer
    let song: Song
    
    var body: some View {
        VStack {
            Image(song.cover)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
            HStack {
                Text(song.name)
                Text(song.artist).italic()
            }
            PlayButtonView(song: song)
        }
    }
}
struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(song: MusicPlayer().songs[0])
            .environmentObject(MusicPlayer())
    }
}
