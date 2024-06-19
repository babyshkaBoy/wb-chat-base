//
//  MainView.swift
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
            TabView(selection: $selection, content: {
                ContactsScreenView()
                    .tabItem {
                        Label("", image: "users")
                    }
                    .tag(tabs[0])
                    
                ChatsView()
                    .tabItem {
                        Label("", image: "chats")
                    }
                    .tag(tabs[1])
                MoreView()
                    .tabItem {
                        Label("", image: "more")
                            
                            
                    }
                    .tag(tabs[2])
            })
        }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView_Tab()
    }
}

