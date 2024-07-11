//
//  RoundedCell.swift
//  chat-base
//
//  Created by Азамат Баев on 11.07.2024.
//

import SwiftUI

struct RoundedCell: View {
    var optionArrangement: OptionArrangement
    
    var body: some View {
        ZStack {
            switch optionArrangement {
            case .first:
                topOne_BottomTwo
            case .second:
                topTwo_BottomOne
            case .third:
                rightOne_LeftTwo
            case .fours:
                leftOne_RightTwo
            }
        }
    }
    var topTwo_BottomOne: some View {
        VStack {
            HStack {
                rectangle.frame(width: 150, height: 100)
                rectangle.frame(width: 150, height: 100)
            }
            rectangle.frame(width: 300, height: 100)
                .foregroundStyle(.blue)
        }
    }
    var leftOne_RightTwo: some View {
        HStack {
            rectangle.frame(width: 100, height: 220)
                .foregroundStyle(.blue)
            VStack {
                rectangle.frame(width: 200, height: 100)
                rectangle.frame(width: 200, height: 100)
            }
        }
    }
    var rightOne_LeftTwo: some View {
        HStack {
            VStack {
                rectangle.frame(width: 200, height: 100)
                rectangle.frame(width: 200, height: 100)
            }
            rectangle.frame(width: 100, height: 220)
                .foregroundStyle(.blue)
        }
    }
    var topOne_BottomTwo: some View {
        VStack() {
            rectangle.frame(width: 300, height: 100)
                .foregroundStyle(.blue)
            HStack {
                rectangle.frame(width: 150, height: 100)
                rectangle.frame(width: 150, height: 100)
            }
        }
    }
    var rectangle: some View {
        RoundedRectangle(cornerRadius: 70)
            .stroke(style: StrokeStyle(lineWidth: 2, dash: [10,5]))
    }
}

#Preview {
    RoundedCell(optionArrangement: .randomPosition)
}
