//
//  RemoteConfigApp.swift
//  RemoteConfig
//
//  Created by Kyu jin Lee on 2022/08/14.
//

import SwiftUI
import Firebase

@main
struct RemoteConfigApp: App {
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
