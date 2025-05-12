//
//  MathGameView.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/9/25.
//

import SwiftUI

struct MathGameView: View {
    private var gameVM: GameViewModel = GameViewModel()
    var body: some View {
        ZStack{
            GameBackgroundView()
            VStack {
                ScoreLivesView(
                    score: gameVM.score,
                    lives: gameVM.gameModel.lives,
                    maxLives: 3,
                    level: gameVM.gameModel.level
                )
                Spacer()
            }
        }
    }
}

#Preview {
    MathGameView()
}
