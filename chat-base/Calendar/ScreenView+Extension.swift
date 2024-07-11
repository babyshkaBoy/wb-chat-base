//
//  ScreenView+Extension.swift
//  HomeworkStringInterpolation
//
//  Created by Азамат Баев on 30.06.2024.
//
import SwiftUI
extension ScreenView {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }
    
    func updateDateStrings() {
        let calendar = Calendar.current
        let dates = [
            calendar.date(byAdding: .day, value: -2, to: selectedDate)!,
            calendar.date(byAdding: .day, value: -1, to: selectedDate)!,
            selectedDate,
            calendar.date(byAdding: .day, value: 1, to: selectedDate)!,
            calendar.date(byAdding: .day, value: 2, to: selectedDate)!
        ]
        for (index, language) in languages.enumerated() {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: language)
            formatter.dateStyle = .full
            formatter.timeStyle = .none
            dateStrings[index] = dates.map { formatter.string(from: $0) }.joined(separator: ", ")
            var array = dateStrings[0].components(separatedBy: ",")
            let dict = getDescriptions(selectedFlag)
            
            array[0] = dict["dayBeforeYesterday", default: ""] //"Позавчера"
            array[2] = dict["yesterday", default: ""] //"Вчера"
            array[4] = dict["today", default: ""]//"Сегодня"
            array[6] = dict["tomorrow", default: ""]//"Завтра"
            array[8] = dict["dayAfterTomorrow", default: ""]//"Послезавтра"
            
            dateStrings[index] = array.joined(separator: ",")
            dateStrings[index] = dateStrings[index].replacingOccurrences(of: ".,", with: ".,\n")
            dateSubStrings = dateStrings[index].components(separatedBy: ".,")
        }
    }
}
extension ScreenView {
    func getDescriptions(_ selectedFlag: Int) -> [String: String] {
        
        guard let language = Flags(rawValue: selectedFlag) else { return [:] }
        
        switch language {
        case .rus:
            return ["dayBeforeYesterday": "позавчера",
                    "yesterday": "вчера",
                    "today": "сегодня",
                    "tomorrow": "завтра",
                    "dayAfterTomorrow": "послезавтра"]
        case .eng:
            return ["dayBeforeYesterday": "day before yesterday",
                    "yesterday": "yesterday",
                    "today": "today",
                    "tomorrow": "tomorrow",
                    "dayAfterTomorrow": "day after tomorrow"]
        case .fre:
            return ["dayBeforeYesterday": "avant-hier",
                    "yesterday": "hier",
                    "today": "aujourd'hui",
                    "tomorrow": "demain",
                    "dayAfterTomorrow": "après-demain"]
        case .ger:
            return ["dayBeforeYesterday": "vorgestern",
                    "yesterday": "gestern",
                    "today": "heute",
                    "tomorrow": "morgen",
                    "dayAfterTomorrow": "übermorgen"]
        case .jap:
            return ["dayBeforeYesterday": "一昨日",
                    "yesterday": "昨日",
                    "today": "今日",
                    "tomorrow": "明日",
                    "dayAfterTomorrow": "明後日"]
        }
    }
}

enum Flags: Int, CaseIterable, Identifiable {
    case rus = 0
    case eng = 1
    case fre = 2
    case ger = 3
    case jap = 4
    var id: Flags { self }
}


