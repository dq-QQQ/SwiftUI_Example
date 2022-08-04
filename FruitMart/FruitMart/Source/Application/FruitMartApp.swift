//
//  AppDelegate.swift
//  FruitMart
//
//
//
//import UIKit
//
//@UIApplicationMain
//final class AppDelegate: UIResponder, UIApplicationDelegate {
//
//}
import SwiftUI

@available(iOS 14.0, *)
@main
struct FruitMartApp: App {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(named: "peach")!]
        
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor(named: "peach")!]
        
//        UITabBar.appearance().backgroundColor = .blue
//        UITabBar.appearance().unselectedItemTintColor = .white
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
//                .accentColor(.primary)
//                .tint(.black)
                .environmentObject(ProductViewModel())
                .environmentObject(OrderViewModel())
        }
    }
}
