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
                    }.frame(height: 72)
                    
                }
            }.environment(\.defaultMinListRowHeight, 50)
            .navigationBarItems(leading: Text("Контакты"),
                                trailing: Button(action: {}) {
                Image("vector")
                    
            })
            .listStyle(.inset)

        }
        .navigationTransition(.fade(.cross))

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
