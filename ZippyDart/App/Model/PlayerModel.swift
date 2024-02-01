//
//  Players.swift
//  ZippyDart
//
//  Created by SAUTJEAU Lea on 01/02/2024.
//

import Foundation

struct Player: Identifiable {
    let id = UUID()
    var number: Int
    var name: String
    var totalPoints: Int // Points restants pour ce joueur (par exemple, 301 au début)
    var rounds: [Round] // Liste des tours joués par le joueur (programmé pour 3 scores à chaque tours)
    
    
    
  
    // Ajouter un nouveau tour pour le joueur avec des scores donnés
    mutating func addRound(scores: [Int]) {
        var newRound = Round() // Utilisez l'initialiseur sans arguments
        newRound.scores = scores
        rounds.append(newRound)
        updateTotalPoints()
    }
    
    
    // Mettre à jour le total des points du joueur en fonction de ses tours
     mutating func updateTotalPoints() {
         totalPoints = 301 - rounds.reduce(0) { $0 + $1.roundTotal }
     }

     // Vérifier si le joueur a gagné
     func hasWon() -> Bool {
         return totalPoints == 0
     }
    
}
