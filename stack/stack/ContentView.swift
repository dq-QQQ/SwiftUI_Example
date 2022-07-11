//
//  ContentView.swift
//  stack
//
//  Created by Kyu jin Lee on 2022/07/11.
//

import SwiftUI


struct ContentView: View {
//    var colors : [(String, Color)] = [("Black", .black), ("Red", .red), ("Green", .green), ("Blue", .blue)] 딕셔너리 접근을 어캐하지
    var colors : [Color] = [.black, .red, .green, .blue]
    var colornames : [String] = ["black", "red", "green", "blue"]
    @State private var colorIndex = 0
    @State private var sliderValue : Double = 0.0
    @State private var text : String = ""
    
    var body: some View {
        VStack {
            Text(text)
                .font(.largeTitle)
                .foregroundColor(self.colors[self.colorIndex])
                .rotationEffect(.degrees(self.sliderValue))
                .padding(.bottom, 100)
            
            HStack {
                Spacer(minLength: 20)
                Text("0")
                Spacer(minLength: 20)
                Slider(value: $sliderValue, in: 0...360, step:1)
                    .accentColor(.red)
                Spacer(minLength: 20)
                Text("360")
                Spacer(minLength: 20)
            }
            Text("\(sliderValue)")
            Text("\(sliderValue, specifier: "%.2f")")
            Text("\(Int(sliderValue))")
                .padding()
            
            HStack {
                Text("Text")
                    .frame(width: 100, height: 30, alignment: .center)
                    .background(.cyan)
                    .foregroundColor(.white)
                TextField("Write some Text", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Picker(selection: $colorIndex, label: Text("Text Color")) {
                ForEach (0 ..< colornames.count, id:\.self) {
                    Text(self.colornames[$0])
                }
            }
            .padding(.top, 100)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
