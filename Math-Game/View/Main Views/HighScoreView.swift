//
//  HighScoreView.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/9/25.
//

import SwiftUI

struct HighScoreView: View {
    @Environment(HighScoreViewModel.self) private var highScoreVM: HighScoreViewModel

    var body: some View {
        ZStack {
            HighScoreBackgroundView()
            
            VStack {
                HighScoreTitle()
                    .foregroundStyle(.background)
                
                List {
                    ForEach(
                        Array(highScoreVM.highScores.enumerated()),
                        id: \.offset
                    ) { index, entity in
                        RankScoreView(
                            rank: index + 1,
                            score: Int(entity.score),
                            highScoreEntity: entity
                        )
                    }
                    .onDelete(perform: highScoreVM.deleteHighScore)
                    .listRowBackground(Color.black)
                }
                .listStyle(.plain)
                
                Image("creature0")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
        }
    }
}

#Preview {
    HighScoreView()
        .environment(HighScoreViewModel())
}
