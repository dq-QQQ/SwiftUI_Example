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
struct CS193PApp: App {
    var body: some Scene {
        WindowGroup {
            Home()
                .environmentObject(ProductViewModel())
                .environmentObject(OrderViewModel())
        }
    }
}
