//
//  RankScoreView.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/12/25.
//

import SwiftUI

struct RankScoreView: View {
    let rank: Int
    let score: Int
    let entity: HighScoreEntity
    
    let scoreColors: [Color] = [
        .blue, .pink, .yellow, .green, .orange
    ]
    
    var color: Color {
        scoreColors[(rank - 1) % scoreColors.count]
    }
    
    @State private var name = ""
    @State private var editMode = false

    private var highScoreVM: HighScoreViewModel = HighScoreViewModel()
    
    init(
        rank: Int,
        score: Int,
        highScoreEntity: HighScoreEntity,
        editMode: Bool = false
    ) {
        self.rank = rank
        self.score = score
        self.entity = highScoreEntity
        self.editMode = editMode
    }
    
    var body: some View {
        VStack {
            if editMode {
                Text("Editing..")
                HStack {
                    TextField(entity.name ?? name, text: $name)
                        .padding()
                        .background(.green.gradient)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .cornerRadius(10)
                    
                    Button {
                        highScoreVM
                            .updateHighScore(
                                entity: entity,
                                name: name.isEmpty ? (entity.name ?? "Anonymous") : name
                            )
                        
                        withAnimation {
                            editMode.toggle()
                        }
                    } label: {
                        Text("Save")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.red.gradient)
                            .cornerRadius(10)
                    }

                }
            } else {
                Text("Display Score Data")
                    .onTapGesture {
                        withAnimation {
                            editMode.toggle()
                        }
                    }
            }
        }
    }
}

#Preview {
    RankScoreView(
        rank: 1,
        score: 102,
        highScoreEntity: HighScoreEntity()
    )
    .environment(HighScoreViewModel())
}
