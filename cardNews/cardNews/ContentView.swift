//
//  ContentView.swift
//  cardNews
//
//  Created by Kyu jin Lee on 2022/09/27.
//

import SwiftUI

public struct ContentView: View {
    
    @Namespace private var namespace
    @State private var showDetail: Bool = false
    @State private var currentData: ListData? = nil
    
    @State private var  datas = [ListData]()
    
    public init() {}
    public var body: some View {
        ZStack {
            List(datas) { data in
                ListRow(namespace: namespace, data: data)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    .padding(.vertical, 8)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 6)
                    .onTapGesture {
                        DispatchQueue.main.async {
                            withAnimation(.transitionSpring) {
                                currentData = data
                                showDetail = true
                            }
                        }
                    }
            }
            .listStyle(.plain)
            .opacity(showDetail ? 0.0 : 1.0)
            if showDetail {
                if let data = currentData {
                    DetailView(namespace: namespace, data: data, show: $showDetail)
                }
            }
        }
        .animation(.transitionSpring, value: showDetail)
        .onAppear {
            DispatchQueue.main.async {
                for i in 0..<100 {
                    datas.append(ListData(title: "APP\nOF THE\nDAY",
                                          name: "Fabula - \(i)",
                                          description: "Code Suite for SwiftUI",
                                          color: Color.cyan))
                }
            }
        }
    }
}

fileprivate
extension Animation {
    static var transitionSpring: Animation {
       self.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.7)
    }
}

fileprivate
struct ListData: Identifiable {
    var id = UUID()
    var title: String
    var name: String
    var description: String
    var color: Color
}

fileprivate
struct ListRow: View {
    
    let namespace: Namespace.ID
    let data: ListData
    
    var body: some View {
        NamespaceView(namespace: namespace, data: data)
            .frame(height: 70)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

fileprivate
struct DetailView: View {
    
    let namespace: Namespace.ID
    let data: ListData
    @Binding var show: Bool
    @State private var showText: Bool = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                VStack {
                    NamespaceView(namespace: namespace, data: data)
                        .frame(height: 460)
                    
                    ZStack {
                        if showText {
                            Text("The formalism used the concepts of fabula and syuzhet as a way to develop narrative construction or classified materials and compositions into fabula and syuzhet, respectively. The totality of microscopic events listed in causality was called a fabula, and the narrative arrangement of these motifs in an artistic way was called a syuzhet. This app is a personal project to learn the technical ingredients of SwiftUI and derive creative results. SwiftUI is a user interface toolkit that can develop applications in a declarative manner. This is a modern development method that communicates to iOS how you want the user interface to behave and finds out how users perform when interacting with the interface. In addition, SwiftUI can develop macOS, watchOS, and tvOS with the same code as well as iOS development. The most appealing thing for me personally is that it is easy to learn and that the code is concise, making it easy for beginners to understand. I hope this project will help everyone, including myself, to understand SwiftUI. The code of this project will be updated regularly.")
                                .lineLimit(nil)
                                .padding(12)
                                .transition(.move(edge: .bottom).combined(with: .opacity))
                        }
                    }
                    .animation(.transitionSpring, value: showText)
                    .opacity(0.5)
                    .onAppear {
                        DispatchQueue.main.async {
                            withAnimation(.easeInOut) {
                                showText = true
                            }
                        }
                    }
                }
            }
            Image(systemName: "xmark")
                .padding(8)
                .background(Color.white)
                .foregroundColor(Color.black)
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.16), radius: 3, x: 0, y: 0)
                .padding()
                .onTapGesture {
                    withAnimation(.transitionSpring) {
                        show = false
                    }
                }
        }
    }
}

fileprivate
struct NamespaceView: View {
    
    let namespace: Namespace.ID
    let data: ListData
    
    var imageTitleView: some View {
        ZStack(alignment: .bottomLeading) {
            GeometryReader { proxy in
                ZStack {
                    data.color
                }
            }
            .clipShape(Rectangle())
            .matchedGeometryEffect(id: "image\(data.id)", in: namespace)
        }
    }
    
    var bottomInfoView: some View {
        ZStack(alignment: .leading) {
            if #available(macOS 12.0, *) {
                Rectangle()
                    .fill(.thinMaterial)
            } else {
                Rectangle()
                    .fill(Color.black.opacity(0.5))
            }
            HStack(spacing: 0) {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .padding(11)
                VStack(alignment: .leading) {
                    Text(data.name)
                        .bold()
                    Text(data.description)
                        .font(.caption)
                        .opacity(0.8)
                }.offset(y: -2)
                Spacer()
                Capsule()
                    .fill(Color.white)
                    .overlay(
                        Text("GET")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.blue)
                    )
                    .frame(width: 70, height: 28)
                    .padding(.trailing)
            }
            .padding(.leading, 6)
        }
        .frame(maxHeight: 61)
        .matchedGeometryEffect(id: "botttom\(data.id)", in: namespace)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            imageTitleView
            bottomInfoView
        }
    }
}
