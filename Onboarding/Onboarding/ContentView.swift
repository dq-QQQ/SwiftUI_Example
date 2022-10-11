//
//  ContentView.swift
//  Onboarding
//
//  Created by Kyu jin Lee on 2022/10/11.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = true
    
    var body: some View {
        Button {
            isFirstLaunching = true
        } label: {
            Text("App Main")
        }
            .fullScreenCover(isPresented: $isFirstLaunching) {
                OnboardingTabView(isFirstLaunching: $isFirstLaunching)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
