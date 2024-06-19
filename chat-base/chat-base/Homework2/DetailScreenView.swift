//
//  DetailView.swift
//  chat-contacts
//
//  Created by Азамат Баев on 15.06.2024.
//

import SwiftUI

struct DetailScreenView: View {
    @Environment (\.dismiss) private var dismiss
    let contacts: Contacts
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 0) {
                
                if let avatar = contacts.avatar {
                    Image(avatar)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                        .padding(.top, 86)
                    Text(contacts.name)
                        .font(.system(size: 24, weight: .semibold, design: .none))
                        .padding(.top, 20)
                    
                    Text(contacts.phoneNumber)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 6)
                } else {
                    RoundedRectangle(cornerRadius: 1)
                        
                        .fill(Color.purple)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .padding(.top, 86)

                        .overlay(
                            Text(initials(from: contacts.name) )
                                .font(.system(size: 44, weight: .semibold, design: .none))
                                .padding(.top, 90)
                                .foregroundColor(.white) )
                        .padding(.trailing, 12)
                    Text(contacts.name)
                        .font(.system(size: 24, weight: .semibold, design: .none))
                        .padding(.top, 20)
                    Text(contacts.phoneNumber)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 6)
                }
                
                HStack(spacing: 12) {
                    SocialButton(imageName: CustomIcons.linkedIn.name, url: "https://linkedin.com")
                    SocialButton(imageName: CustomIcons.facebook.name, url: "https://facebook.com")
                    SocialButton(imageName: CustomIcons.twitter.name, url: "https://twitter.com")
                    SocialButton(imageName: CustomIcons.instagram.name, url: "https://instagram.com")
                    
                }
                .padding(.top, 20)
                Spacer()
                    .navigationBarBackButtonHidden(true)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image("chevron")
                            .resizable()
                            .padding(.top, 3)
                            .padding(.bottom, 3)
                            .padding(.leading, 4)
                            .padding(.trailing, 4)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        Text("Профиль")
                            .bold()
                            .foregroundStyle(.black)
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "pencil")
                        .bold()
                        .foregroundStyle(.black)
                })
            }
        }
    }
}

struct SocialButton: View {
    var imageName: String
    var url: String
    
    var body: some View {
        Button(action: {
            // Действие при нажатии: открыть URL
        }) {
            Image(imageName)
                .resizable()
                .frame(width: 20, height: 20)
        }
        .buttonStyle(PlainButtonStyle())
        .frame(width: 72, height: 40)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.purple, lineWidth: 1.67)
        )
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreenView(contacts: Contacts.init(name: "Анастасия Иванова", phoneNumber: "798975357", status: "Last seen yesterday", isOnline: false, hasNewStories: false, avatar: "nastya"))
    }
}

