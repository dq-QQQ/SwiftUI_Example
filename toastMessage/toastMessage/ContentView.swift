//
//  ContentView.swift
//  toastMessage
//
//  Created by Kyu jin Lee on 2022/10/10.
//

import SwiftUI

public struct ContentView: View {
    @State private var showTopToast = false
    
    public var body: some View {
        Button {
            withAnimation {
                showTopToast = true
            }
        } label: {
            Text("Toast Message")
        }
        .buttonStyle(PlainButtonStyle())
        .showToast(showToast: $showTopToast, content:
                    ToastView(showToast: $showTopToast,
                              toastData: "관심목록에 추가되었어요!"))
    }
}

fileprivate
struct ToastMessage: View {
    let toastData: String
    
    var body: some View {
        HStack {
            Image(systemName: "plus.circle")
                .padding(.trailing, 5)
            Text(LocalizedStringKey(toastData))
                .font(.headline)
            Spacer()
        }
        .foregroundColor(Color.cyan)
        .padding(10)
    }
}

fileprivate
struct ToastView: View {
    @Binding var showToast: Bool
    let toastData: String
    
    var body: some View {
        VStack {
            ToastMessage(toastData: toastData)
                .background(.orange.opacity(0.3))
                .background(.ultraThinMaterial)
                .cornerRadius(15)
            Spacer()
        }
        .padding(30)
        .opacity(self.showToast ? 1.0 : 0)
        .transition(.move(edge: .top))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.showToast = false
                }
            }
        }
        .onTapGesture {
            withAnimation {
                self.showToast = false
            }
        }
    }
}

fileprivate
struct ToastModifier<T: View>: ViewModifier {
    
    @Binding var showToast: Bool
    let content: T
    
    func body(content: Content) -> some View {
        ZStack {
            content
            ZStack {
                if showToast {
                    self.content
                }else {
                    EmptyView()
                }
            }
        }
    }
}

fileprivate
extension View {
    func showToast<T: View>(showToast: Binding<Bool>, content: T) -> some View {
        self.modifier(ToastModifier(showToast: showToast, content: content))
    }
}


