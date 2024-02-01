import SwiftUI

struct Card: View {
    var player: Player
    @State private var isButtonEnabled = false // Vous devrez gérer l'état du bouton en fonction de votre logique

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.softGray)
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.8)
                
                .overlay(
                    VStack {
                        Text("Joueur \(player.number)")
                            .font(.caption)
                            .foregroundColor(.black)
                            .padding(.top, 32)
                        
                        Text(player.name)
                            .font(Font.custom("SeymourOne", size: 22))
                            .foregroundColor(.redZippy)
                            .padding(.top, 6)
                        
                        Text("\(player.totalPoints)")
                            .font(Font.custom("SeymourOne", size: 64))
                            .foregroundColor(.redZippy)
                            .padding(.top, 6)
                        
                        Spacer()
                    }
                )
                .navigationBarHidden(true)

            ButtonRegisterScore()
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(player: Player(number: 1, name: "Nom du joueur", totalPoints: 301, rounds: []))
    }
}

struct ButtonRegisterScore: View {
    var body: some View {
        Button(action: {
            // Ajoutez votre logique pour le bouton ici
        }) {
            HStack {
                Text("Marquer vos scores")
                Image(systemName: "pencil")
            }
            .font(.custom("medium", size: 16))
            .foregroundColor(.softGray)
            .padding()
            .padding(.horizontal, 16)
            .padding(.vertical, 0)
            .frame(height: 48, alignment: .center)
            /*.background(isButtonEnabled ? Color.cadetBlue : Color.lockGray)*/
            .background(.lockGray)
            .cornerRadius(50)
            .shadow(color: Color(red: 0.4, green: 0.36, blue: 0.5).opacity(0.3), radius: 4, x: 0, y: 4)
            /*.disabled(!isButtonEnabled)*/
        }
        .padding(.top, 16)
    }
}
