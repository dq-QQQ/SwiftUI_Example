//
//  SongView.swift
//  @Environment
//
//  Created by Kyu jin Lee on 2022/07/27.
//

import SwiftUI


struct SongView: View {
    @EnvironmentObject private var musicPlayer: MusicPlayer
    let song: Song
    
    var body: some View {
        HStack {
            NavigationLink(destination: PlayerView(song: song)) {
                Image(song.cover)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                VStack(alignment: .leading) {
                    Text(song.name)
                    Text(song.artist).italic()
                }
            }
            
            Spacer()
            PlayButtonView(song: song)
        }.buttonStyle(PlainButtonStyle())
    }
}


struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView(song: MusicPlayer().songs[0])
            .environmentObject(MusicPlayer())
    }
}
