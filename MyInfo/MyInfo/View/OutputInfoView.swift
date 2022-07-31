//
//  OutputInfoView.swift
//  MyInfo
//
//  Created by Kyu jin Lee on 2022/07/28.
//

import SwiftUI

struct OutputInfoView: View {
    @Binding var navigationState: Bool
    
    var body: some View {
        VStack(alignment: .leading){
            Button(action: {
                navigationState = false
            }, label: {
                Text("ho")
                    .font(.largeTitle)
            })
        }
    }
}

struct OutputInfoView_Previews: PreviewProvider {
    static var previews: some View {
        OutputInfoView(navigationState: .constant(true))
    }
}
