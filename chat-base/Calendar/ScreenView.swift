//
//  ScreenView.swift
//  HomeworkStringInterpolation
//
//  Created by Азамат Баев on 30.06.2024.
//

//Задача. Сделать 5 appendInterpolation, с локалью для вывода форматированных дат.
//Добавить DatePicker, снизу Picker Segmented control c 5 эмоджами флагов, на 5 языках, показывать время дату через .spellOut, позавчера, вчера, сегодня(выделить), завтра, и послезавтра
//Результат: Экран сверху вниз: DatePicker, Picker, 5 строк

import SwiftUI

struct ScreenView: View {
    let flags = ["🇷🇺", "🇬🇧", "🇫🇷", "🇩🇪", "🇯🇵"]
    let languages = ["ru_RU", "en_GB", "fr_FR", "de_DE", "ja_JP"]
    @State var selectedDate: Date = Date()
    @State var selectedFlag = 0
    @State var dateStrings: [String] = Array(repeating: "", count: 5)
    @State var dateSubStrings: [String] = Array(repeating: "", count: 5)
    
    var body: some View {
        VStack {
            Text("Выбранная дата:")
            Text(dateFormatter.string(from: selectedDate))
                .font(.title3)
            DatePicker("Выберите дату", selection: $selectedDate)
                .padding()
                .datePickerStyle(.compact)
                .onChange(of: selectedDate) { newDate in
                    selectedDate = newDate
                    updateDateStrings()
                }
            Picker("Выберите флаг", selection: $selectedFlag) {
                ForEach(0..<flags.count, id: \.self) { index in
                    Text(flags[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .onChange(of: selectedFlag) { newFlag in
                selectedFlag = newFlag
                updateDateStrings()
            }
            Group {
                Text(dateSubStrings[0])
                    .font(.title3) +
                Text(dateSubStrings[1])
                    .font(.title3) +
                Text(dateSubStrings[2])
                    .font(.title3)
                    .underline() +
                Text(dateSubStrings[3])
                    .font(.title3) +
                Text(dateSubStrings[4])
                    .font(.title3)
            }.padding(.top, 20)
        }
        .padding()
        .onAppear(perform: updateDateStrings)
    }
}



#Preview {
    ScreenView()
}
