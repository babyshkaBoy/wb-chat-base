//
//  CustomIcons.swift
//  chat-contacts
//
//  Created by Азамат Баев on 16.06.2024.
//

import SwiftUI

enum CustomIcons: String {
    case linkedIn
    case facebook
    case instagram
    case twitter
    
    var name: String {
        rawValue
    }
}
extension Image {
    init(_ name: CustomIcons) {
        self.init(name.rawValue)
    }
}

    
