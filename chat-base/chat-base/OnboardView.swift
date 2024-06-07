//
//  OnboardView.swift
//  chat-base
//
//  Created by Азамат Баев on 05.06.2024.
//

import SwiftUI

struct OnboardView: View {
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Image("lightTheme")
                .imageScale(.large)
            Text("Общайтесь с друзьями и близкими легко")
                .font(.system(size: 24))
                .foregroundStyle(Color("neutralActive"))
                .multilineTextAlignment(.center)
                .bold()
            Spacer()
            Spacer()
                StartCommunicatingButton()
        }
        .padding(.init(top: 24, leading: 24, bottom: 24, trailing: 24))
    }
}


#Preview {
    OnboardView()
}
