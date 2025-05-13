//
//  RankScoreView.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/12/25.
//

import SwiftUI
import SwiftData

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
    
    @Environment(\.modelContext) var modelContext
    
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
                    TextField(entity.name, text: $name)
                        .padding()
                        .background(.green.gradient)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .cornerRadius(10)
                        .autocorrectionDisabled(true)
                    
                    Button {
                        update(entity: entity, name: name)
                    } label: {
                        Text("Save")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.red.gradient)
                            .cornerRadius(10)
                    }
                }
            } else {
                HStack {
                    Text(rank.ordinal)
                        .frame(maxWidth: .infinity)
                    Text("\(score)")
                        .frame(maxWidth: .infinity)
                    Text(entity.name.uppercased())
                        .frame(maxWidth: .infinity)
                }
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(color)
                .onTapGesture {
                    withAnimation {
                        editMode.toggle()
                    }
                }
            }
        }
    }
    
    func update(entity: HighScoreEntity, name: String) {
        entity.name = name.isEmpty ? entity.name : name
        do {
            try modelContext.save()
        } catch {
            print("update/save failure")
        }
        withAnimation {
            editMode.toggle()
        }
    }
}

#Preview {
    RankScoreView(
        rank: 1,
        score: 102,
        highScoreEntity: HighScoreEntity(
            name: "Ronjie",
            score: 123
        )
    )
}
