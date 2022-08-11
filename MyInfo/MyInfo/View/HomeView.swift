//
//  ContentView.swift
//  MyInfo
//
//  Created by Kyu jin Lee on 2022/07/28.
//

import SwiftUI

struct HomeView: View {
    @State var navigationState = false
    @ObservedObject var ho: InfoViewModel = InfoViewModel()
    
    var body: some View {
//        NavigationView {
            VStack {
                Text("My Info")
                    .kerning(12)
                    .font(.custom("Didot Italic", size: 70))
                    .foregroundColor(.indigo)
                    .padding(15)
                    .background(.yellow)
                    .cornerRadius(30)
                Spacer()
//                NavigationLink(destination:
                                if ho.currentPage == "InputInfoView" {
                    InputInfoView(navigationState: $navigationState, ho: ho)
                                }
                else if ho.currentPage == "OutputInfoView" {
                    OutputInfoView(navigationState: $navigationState, ho: ho)
                                }
                    Image("kyujin")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(.indigo,lineWidth: 10))
                        .shadow(color: .yellow ,radius: 20)
                        .padding()
                        .onTapGesture {
                            ho.current = "InputInfoView"
                        }
                }
//            }
        }
//    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
