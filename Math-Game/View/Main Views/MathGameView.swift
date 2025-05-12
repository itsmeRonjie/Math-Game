//
//  MathGameView.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/9/25.
//

import SwiftUI

struct MathGameView: View {
    private var gameVM: GameViewModel = GameViewModel()
    @Environment(HighScoreViewModel.self) private var highScoreVM: HighScoreViewModel

    @State private var highScoreViewIsPresented: Bool = false
    @State private var playerName: String = ""
    
    var showHighScore: Bool {
        gameVM.gameOver && highScoreVM.isNewHighScore(score: gameVM.score)
    }
    
    var showGameOverView: Bool {
        gameVM.gameOver
    }
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
                OptionsView(gameVM: gameVM)
            }
            .padding()
            .blur(radius: showGameOverView ? 5 : 0)
            .disabled(showGameOverView)
            
            GameOverView()
                .padding()
                .blur(radius: showGameOverView ? 0 : 30)
                .opacity(showGameOverView ? 1 : 0)
                .disabled(!showGameOverView)
                .onTapGesture {
                    gameVM.reset()
                }
        }
        .fullScreenCover(
            isPresented:  $highScoreViewIsPresented,
            onDismiss: {
                gameVM.reset()
            }) {
                EnterNewHighScoreView(
                    score: gameVM.score,
                    name: $playerName,
                    isPresented: $highScoreViewIsPresented
                )
            }
            .onChange(of: showHighScore) { _, newValue in
                highScoreViewIsPresented = newValue
            }
    }
}

#Preview {
    MathGameView()
        .environment(HighScoreViewModel())
}
