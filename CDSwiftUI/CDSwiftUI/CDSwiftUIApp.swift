//
//  hoApp.swift
//  ho
//
//  Created by Kyu jin Lee on 2022/09/09.
//

import SwiftUI

@main
struct CDSwiftUIApp: App {
    private let coreDataStack = CoreDataStack(modelName: "ContactsModel")
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataStack.managedObjectContext)
                .environmentObject(coreDataStack)
                .onAppear {
                    addContacts(to: coreDataStack)
                }
                .onChange(of: scenePhase) { _ in
                    coreDataStack.save()
                }
        }
    }
}
