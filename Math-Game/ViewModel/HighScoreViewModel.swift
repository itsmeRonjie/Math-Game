//
//  HighScoreViewModel.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/9/25.
//

import Foundation
import CoreData
import Observation

@Observable
class HighScoreViewModel {
    let container: NSPersistentContainer
    
    var highScores: [HighScoreEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "HighScoresDataModel")
        
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            } else {
                print(">>> CoreData loaded successfully")
            }
        }
    }
    
    func fetchHighScores() {
        // TODO:
    }
}
