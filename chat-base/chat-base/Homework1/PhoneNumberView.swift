//
//  PhoneNumberView.swift
//  chat-base
//
//  Created by Азамат Баев on 05.06.2024.
//

import SwiftUI

struct PhoneNumberView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Text("Новый экран")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image("Vector")
                                .renderingMode(.original)
                    }
                }
            }
        }
    }
}

#Preview {
    PhoneNumberView()
}
