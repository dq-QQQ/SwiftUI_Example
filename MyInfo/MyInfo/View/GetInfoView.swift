//
//  GetInfoView.swift
//  MyInfo
//
//  Created by Kyu jin Lee on 2022/07/28.
//

import SwiftUI

struct InputInfoView: View {
    @Binding var navigationState: Bool
    
    var body: some View {
            NavigationLink(destination:OutputInfoView(navigationState: $navigationState)){
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct InputInfoView_Previews: PreviewProvider {
    static var previews: some View {
        InputInfoView(navigationState: .constant(true))
    }
}
