//
//  RoundModel.swift
//  ZippyDart
//
//  Created by SAUTJEAU Lea on 01/02/2024.
//

import Foundation

struct Round {
    var scores: [Int]
    var roundTotal: Int

    init() {
        // Initialiser scores avec trois scores par défaut, par exemple [0, 0, 0]
        scores = Array(repeating: 0, count: 3)
        // Calculer le total lors de l'initialisation
        roundTotal = scores.reduce(0, +)
    }

    // Mettre à jour le total en fonction des scores actuels
    mutating func updateTotal() {
        roundTotal = scores.reduce(0, +)
    }

    // Vérifier si le round est valide (score non négatif)
    func isValidRound() -> Bool {
        return roundTotal >= 0
    }
}
