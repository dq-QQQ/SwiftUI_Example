//
//  ImageGalleryView.swift
//  FruitMart
//
//  Created by Kyu jin Lee on 2022/08/04.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import SwiftUI

struct ImageGalleryView: View {
    static private let galleryImages: [String] = ProductViewModel().getProduct().map {$0.imageName}
    @State private var productImages: [String] = galleryImages
    @State private var spacing: CGFloat = 20
    @State private var scale: CGFloat = 0.020
    @State private var angle: CGFloat = 5
    @GestureState private var translation: CGSize = .zero
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                backGroundCards
                frontCard
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

extension ImageGalleryView {
    var frontCard: some View {
        var drag: some Gesture {
            DragGesture()
                .updating($translation) { value, state, _ in
                    state = value.translation
                }
        }
        return FruitCard(productImages[0])
            .offset(translation)
            .shadow(radius: 4, x: 2, y: 2)
            .onLongPressGesture(perform: {
                self.productImages.append(self.productImages.removeFirst())
            })
            .simultaneousGesture(drag)
    }
    
    var backGroundCards: some View {
        ForEach(productImages.dropFirst().reversed(), id: \.self) {
            self.backgroundCard(image: $0)
        }
    }
    
    func backgroundCard(image: String) -> some View {
        let index = productImages.firstIndex(of: image)!
        let response = computeResponse(index: index)
        let animation = Animation.spring(response: response, dampingFraction: 0.68)
        return FruitCard(image)
            .shadow(color: .primaryShadow, radius: 2, x: 2, y: 2)
            .offset(computePosition(index: index))
            .scaleEffect(computeScale(index: index))
            .rotation3DEffect(computeAngle(index: index), axis: (0,0,1))
            .transition(AnyTransition.scale.animation(animation))
    }
    
    func computeResponse(index: Int) -> Double {
        max(Double(index) * 0.04, 0.2)
    }
    
    func computePosition(index: Int) -> CGSize {
        let x = translation.width
        let y = translation.height - CGFloat(index) * spacing
        return CGSize(width: x, height: y)
    }
    
    func computeScale(index: Int) -> CGFloat {
        let cardScale = 1.0 - CGFloat(index) * (0.05 - scale)
        return max(cardScale, 0.1)
    }
    
    func computeAngle(index: Int) -> Angle {
        let degrees = Double(index) * Double(angle)
        return Angle(degrees: degrees)
    }
}
//
//struct ImageGalleryView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageGalleryView()
//    }
//}
