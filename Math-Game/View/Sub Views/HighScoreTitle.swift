//
//  HighScoreTitle.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/12/25.
//

import SwiftUI

struct HighScoreTitle: View {
    var body: some View {
        HStack {
            VTextImage(
                text: "Rank",
                imgName: "creature0",
                dim: 25
            )
            VTextImage(
                text: "Score",
                imgName: "creature1",
                dim: 25
            )
            VTextImage(
                text: "Name",
                imgName: "creature2",
                dim: 25
            )
        }
        .padding(.horizontal)
    }
}

#Preview {
    HighScoreTitle()
}
