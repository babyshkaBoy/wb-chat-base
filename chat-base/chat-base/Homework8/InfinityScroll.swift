//
//  InfinityScroll.swift
//  chat-base
//
//  Created by Азамат Баев on 11.07.2024.
//

import SwiftUI

struct InfinityScroll: View {
    @State var emoji: [String] = .init()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem()]) {
                ForEach(emoji, id: \.self) { emoji in
                    ZStack {
                        RoundedCell(optionArrangement: .randomPosition)
                        Text(emoji)
                            .font(.system(size: 120))
                            .padding()
                            .opacity(0.5)
                    }
                    .padding(30)
                    Divider()
                }
            }
        }
        .onAppear() {
            for _ in 0..<100 {
                emoji.append(getRandomEmoji())
            }
        }
    }
    private func getRandomEmoji() -> String {
        let range = Emoji.all.randomElement()!
        let randomCodepoint = Int.random(in: range)
        return String(UnicodeScalar(randomCodepoint)!)
    }
}

struct Emoji {
    static var all: [ClosedRange<Int>] = [
        0x1F600...0x1F64F,
        0x1F900...0x1F9FF,
        0x1F680...0x1F6C5
        ]
}

enum OptionArrangement: CaseIterable {
    case first, second, third, fours

    static var randomPosition: OptionArrangement {
        return  OptionArrangement.allCases.randomElement() ?? .first
    }
}


#Preview {
    InfinityScroll()
}
