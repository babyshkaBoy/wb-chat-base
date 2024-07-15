//
//  Homework9_VerificationView.swift
//  chat-base
//
//  Created by Азамат Баев on 15.07.2024.
//

import SwiftUI

struct Homework9_VerificationView: View {
    @State private var phoneNumber: String = ""
    @State private var selectedCountry: String = "+7"
    @State private var isLoading: Bool = false
    
    let countries = ["🇷🇺+7", "🇺🇸+1", "🇬🇧+44", "🇩🇪+49", "🇨🇳+86"]

    var body: some View {
        VStack {
            isLoading ? AnyView(
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(2)
                    Button(action: {
                        withAnimation {
                            isLoading = false
                        }
                    }) {
                        Text("Назад")
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.colorforbutton)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                    }
                    .padding()
                }
            ) : AnyView(
                VStack {
                    Text("Введите номер телефона")
                        .bold()
                        .foregroundStyle(.colorForText)
                        .font(.system(size: 24))
                        .padding()
                    Text("Мы вышлем код подтверждения на указанный номер")
                        .foregroundStyle(.colorForText)
                        .multilineTextAlignment(.center)
                    HStack(spacing: 2) {
                        Picker("Выберите страну", selection: $selectedCountry) {
                            ForEach(countries, id: \.self) { country in
                                Text(country)
                                    .foregroundStyle(.black)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .tint(.gray)
                        .background(.colorForTF)
                        TextField("000 000-00-00", text: $phoneNumber)
                            .keyboardType(.phonePad)
                            .padding(8)
                            .background(.colorForTF)
                            .cornerRadius(5)
                            .padding(8)
                    }
                    .padding()
                    Button(action: {
                        withAnimation {
                            isLoading = true
                        }
                    }) {
                        Text("Продолжить")
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.colorforbutton)
                            .opacity(0.5)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                    }
                    .padding()
                }
            )
        }
        .padding(.top, -169)
    }
}

#Preview {
    Homework9_VerificationView()
}




