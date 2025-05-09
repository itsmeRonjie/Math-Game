//
//  BackgroundView.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/9/25.
//

import SwiftUI

struct BackgroundView: View {
    let colors: [Color]
    let opacity: Double
    var body: some View {
        LinearGradient(
            colors: colors,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .opacity(opacity)
        .ignoresSafeArea()
    }
}

struct GameBackgroundView: View {
    var body: some View {
        BackgroundView(
            colors: [
                .purple,
                .pink,
                .clear
            ],
            opacity: 0.7
        )
    }
}

struct HighScoreBackgroundView: View {
    var body: some View {
        BackgroundView(
            colors: [
                .black,
                .black,
                .gray
            ],
            opacity: 0.7
        )
    }
}


#Preview {
    BackgroundView(
        colors: [
            .purple,
            .pink,
            .clear
        ],
        opacity: 0.7
    )
}
