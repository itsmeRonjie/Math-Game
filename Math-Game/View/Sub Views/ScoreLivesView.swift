//
//  ScoreLivesView.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/9/25.
//

import SwiftUI

struct ScoreLivesView: View {
    let score: Int
    let lives: Int
    let maxLives: Int
    let level: Int
    
    var body: some View {
        HStack {
            TitleValueView(title: "Score", value: score)
            
            Spacer()
            
            TitleValueView(title: "Level", value: level)

            Spacer()
            
            LivesView(
                image: .creature2,
                numLives: lives,
                maxLives: maxLives
            )
        }
        .padding()
    }
}



#Preview {
    ZStack{
        GameBackgroundView()
        ScoreLivesView(
            score: 2,
            lives: 3,
            maxLives: 3,
            level: 23
        )
    }
}
