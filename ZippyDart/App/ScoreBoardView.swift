//
//  ScoreBoardView.swift
//  ZippyDart
//
//  Created by SAUTJEAU Lea on 31/01/2024.
//
import SwiftUI

struct ScoreBoardView: View {
    var players: [Player]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(players) { player in
                    Card(player: player)
                }
            }
            .padding()
        }
    }
}

struct ScoreBoardView_Previews: PreviewProvider {
    static var previews: some View {
        // Créez une liste fictive de joueurs pour l'aperçu
        let previewPlayers = [
            Player(number: 1, name: "John Doe", totalPoints: 301, rounds: []),
            Player(number: 2, name: "Jane Doe", totalPoints: 301, rounds: [])
            // Ajoutez autant de joueurs que nécessaire pour l'aperçu
        ]

        // Utilisez cette liste de joueurs dans l'aperçu de ScoreBoardView
        ScoreBoardView(players: previewPlayers)
    }
}
