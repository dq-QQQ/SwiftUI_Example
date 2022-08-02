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
    }
    
    var body: some Scene {
        WindowGroup {
            Home()
                .accentColor(.primary)
//                .tint(.black)
                .environmentObject(ProductViewModel())
                .environmentObject(OrderViewModel())
        }
    }
}
