//
//  ContactsView_Tab.swift
//  chat-contacts
//
//  Created by Азамат Баев on 12.06.2024.
//

import SwiftUI

struct ContactsView_Tab: View {
    let tabs = ["Контакты", "Чаты", "Ещё"]
    @State private var selection: String
    
    init() {
        _selection = State(initialValue: tabs[0])
    }
    
    var body: some View {
        TabView(selection: $selection) {
            ContactsScreenView()
                .tabItem {
                    Image(selection == tabs[0] ? "usersTap" : "users")
                }
                .tag(tabs[0])
            
            ChatsView()
                .tabItem {
                    Image(selection == tabs[1] ? "chatsTap" : "chats")
                }
                .tag(tabs[1])
            
            MoreView()
                .tabItem {
                    Image(selection == tabs[2] ? "moreTap" : "more")
                }
                .tag(tabs[2])
            
        }//.shadow(radius: 30)
        
        .listStyle(.inset)
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView_Tab()
    }
}

