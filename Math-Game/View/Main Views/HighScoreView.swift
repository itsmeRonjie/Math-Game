//
//  HighScoreView.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/9/25.
//

import SwiftUI

struct HighScoreView: View {
    var body: some View {
        ZStack {
            HighScoreBackgroundView()
            Text("High Score View")
                .foregroundStyle(.background)
        }
    }
}

#Preview {
    HighScoreView()
}
