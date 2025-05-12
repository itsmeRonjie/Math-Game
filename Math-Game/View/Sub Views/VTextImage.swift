//
//  VTextImage.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/12/25.
//

import SwiftUI

struct VTextImage: View {
    let text: LocalizedStringKey
    let imgName: String
    let dim: CGFloat
    var body: some View {
        VStack(spacing: 0) {
            Image(imgName)
                .resizable()
                .scaledToFit()
                .frame(width: dim, height: dim)
            
            Text(text)
                .fixedSize(horizontal: true, vertical: false)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ZStack {
        HighScoreView()
        VTextImage(
            text: "Rank",
            imgName: "creature0",
            dim: 50
        )
    }
}
