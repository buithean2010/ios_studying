//
//  ContentView.swift
//  Memorize
//
//  Created by Bui The An on 2022/12/22.
//

import SwiftUI

struct ContentView: View {
    // card content array
    var emojis = ["🛫", "🚀", "🚗", "🛵", "🚆", "🚇", "🚅", "🚴", "🚲", "⛴", "🚢", "🚣", "🚌", "🚍", "♨️"]
    
    // Maximunt card count
    @State var emojiCount = 4
    
    var body: some View {
        VStack{
            ScrollView{
                // Cards layout
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
                
            }
            .foregroundColor(.red)
            // Add space between card stack and button stack
            Spacer()
            // Buttons layout
            HStack{
                remove
                // Add space between buttons
                Spacer()
                add
            }.font(.largeTitle)
            
        }
        .padding(.horizontal)
    }
    
    var add: some View {
        // Add card Button
        Button(
            action: {
                if (emojiCount < emojis.count) {
                    emojiCount += 1
                }
            },
            label: {
                VStack {
                    Image(systemName: "plus.circle")
                }
            })
    }
    
    var remove: some View {
        // Remove card Button
        Button(
            action: {
                if emojiCount > 1 {
                    emojiCount -= 1
                }
            },
            label: {
                Image(systemName: "minus.circle")
            })
    }
}

/// Card structure
struct CardView: View {
    // content of the card
    var content: String
    
    // card status, true: up, false: down
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack{
            // define the shape of the card
            let shape = RoundedRectangle(cornerRadius: 20)
            
            // logic
            if isFaceUp {
                // faceup card
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                // facedown card
                shape.fill()
            }
            
        }
        .onTapGesture {
            // tap logic when tapping the cardview
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
