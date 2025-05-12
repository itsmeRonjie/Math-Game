//
//  OptionsView.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/12/25.
//

import SwiftUI

struct OptionsView: View {
    let gameVM: GameViewModel
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(gameVM.possibleSolutions, id: \.self) { options in
                BubbleView(
                    textColor: .black,
                    bgColor: .purple.opacity(0.7),
                    imgName: "bubble2",
                    text: "\(options)"
                )
                .onTapGesture {
                    withAnimation {
                        if gameVM.answer == options {
                            gameVM.increaseScore()
                        } else {
                            gameVM.loseLife()
                        }
                        gameVM.generateNumbers()
                    }
                }
            }
        }
    }
}

#Preview {
    OptionsView(gameVM: GameViewModel())
}
