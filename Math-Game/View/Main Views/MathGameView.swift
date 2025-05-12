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
                
                BubbleView(
                    textColor: .white,
                    bgColor: .purple.opacity(0.7),
                    imgName: "bubble2",
                    text: "\(gameVM.number1) + \(gameVM.number2)"
                )
                
                Spacer()
            }
        }
    }
}

#Preview {
    MathGameView()
}
