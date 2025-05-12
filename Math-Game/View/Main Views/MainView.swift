//
//  ContentView.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/9/25.
//

import SwiftUI
import CoreData

struct MainView: View {
    var body: some View {
        TabView {
            MathGameView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Game")
                }
            
            HighScoreView()
                .tabItem {
                    Image(systemName: "list.number")
                    Text("High Scores")
                }
        }
    }
}

#Preview {
    MainView()
        .environment(HighScoreViewModel())
}
