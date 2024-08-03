//
//  ContactCell+.swift
//  
//
//  Created by Азамат Баев on 03.08.2024.
//

import SwiftUI

//MARK: Indicators and Initial
public extension View {
     var storiesIndicator: some View {
        RoundedRectangle(cornerRadius: 16)
            .stroke(LinearGradient(
                colors: [
                    .gradientLightBlue,
                    .gradientBlue
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ), lineWidth: 2)
            .frame(width: 54, height: 54)
    }
    
     var onlineIndicator: some View {
        Circle()
            .stroke(.white, lineWidth: 2)
            .background(Circle().fill(.green))
            .frame(width: 12)
    }
    
    func initials(from name: String) -> String {
        let names = name.split(separator: " ")
        let initials = names.compactMap { $0.first }
        return initials.map(String.init).joined()
    }
}
