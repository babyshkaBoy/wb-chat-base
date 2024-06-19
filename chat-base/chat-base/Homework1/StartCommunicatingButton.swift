//
//  StartCommunicatingButton.swift
//  chat-base
//
//  Created by Азамат Баев on 05.06.2024.
//

import SwiftUI

struct StartCommunicatingButton: View {
    
    @State private var showVerification = false
    
    var body: some View {
        Button {
            //action
        } label: {
            Text("Пользовательское соглашение")
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(Color("neutralActive"))
        }
        
        Button {
            showVerification.toggle()
        } label: {
            Text("Начать общаться")
                .frame(width: 327, height: 52)
                .background(Color("brandColor"))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .font(.system(size: 16))
                .bold()
        }.sheet(isPresented: $showVerification) {
            PhoneNumberView()
        }
    }
}
#Preview {
    StartCommunicatingButton()
}
