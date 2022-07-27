//
//  ContentView.swift
//  @ObservedObject
//
//  Created by Kyu jin Lee on 2022/07/27.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = ViewModel()

    var body: some View {
        VStack {
            HStack {
                Text("Latitude: \(viewModel.model.getLatitude())")
                Text("Longitude: \(viewModel.model.getLongitude())")
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
