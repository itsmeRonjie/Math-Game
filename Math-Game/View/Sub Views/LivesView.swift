//
//  LivesView.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/9/25.
//

import SwiftUI

struct LivesView: View {
    let image: Creatures
    let numLives: Int
    let maxLives: Int
    let dim = 40.0
    
    var body: some View {
        HStack {
            ForEach(0..<maxLives, id: \.self) { i in
                let opacity: CGFloat = i < numLives ? 1 : 0.3
                Image(image.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: dim, height: dim)
                    .opacity(opacity)
            }
        }
    }
}

#Preview {
    LivesView(
        image: .creature2,
        numLives: 1,
        maxLives: 3
    )
}
