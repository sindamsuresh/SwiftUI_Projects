//
//  ContentView.swift
//  SlotsGame
//
//  Created by admin on 7/21/23.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    let name: String
    let image: Image
}

struct ContentView: View {
    
    
    @State private var randomItems: [Item] = []
    @State private var score = 0
    
    private let items: [Item] = [
        Item(name: "apple", image: Image("apple")),
        Item(name: "star", image: Image("star")),
        Item(name: "cherry", image: Image("cherry"))
    ]
    
    
    private var initialRandomItems: [Item] {
        generateRandomItems()
    }
    
    init() {
        // Set the initial value for randomItems
        _randomItems = State(initialValue: initialRandomItems)
    }
    
    private func generateRandomItems() -> [Item] {
        var randomItems = [Item]()
        for _ in 0..<3 {
            let randomIndex = Int.random(in: 0..<items.count)
            randomItems.append(items[randomIndex])
        }
        return randomItems
    }
    
    private func calculateScore(_ items: [Item]) -> Int {
        let names = items.map { $0.name }
        if names[0] == names[1] && names[1] == names[2] {
            return 300
        } else if names[0] == names[1] || names[0] == names[2] || names[1] == names[2] {
            return 200
        } else {
            return -100
        }
    }
    
    private func resetGame() {
        score = 0
        randomItems = items // Reset the randomItems array to initial state
    }
    
    
    
    var body: some View {
        ZStack {
            VStack {
                Text("Slots Match")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20.0)
                
                Spacer()
                
                Text("Score: \(score)")
                
                Spacer()
                
                HStack {
                    Spacer()
                    ForEach(randomItems) { item in
                        item.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Spacer()
                    }
                }
                Spacer()
                
                HStack {
                    Spacer()
                    Button("Restart") {
                        resetGame()
                    }
                    .frame(width: 150.0, height: 50.0)
                    .foregroundColor(.white)
                    .background(.red)
                    .clipShape(Capsule())
                    
                    Spacer()
                    
                    Button("Spin") {
                        // Update the images based on random string
                        randomItems = generateRandomItems()
                        score += calculateScore(randomItems)
                    }
                    .frame(width: 150.0, height: 50.0)
                    .foregroundColor(.white)
                    .background(.green)
                    .clipShape(Capsule())
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
