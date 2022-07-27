//
//  ViewModel.swift
//  @ObservedObject
//
//  Created by Kyu jin Lee on 2022/07/27.
//

import Foundation
import CoreLocation


class ViewModel: NSObject,CLLocationManagerDelegate, ObservableObject{
    private let locationManager = CLLocationManager()
    
    @Published var model = Model() // 현재위치 담고있는 모델
    
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.distanceFilter = 10
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        model.updateCurrentLocation(location)
    }
    
    func getLatitude() -> String {
        model.getLatitude()
    }
    
    func getLongitude() -> String {
        model.getLongitude()
    }
}

