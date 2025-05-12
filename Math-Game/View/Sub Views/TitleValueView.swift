//
//  TitleValueView.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/9/25.
//

import SwiftUI

struct TitleValueView: View {
    let title: String
    let value: Int
    var body: some View {
        VStack {
            Text(title)
            Text("\(value)")
        }
        .font(.headline)
        .fontWeight(.bold)
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        GameBackgroundView()
        TitleValueView(title: "Score", value: 2)
    }
}
