//
//  ContactCell.swift
//  chat-base
//
//  Created by Азамат Баев on 19.06.2024.
//

import SwiftUI
struct ContactCell: View {
    var contact: Contacts
    var body: some View {
        HStack() {
            if let avatar = contact.avatar {
                Image(avatar)
                    .resizable()
                    .frame(width: 48, height: 48)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .frame(width: 56, height: 56)
                    .background(storiesIndicator
                        .opacity(contact.hasNewStories ? 1 : 0))
                    .overlay(onlineIndicator
                        .opacity(contact.isOnline ? 1 : 0),
                             alignment: .topTrailing)
                    .padding(.trailing, 12)

            } else {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.purple)
                    .frame(width: 56, height: 56)
                    .overlay(
                        Text(initials(from: contact.name) )
                            .font(.system(size: 14))
                            .foregroundColor(.white) )
                    .background(storiesIndicator
                        .opacity(contact.hasNewStories ? 1 : 0))
                    .overlay(onlineIndicator
                        .opacity(contact.isOnline ? 1 : 0),
                             alignment: .topTrailing)
                    .padding(.trailing, 12)
            }
            VStack(alignment: .leading) {
                Text(contact.name)
                    .font(.system(size: 14, weight: .semibold))
                    .padding(.bottom, 4)
                Text(contact.isOnline ? "Онлайн" : contact.status)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(contact.isOnline ? .green : .secondary)
            }

        }
    }
}

//MARK: Indicators and Initial
private var storiesIndicator: some View {
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

private var onlineIndicator: some View {
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

#Preview {
    ContactCell(contact: Contacts(name: "Арбуз Дыня", phoneNumber: "646656565", status: "Online", isOnline: true, hasNewStories: false, avatar: "arbyz"))
}
