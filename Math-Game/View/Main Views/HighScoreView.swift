//
//  HighScoreView.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/9/25.
//

import SwiftUI
import SwiftData

struct HighScoreView: View {
    @Query(sort: [SortDescriptor(\HighScoreEntity.score, order: .reverse)])
    private var highScores: [HighScoreEntity]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        ZStack {
            HighScoreBackgroundView()
            
            VStack {
                HighScoreTitle()
                    .foregroundStyle(.background)
                
                List {
                    ForEach(
                        Array(highScores.enumerated()),
                        id: \.offset
                    ) { index, entity in
                        RankScoreView(
                            rank: index + 1,
                            score: Int(entity.score),
                            highScoreEntity: entity
                        )
                    }
                    .onDelete(perform: deleteScore)
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
    
    func deleteScore(indexSet: IndexSet) {
        for index in indexSet {
            modelContext.delete(highScores[index])
        }
    }
}

#Preview {
    HighScoreView()
        .modelContainer(for: HighScoreEntity.self)
}
