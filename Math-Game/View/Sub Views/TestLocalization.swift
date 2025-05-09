//
//  TestLocalization.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/9/25.
//

import SwiftUI

struct TestLocalization: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Game Over")
            Text("Score")
            Text("Level")
            Text("Game")
            Text("Rank")
            Text("Name")
            Text("Save")
        }
        .font(.title)
    }
}

#Preview {
    TestLocalization()
}
