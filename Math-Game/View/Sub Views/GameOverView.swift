//
//  GameOverView.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/12/25.
//

import SwiftUI

struct GameOverView: View {
    var body: some View {
        HStack {
            Label {
                Text("Game Over")
                    .multilineTextAlignment(.center)
                Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .foregroundStyle(.yellow)
            } icon: {
                Image(Creatures.creature5.rawValue)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .padding()
                    .background(.red)
                    .clipShape(Circle())
            }
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .cornerRadius(10)
            .shadow(radius: 3)

        }
    }
}

#Preview {
    GameOverView()
}
