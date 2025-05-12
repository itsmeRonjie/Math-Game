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
            ForEach(gameVM.possibleSolutions, id: \.self) { option in
                SelectButtonView(
                    option: option,
                    gameVM: gameVM
                )
            }
        }
    }
}

struct SelectButtonView: View {
    let option: Int
    @State var selectedOption: Int? = nil
    let gameVM: GameViewModel

    var isSelected: Bool {
        selectedOption == option
    }
    
    var scale: CGFloat {
        isSelected ? 1.2 : 1.0
    }
    
    var color: Color {
        isSelected ? getRandomColor() : .purple.opacity(0.7)
    }
    
    func getRandomColor() -> Color {
        [.green.opacity(0.7), .red, .blue.opacity(0.5)].randomElement() ?? .green.opacity(0.7)
    }
    
    var body: some View {
        BubbleView(
            textColor: .black,
            bgColor: color,
            imgName: "bubble2",
            text: "\(option)"
        )
        .scaleEffect(scale)
        .onTapGesture {
            withAnimation(
                .spring(
                    response: 0.5,
                    dampingFraction: 0.3
                )
                .repeatCount(1, autoreverses: true)
            ) {
                selectedOption = option
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation {
                    selectedOption = nil
                }
            }
            
            withAnimation {
                if gameVM.answer == option {
                    gameVM.increaseScore()
                } else {
                    gameVM.loseLife()
                }
                gameVM.generateNumbers()
            }
        }
    }
}

#Preview {
    OptionsView(gameVM: GameViewModel())
}
