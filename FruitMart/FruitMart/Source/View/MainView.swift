//
//  MainView.swift
//  FruitMart
//
//  Created by Kyu jin Lee on 2022/08/03.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import SwiftUI

struct MainView: View {
    private enum Tabs {
        case home, recipe, gallery, myPage
    }
    @State private var selectedTab: Tabs = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                home
                recipe
                imageGallery
                myPage
            }
            .accentColor(.primary)
        }
        .accentColor(.peach)
        .edgesIgnoringSafeArea(.top)
//        .statusBar(hidden: selectedTab == .recipe)
    }
}

fileprivate extension View {
    func tabItem(image: String, text:String) -> some View {
        self.tabItem {
            Image(systemName: image)
                .font(Font.system(size:17 , weight: .light))
            Text(text)
        }
    }
}


private extension MainView {
    var home: some View {
        Home()
            .tag(Tabs.home)
            .tabItem(image: "house", text: "홈")
            .onAppear { UITableView.appearance().separatorStyle = .none}
    }
    var recipe: some View {
        RecipeView()
            .tag(Tabs.recipe)
            .tabItem(image: "book", text: "레시피")
    }
    var imageGallery: some View {
        ImageGalleryView()
            .tag(Tabs.gallery)
            .tabItem(image: "photo.on.rectangle", text: "갤러리")
    }
    var myPage: some View {
        MyPageView()
            .tag(Tabs.myPage)
            .tabItem(image: "person", text: "마이페이지")
            .onAppear { UITableView.appearance().separatorStyle = .none}
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
