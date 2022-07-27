//
//  _EnvironmentApp.swift
//  @Environment
//
//  Created by Kyu jin Lee on 2022/07/27.
//

import SwiftUI

@main
struct _EnvironmentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MusicPlayer())
        }
    }
}
