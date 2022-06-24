//
//  ContentView.swift
//  FlashZilla
//
//  Created by David Lee on 6/24/22.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
  @State private var cards = [Card](repeating: Card.example, count: 10)
      var body: some View {
        ZStack {
          VStack {
            ZStack {
              ForEach(0..<cards.count, id: \.self) { index in
                CardView(card: Card.example)
                  .stacked(at: index, in: cards.count)
              }
            }
          }
        }
        
          
      }
}

// we create a new stacked() modifier that takes a position in an array along
// with the total size of the array, and offsets a view by some amount based
// on those values
// this will allow us to create an attractive card stack where each card is
// little further down the screen than the ones before it

extension View {
  func stacked(at position: Int, in total: Int) -> some View {
    let offset = Double(total - position)
    return self.offset(x: 0, y: offset * 10)
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
