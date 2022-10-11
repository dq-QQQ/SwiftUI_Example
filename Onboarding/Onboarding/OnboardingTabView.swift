//
//  OnboardingTabView.swift
//  Onboarding
//
//  Created by Kyu jin Lee on 2022/10/11.
//

import SwiftUI

struct OnboardingTabView: View {
    @Binding var isFirstLaunching: Bool
    
    var body: some View {
        TabView {
            Page1()
            
            OnboardingLastPageView(
                imageName: "eyes",
                title: "끝",
                subtitle: "dq",
                isFirstLaunching: $isFirstLaunching
            )
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
