//
//  Math_GameApp.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/9/25.
//

import SwiftUI

@main
struct Math_GameApp: App {
    @State private var highScoreVM: HighScoreViewModel = HighScoreViewModel()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(highScoreVM)
        }
    }
}
