//
//  Model.swift
//  @ObservedObject
//
//  Created by Kyu jin Lee on 2022/07/27.
//

import Foundation
import CoreLocation

struct Model {
    // 현재위치
    private var current: CLLocation?
    
    mutating func updateCurrentLocation(_ currLocation: CLLocation) {
        self.current = currLocation
    }

    func getLatitude() -> String {
        guard let current = current else {
            return "-"
        }
        return "\(current.coordinate.latitude)"
    }
    
    func getLongitude() -> String {
        guard let current = current else {
            return "-"
        }
        return "\(current.coordinate.longitude)"
    }
    
}


