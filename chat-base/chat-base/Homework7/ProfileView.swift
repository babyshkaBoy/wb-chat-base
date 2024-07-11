//
//  ProfileView.swift
//  Calendar
//
//  Created by Азамат Баев on 11.07.2024.
//

//1.Создать в правом верхнем углу кнопку "edit"
//2. По нажатию на нее дать возможность пользователю отредактировать профиль(username, notifications on/off, seasonal photos, date)
//3.Добавить кнопку Save для выхода из режима редактирования и сохранения введенных данных

import SwiftUI

struct ProfileView: View {
    @State var profile: Profile
    @State var username: String
    @State var notificationEnable: Bool
    @State var seasonalPhoto: Profile.Season
    @State var goalDate: Date
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    Text(seasonalPhoto.rawValue)
                        .font(.system(size: 100))
                        .navigationTitle("Профиль")
                    Divider()
                    Text(notificationEnable ? "Уведомления включены" : "Уведомления выключены")
                    Divider()
                    Text(profile.username)
                    Divider()
                    Text("Сегодня: \(goalDate, style: .date)")
                }.toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            DetailProfileView(profile: $profile, username: $username, notificationEnable: $notificationEnable, seasonalPhoto: $seasonalPhoto, goalDate: $goalDate)
                        } label: {
                            Image(systemName: "highlighter")
                                .foregroundStyle(.black)
                        }
                        
                    }
                }
            }
        }
    }
}

struct Profile {
    var username: String
    var notificationEnable = true
    var seasonalPhoto = Season.autumn
    var goalDate = Date()
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}
extension Profile {
    static let `default` = Profile(username: "Kanye West")
}

#Preview {
    struct BindingViewExamplePreviewContainer : View {
           @State private var value = false

           var body: some View {
               ProfileView(profile: .default, username: "f", notificationEnable: true, seasonalPhoto: .autumn, goalDate: .now)
           }
        }
        return BindingViewExamplePreviewContainer()
}
