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
    let maxNumHighScores = 100
    var minHighScore: Int64? {
        if highScores.isEmpty {
            nil
        } else {
            highScores.last!.score
        }
    }
    
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
        let request = NSFetchRequest<HighScoreEntity>(entityName: "HighScoreEntity")
        let sortDescriptor = NSSortDescriptor(
            keyPath: \HighScoreEntity.score,
            ascending: false
        )
        
        request.sortDescriptors = [sortDescriptor]
        
        do {
            highScores = try container.viewContext.fetch(request)
        } catch let error as NSError {
            print("Error fetching high scores: \(error.localizedDescription)")
        }
    }
    
    func saveHighScores() {
        do {
            try container.viewContext.save()
            fetchHighScores()
        } catch let error as NSError {
            print("Error saving high scores: \(error.localizedDescription)")
        }
    }
    
    func addNewHighScore(name: String, score: Int64) {
        let entity = HighScoreEntity(context: container.viewContext)
        entity.name = name
        entity.score = score
        
        saveHighScores()
    }
    
    func updateHighScore(entity: HighScoreEntity, name: String) {
        let entity = HighScoreEntity(context: container.viewContext)
        entity.name = name
        
        saveHighScores()
    }
    
    func deleteHighScore(entity: HighScoreEntity) {
        container.viewContext.delete(entity)
        
        saveHighScores()
    }
    
    func isNewHighScore(score: Int) -> Bool {
        return if score <= 0 {
            false
        } else if let minHighScore {
            minHighScore < score || highScores.count <= maxNumHighScores
        } else {
            true
        }
    }
}
