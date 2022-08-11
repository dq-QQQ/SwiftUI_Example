//
//  OutputInfoView.swift
//  MyInfo
//
//  Created by Kyu jin Lee on 2022/07/28.
//

import SwiftUI

struct OutputInfoView: View {
    @Binding var navigationState: Bool
    @ObservedObject var ho: InfoViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Button(action: {
                navigationState = false
            }, label: {
                Text("ho")
                    .font(.largeTitle)
            })
            Text(ho.getModel().name)
//            Text(ho.getModel().birth)
            Text(dateFormatter.string(from: ho.getModel().birth))
        }
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
}

struct OutputInfoView_Previews: PreviewProvider {
    static var previews: some View {
        OutputInfoView(navigationState: .constant(true), ho: InfoViewModel())
    }
}
