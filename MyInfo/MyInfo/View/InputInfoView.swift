//
//  GetInfoView.swift
//  MyInfo
//
//  Created by Kyu jin Lee on 2022/07/28.
//

import SwiftUI

struct InputInfoView: View {
    @Binding var navigationState: Bool
    @ObservedObject var ho: InfoViewModel
    @State private var info: (name: String,
                              birth: Date,
                              age: Int,
                              gender: String,
                              dream: String) = ("", Date(), 0, "", "")
    
    var body: some View {
        VStack {
            Form {
                Section("이름") {
                    HStack {
                        Image(systemName: "person.circle")
                        TextField("Name", text: $info.name)
                            .textFieldStyle(.roundedBorder)
                    }
                }
                Section("생일") {
                    HStack {
                        Image(systemName: "person.circle")
                        DatePicker("Birth", selection: $info.birth)
                    }
                }
            }
            Spacer()
            GeometryReader { proxy in
//                NavigationLink(destination:OutputInfoView(navigationState: $navigationState, ho: ho).navigationBarBackButtonHidden(true)){
                    Button(action:{
                        ho.setModelData(info.name, info.birth, info.age, info.gender, info.dream);
                        ho.currentPage = "OutputInfoView"
                    }) {
                        Text("Complete Input")
                            .font(.custom("Didot Italic", size: 40))
                            .foregroundColor(.indigo)
                            .frame(width: proxy.size.width, height: proxy.size.height,  alignment: .center)
//                    }
                }
            }
            .frame(maxHeight: 90)
            .background(.yellow)
            .edgesIgnoringSafeArea(.top)
            
        }
    }
}

extension InputInfoView {
    
    
}
//
//struct InputInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        InputInfoView(navigationState: .constant(true))
//    }
//}
