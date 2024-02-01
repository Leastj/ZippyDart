//
//  CreateParty.swift
//  ZippyDart
//
//  Created by SAUTJEAU Lea on 22/01/2024.
//

import SwiftUI

struct FullScreenCoverView: View {
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {
                    
                
                    LogoRed()
                        
                    
                    ButtonCreatParty()
                    
                }
            }
        }
    }
}

#Preview {
    FullScreenCoverView()
}

struct LogoRed: View {
    var body: some View {
        Image("logoRed")
            .imageScale(.large)
    }
}

struct CreatPartyButtonContent: View {
    var body: some View {
        HStack{
            Text("Créer une partie")
            Image(systemName: "play.fill")
        }
        .font(.custom("medium", size: 16))
        .foregroundColor(.softGray)
        .padding()
        .padding(.horizontal, 16)
        .padding(.vertical, 0)
        .frame(height: 48, alignment: .center)
        .background(Color.redZippy)
        .cornerRadius(50)
        .shadow(color: Color(red: 0.4, green: 0.36, blue: 0.5).opacity(0.3), radius: 4, x: 0, y: 4)
    }
}

struct ButtonCreatParty: View {
    @State private var isCreatingParty = false

    var body: some View {
        VStack {
            
            
            CreatPartyButtonContent()
                .onTapGesture {
                    isCreatingParty = true
                }
                .fullScreenCover(isPresented: $isCreatingParty) {
                    PlayersInscriptionView()
                }
            
            
        }
        .padding(.vertical, 80)
    }
}
