//
//  Math_GameApp.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/9/25.
//

import SwiftUI
import SwiftData

@main
struct Math_GameApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for: HighScoreEntity.self)
        }
    }
}
