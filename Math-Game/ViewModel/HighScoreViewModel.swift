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
                fatalError(
                    "Unresolved error \(error.localizedDescription), \(error.userInfo)"
                )
            } else {
                print(">>> CoreData loaded successfully")
            }
        }
        fetchHighScores()
    }
    
    func fetchHighScores() {
        let request = NSFetchRequest<HighScoreEntity>(
            entityName: "HighScoreEntity"
        )
        
        do {
            highScores = try container.viewContext.fetch(request)
        } catch let error as NSError {
            print("Error fetching high scores: \(error.localizedDescription)")
        }
    }
}
