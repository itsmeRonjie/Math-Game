//
//  EnterNewHighScoreView.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/12/25.
//

import SwiftUI
import SwiftData

struct EnterNewHighScoreView: View {
    let score: Int
    @Binding var name: String
    @Binding var isPresented: Bool
    @Query private var highScores: [HighScoreEntity] = []
    @Environment(\.modelContext) var modelContext
    
    init(score: Int, name: Binding<String>, isPresented: Binding<Bool>) {
        self.score = score
        self._name = name
        self._isPresented = isPresented
    }
    
    var body: some View {
        ZStack {
            BackgroundView(colors: [.blue, .purple], opacity: 0.5)
            VStack {
                Text("New High Score!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding()
                
                Text("\(score)")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding()
                
                TextField("Enter Name", text: $name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .autocorrectionDisabled(true)
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .padding()
                
                Button {
                    addHighScore()
                    isPresented = false
                } label: {
                    Text("Save")
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
        }
    }
    
    func addHighScore() {
        name = name.isEmpty ? "Anonymous" : name.trimmingCharacters(in: .whitespaces)
        modelContext.insert(
            HighScoreEntity(
                name: name,
                score: score
            )
        )
    }
}

#Preview {
    EnterNewHighScoreView(
        score: 2,
        name: .constant(""),
        isPresented: .constant(true)
    )
    .modelContainer(for: HighScoreEntity.self)
}
