//
//  GoF.swift
//  chat-base
//
//  Created by Азамат Баев on 03.08.2024.
//

import SwiftUI

class Singletone {
    static let shared = Singletone()
    
    private init() {}
    
    func fetchData() -> String {
        return "Данные загружены"
    }
}


class Observer: ObservableObject {
    @Published var data: String = ""
    
    func updateData() {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "Europe/Moscow")
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        data = "Сейчас в Москве: \(dateFormatter.string(from: Date()))"
    }
}

struct DependencyInjection: View {
    @ObservedObject var dataPublisher: Observer
    
    var body: some View {
        VStack {
            Text(dataPublisher.data)
                .padding()
                .foregroundStyle(.purple)
            Button("Обновить данные") {
                dataPublisher.updateData()
            }.foregroundStyle(.purple)
        }
    }
}



struct DependencyInjection_Previews: PreviewProvider {
    static var previews: some View {
        let observer = Observer()
        observer.updateData()
        let singletoneData = Singletone.shared.fetchData()
        observer.data = singletoneData
        return DependencyInjection(dataPublisher: observer)
    }
}
