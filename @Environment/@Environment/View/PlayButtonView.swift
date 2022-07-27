//
//  PlayButtonView.swift
//  @Environment
//
//  Created by Kyu jin Lee on 2022/07/27.
//

import SwiftUI

struct PlayButtonView: View {
    @EnvironmentObject private var musicPlayer: MusicPlayer
    let song: Song
    
    private var buttonText: String {
        if song == musicPlayer.currentSong {
            return "stop"
        } else {
            return "play"
        }
        
    }
    
    var body: some View {
        Button {
            musicPlayer.pressButton(song: song)
        } label: {
            Image(systemName: buttonText)
                .font(.system(.largeTitle))
                .foregroundColor(.black)
        }
    }
}


struct PlayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlayButtonView(song: MusicPlayer().songs[0])
            .environmentObject(MusicPlayer())
    }
}
