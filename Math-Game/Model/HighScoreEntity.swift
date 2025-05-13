//
//  HighScoreEntity.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/13/25.
//

import Foundation
import SwiftData

@Model
class HighScoreEntity: Identifiable {
    private(set) var id = UUID()
    var name: String
    private(set) var score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
