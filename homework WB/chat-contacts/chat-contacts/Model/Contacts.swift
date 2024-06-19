//
//  Contacts.swift
//  chat-contacts
//
//  Created by Азамат Баев on 11.06.2024.
//

import SwiftUI

struct Contacts: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var phoneNumber: String
    var status: String
    var isOnline: Bool
    var hasNewStories: Bool
    var avatar: String?
}

extension Contacts {
    static let contacts: [Contacts] = [
        .init(name: "Анастасия Иванова", phoneNumber: "1111111111", status: "Last seen yesterday", isOnline: false, hasNewStories: false, avatar: "nastya"),
        .init(name: "Петя", phoneNumber: "359821", status: "Online", isOnline: true, hasNewStories: false, avatar: "petya"),
        .init(name: "Маман", phoneNumber: "748458404", status: "Last seen 3 hours ago", isOnline: false, hasNewStories: true, avatar: "maman"),
        .init(name: "Арбуз Дыня", phoneNumber: "646656565", status: "Online", isOnline: true, hasNewStories: false, avatar: "arbyz"),
        .init(name: "Иван Иванов", phoneNumber: "757575757", status: "Online", isOnline: true, hasNewStories: false),
        .init(name: "Лиса Алиса", phoneNumber: "93939393", status: "Last seen 30 minutes ago", isOnline: false, hasNewStories: true)
    ]
}
