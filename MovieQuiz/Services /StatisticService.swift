//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Sergey Yayloyan on 20.06.2024.
//

import Foundation


final class StatisticService {
    
    private let storage: UserDefaults = .standard
    
    private enum Keys: String {
        case correct
        case bestGame
        case gamesCount
    }
}

extension StatisticService: StatisticServiceProtocol {
    
    var gamesCount: Int {
        get {
            storage.integer(forKey: Keys.gamesCount.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    
    var bestGame: GameResult {
        get {
            let correct = storage.integer(forKey: Keys.bestGame.rawValue + "_correct")
            let total = storage.integer(forKey: Keys.bestGame.rawValue + "_total")
            let dateString = storage.string(forKey: Keys.bestGame.rawValue + "_date") ?? ""
            let dateFormatter = ISO8601DateFormatter()
            let date = dateFormatter.date(from: dateString) ?? Date()
                    
            return GameResult(correct: correct, total: total, date: date)
                }
        set {
            storage.set(newValue.correct, forKey: Keys.bestGame.rawValue + "_correct")
            storage.set(newValue.total, forKey: Keys.bestGame.rawValue + "_total")
            let dateFormatter = ISO8601DateFormatter()
            let dateString = dateFormatter.string(from: newValue.date)
            storage.set(dateString, forKey: Keys.bestGame.rawValue + "_date")
            storage.synchronize()
            }
    }
    
    var totalAccuracy: Double {
        guard gamesCount > 0 else {
            return 0.0
        }
        let totalCorrect = Double(storage.integer(forKey: Keys.correct.rawValue))
        let totalQuestions = Double(gamesCount * 10)
        
        return (totalCorrect / totalQuestions) * 100.0
    }
    
    func store(correct count: Int, total amount: Int) {
        let currentTotalCorrect = storage.integer(forKey: Keys.correct.rawValue)
            let newTotalCorrect = currentTotalCorrect + count
            storage.set(newTotalCorrect, forKey: Keys.correct.rawValue)
                        
            var currentGamesCount = storage.integer(forKey: Keys.gamesCount.rawValue)
            if currentGamesCount == 0 {
                currentGamesCount = 1
                storage.set(currentGamesCount, forKey: Keys.gamesCount.rawValue)
            } else {
                currentGamesCount += 1
                storage.set(currentGamesCount, forKey: Keys.gamesCount.rawValue)
            }
                        
            let currentBestGame = bestGame
        
            let newGame = GameResult(correct: count, total: amount, date: Date())
                        
            if newGame.correct > currentBestGame.correct ||
                (newGame.correct == currentBestGame.correct && newGame.date > currentBestGame.date) {
                bestGame = newGame
            }
            
            storage.synchronize()
    }
    
}
