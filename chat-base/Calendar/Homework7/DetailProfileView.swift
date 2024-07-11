//
//  DetailProfileView.swift
//  Calendar
//
//  Created by Азамат Баев on 11.07.2024.
//

import SwiftUI

struct DetailProfileView: View {
    @Binding var profile: Profile
    @Binding var username: String
    @Binding var notificationEnable: Bool
    @Binding var seasonalPhoto: Profile.Season
    @Binding var goalDate: Date
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                VStack(spacing: 10) {
                    Text(seasonalPhoto.rawValue)
                        .font(.system(size: 100))
                    Divider()
                    TextField("Ваше имя", text: $profile.username)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.leading)
                    Divider()
                    Picker("User Image", selection: $seasonalPhoto) {
                        ForEach(Profile.Season.allCases) { season in
                            Text(season.rawValue).tag(season)
                            
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    Divider()
                    Toggle("Уведомления", isOn: $notificationEnable)
                    Divider()
                    DatePicker("Сегодня:", selection: $goalDate, displayedComponents: .date)
                    Divider()
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Сохранить")
                    })
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct DetailProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProfile = Profile(username: "")
        let sampleSeasonalPhoto = Profile.Season.spring
        let sampleGoalDate = Date()
        
        DetailProfileView(profile: .constant(sampleProfile),
                          username: .constant(""),
                          notificationEnable: .constant(true),
                          seasonalPhoto: .constant(sampleSeasonalPhoto),
                          goalDate: .constant(sampleGoalDate))
    }
}


