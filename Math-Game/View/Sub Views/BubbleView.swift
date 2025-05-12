//
//  BubbleView.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/12/25.
//

import SwiftUI

struct BubbleView: View {
    let bubbleSize: CGFloat = 100.0
    let textColor: Color
    let bgColor: Color
    let imgName: String
    let text: String
    
    @State private var rotateAngle: Angle = .zero
    
    var body: some View {
        Text(text)
            .foregroundStyle(textColor)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding()
            .background(
                Image(imgName)
                    .resizable()
                    .scaledToFill()
                    .opacity(0.6)
                    .rotationEffect(rotateAngle)
                    .background(bgColor)
                    .clipShape(Circle())
            )
            .padding()
            .onAppear {
                withAnimation(
                    .linear(duration: 20)
                    .repeatForever(autoreverses: false)
                ) {
                    rotateAngle = .degrees(360)
                }
            }
    }
}

#Preview {
    BubbleView(
        textColor: .red,
        bgColor: .green.opacity(0.3),
        imgName: "bubble2",
        text: "30"
    )
    BubbleView(
        textColor: .white,
        bgColor: .green.opacity(0.3),
        imgName: "bubble1",
        text: "30"
    )
    BubbleView(
        textColor: .white,
        bgColor: .green.opacity(0.3),
        imgName: "bubble3",
        text: "30"
    )
}
