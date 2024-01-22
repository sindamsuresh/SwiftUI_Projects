//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Suresh Sindam on 1/20/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedAns = ""
    @State private var showingScore = false
    @State private var score = 0

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAns = Int.random(in: 0...2)

    var body: some View {
        ZStack {
            LinearGradient(colors: [.red, .blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Text("Guess The Flag")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                VStack(spacing: 30) {
                    Spacer()
                    VStack(spacing: 16) {
                        Text("Tap the falg of")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        Text(countries[correctAns])
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                    VStack(spacing: 20) {
                        Spacer()
                        ForEach(0..<3) { number in
                            Button {
                                checkAns(number: number)
                            } label: {
                                Image(countries[number].lowercased())
                                    .clipShape(Capsule())
                                    .shadow(radius: 4)
                            }
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    Spacer()
                }
                Text("Your score is : \(score)")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.primary)
                
            }
            .padding(20)
        }
        .alert(selectedAns, isPresented: $showingScore) {
            Button("🎉 Continue 🎉") {
                continueGame()
            }
            Button("😇 Guess Again 😇") {}.background(Color.gray)
        } message: {
            Text("Your score is : \(score)")
        }
    }
    
    func checkAns(number: Int) {
        if(number == correctAns) {
            selectedAns = "Correct"
            score += 1
            print("correct")
        } else {
            selectedAns = "Wrong"
            score -= 1
            print("wrong")
        }
        showingScore = true
    }
    
    func continueGame() {
        countries.shuffle()
        correctAns = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
