//
//  PlayersInscription.swift
//  ZippyDart
//
//  Created by SAUTJEAU Lea on 31/01/2024.
//

import SwiftUI



struct PlayersInscriptionView: View {
    @State private var players: [Player] = [Player(number: 1, name: "", totalPoints: 301, rounds: [])]
    @State private var navigateToScoreBoardView: Bool = false // Nouvelle variable d'état pour la navigation
    // Variable calculée pour déterminer si le bouton doit être activé
    private var isButtonEnabled: Bool {
        return !players.allSatisfy { $0.name.isEmpty }
    }
    
    var body: some View {
        NavigationView { // Utiliser NavigationView pour activer la navigation
            VStack {
                Title()
                
                List() {
                    ForEach(players) { player in
                        VStack(alignment: .leading) {
                            Text("Joueur \(player.number)")
                                .font(.callout)
                                .foregroundStyle(.darkgray)
                            
                            
                            TextField("Nom", text: $players[getIndex(for: player)].name)
                                .padding(10.0)
                               
                                .background(Color.softGray)
                                .cornerRadius(10)
                        }
                        .listRowSeparator(.hidden, edges: .all)
                        
                    }
                    .onDelete(perform: deletePlayers)
                }
                
                .listStyle(PlainListStyle())
                
                
                HStack {
                    ButtonAddPlayer(addPlayer: addPlayer)
                    Spacer()
                    
                    NavigationLink(destination: ScoreBoardView(), isActive: $navigateToScoreBoardView) {
                        EmptyView()
                    }
                    
                    Button(action: {
                        navigateToScoreBoardView = true // Activer la navigation vers ScoreView
                    }) {
                        ButtonStartGame(isButtonEnabled: isButtonEnabled)
                    }
                    .disabled(!isButtonEnabled) // Désactiver le bouton si tous les noms de joueur sont vides
                }
                .padding(.horizontal, 20)
            }
            .padding(.vertical, 20)
            .navigationBarHidden(true)
        }
    }
    
    
    private func addPlayer() {
        let newPlayer = Player(number: players.count + 1, name: "", totalPoints: 301, rounds: [])
        players.append(newPlayer)
        print("Joueur ajouté. Nombre total de joueurs : \(players.count)")
    
    }
    
    private func deletePlayers(at offsets: IndexSet) {
        withAnimation {
            players.remove(atOffsets: offsets)
            updatePlayerNumbers()
            print("Joueurs après la suppression : \(players)")
        }
    }
    
    private func getIndex(for player: Player) -> Int {
        if let index = players.firstIndex(where: { $0.id == player.id }) {
            return index
        }
        return 0
    }
    
    private func updatePlayerNumbers() {
        for (index, _) in players.enumerated() {
            players[index].number = index + 1
        }
    }
}


#Preview {
    PlayersInscriptionView()
}



struct Title: View {
    var body: some View {
        Text("Inscription des \njoueurs")
            .font(Font.custom("SeymourOne", size: 28))
            .foregroundColor(.redZippy)
            .multilineTextAlignment(.center)
            .padding()
    }
}

struct ButtonAddPlayer: View {
    var addPlayer: () -> Void
    
    var body: some View {
        Button(action: addPlayer) {
            HStack {
                Image(systemName: "person.fill.badge.plus")
                    .font(.custom("medium", size: 20))
                    .foregroundColor(.softGray)
                    .padding()
                    .font(.custom("medium", size: 20))
                    .foregroundColor(.softGray)
            }
            .frame(width: 100, height: 48, alignment: .center)
            .background(Color(red: 0.9, green: 0.22, blue: 0.27))
            .cornerRadius(50)
            .shadow(color: Color(red: 0.4, green: 0.36, blue: 0.5).opacity(0.3), radius: 4, x: 0, y: 4)
        }
    }
}

struct ButtonStartGame: View {
    var isButtonEnabled: Bool

    var body: some View {
        HStack {
            Text("Jouer !")
            Image(systemName: "play.fill")
        }
        .font(.custom("medium", size: 16))
        .foregroundColor(.softGray)
        .padding()
        .padding(.horizontal, 16)
        .padding(.vertical, 0)
        .frame(height: 48, alignment: .center)
        .background(isButtonEnabled ? Color.cadetBlue : Color.lockGray)
        .cornerRadius(50)
        .shadow(color: Color(red: 0.4, green: 0.36, blue: 0.5).opacity(0.3), radius: 4, x: 0, y: 4)
    }
}
