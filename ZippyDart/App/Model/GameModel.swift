//
//  GameModel.swift
//  ZippyDart
//
//  Created by SAUTJEAU Lea on 01/02/2024.
//

import Foundation

struct Game {
    var players: [Player]
    var currentPlayerIndex: Int
    var rounds: [Round]
    
    init(players: [Player]) {
        self.players = players
        self.currentPlayerIndex = 0
        self.rounds = []
    }
    
    // Démarre la partie en initialisant le premier round pour chaque joueur
    mutating func startGame() {
        rounds = []
        for _ in players {
            let round = Round()
            rounds.append(round)
        }
    }
    
    // Effectue le tour du joueur actuel avec les scores donnés
    mutating func playTurn(scores: [Int]) {
        guard currentPlayerIndex < players.count else {
            return // Tous les joueurs ont joué, la partie est terminée
        }
        
        var currentPlayer = players[currentPlayerIndex]
        currentPlayer.addRound(scores: scores)
        players[currentPlayerIndex] = currentPlayer
        
        if currentPlayer.hasWon() {
            // Le joueur actuel a gagné
            print("Le joueur \(currentPlayer.name) a gagné!")
        } else {
            // Passe au joueur suivant
            currentPlayerIndex = (currentPlayerIndex + 1) % players.count
        }
    }
}
