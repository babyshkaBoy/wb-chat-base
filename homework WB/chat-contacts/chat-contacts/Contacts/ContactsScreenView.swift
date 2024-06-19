//
//  ContactsView.swift
//  chat-contacts
//
//  Created by Азамат Баев on 12.06.2024.
//

import SwiftUI
import NavigationTransitions

struct ContactsScreenView: View {
    @State private var searchText = ""
    @State private var contacts = Contacts.contacts
    var body: some View {
        NavigationStack {
            List {
                SearchBar(text: $searchText)
                    .listRowInsets(EdgeInsets())
                
                ForEach(contacts) { contact in
                    ZStack {
                        ContactCell(contact: contact)
                        NavigationLink(destination: DetailScreenView(contacts: contact)) {
                          EmptyView()
                        }
                        .frame(width: 0)
                        .opacity(0)
                    }
                    
                }
            }
            .navigationBarItems(leading: Text("Контакты"),
                                trailing: Button(action: {}) {
                Image("vector")
                    
            })
            .listStyle(.inset)

        }
        .navigationTransition(.fade(.cross))

    }
}

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
                    .frame(width: 48, height: 48)
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


struct ChatsView: View {
    var body: some View {
        Text("Чаты")
    }
}

struct MoreView: View {
    var body: some View {
        Text("Ещё")
    }
}

#Preview {
    ContactsScreenView()
}
