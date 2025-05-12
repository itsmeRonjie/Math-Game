//
//  HighScoreView.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/9/25.
//

import SwiftUI

struct HighScoreView: View {
    private var highScoreVM: HighScoreViewModel = HighScoreViewModel()

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
                        Text("\(index + 1) \(entity.score)")
                    }
                }
                
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
