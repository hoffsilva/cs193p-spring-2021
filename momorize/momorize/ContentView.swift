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
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            HStack {
                Button(action: {
                    emojiCount += 1
                }, label: {
                    VStack {
                        Text("Add")
                        Text("Card")
                    }
                })
                Spacer()
                Button(action: {
                    emojiCount -= 1
                }, label: {
                    VStack {
                        Text("Remove")
                        Text("Card")
                    }
                })
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
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

