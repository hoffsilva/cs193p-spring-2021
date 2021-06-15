//
//  ContentView.swift
//  momorize
//
//  Created by Hoff Henry Pereira da Silva on 15/06/21.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚂", "🚀", "🚁", "🚜", "🚲", "🛴", "🏍", "🛺", "🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🛸", "🛶", "⛵️", "🚤", "🛩", "🚇", "🦼", "🦽", "🛵"]
    
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(emojis[0..<emojiCount],
                        id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                removeCardView
                Spacer()
                addCardView
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var removeCardView: some View {
        Button(action: removeCardAction , label: {
            Image(systemName: "minus.circle")
        })
    }
    
    var addCardView: some View {
        Button(action: addCardAction , label: {
            Image(systemName: "plus.circle")
        })
    }
    
    private func removeCardAction() -> Void {
        if emojiCount > 1 {
            emojiCount -= 1
        }
    }
    
    private func addCardAction() -> Void {
        if emojiCount < emojis.count {
            emojiCount += 1
        }
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle).padding()
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 mini")
            .preferredColorScheme(.dark)
        ContentView()
            .previewDevice("iPhone 12 mini")
            .preferredColorScheme(.light)
        
    }
}

