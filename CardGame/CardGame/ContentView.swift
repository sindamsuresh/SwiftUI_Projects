//
//  ContentView.swift
//  CardGame
//
//  Created by Suresh Sindam on 7/21/23.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var playerCard = "card2"
    @State private var cpuCard = "card3"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        ZStack {
            Image("background")
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button {
                    //Generate Random numbers between 2 to 14
                    let playRanNum = Int.random(in: 2...14)
                    let cpuRanNum = Int.random(in: 2...14)
                    
                    // update the cards
                    playerCard = "card" + String(playRanNum)
                    cpuCard = "card" + String(cpuRanNum)
                    
                    // update scores
                    if(playRanNum > cpuRanNum) {
                        playerScore += 1
                    } else if(playRanNum < cpuRanNum) {
                        cpuScore += 1
                    }
                } label: {
                    Image("dealbutton")
                }
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
