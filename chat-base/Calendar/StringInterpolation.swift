//
//  StringInterpolation.swift
//  HomeworkStringInterpolation
//
//  Created by Азамат Баев on 30.06.2024.
//

import Foundation
extension String.StringInterpolation {
    // Полный стиль
    mutating func appendInterpolation(full date: Date, _ locale: Locale) {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateStyle = .full
        appendLiteral(formatter.string(from: date))
    }
    // Короткий стиль
    mutating func appendInterpolation(short date: Date, _ locale: Locale) {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateStyle = .short
        appendLiteral(formatter.string(from: date))
    }
    // Cредний стиль
    mutating func appendInterpolation(medium date: Date, _ locale: Locale) {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateStyle = .medium
        appendLiteral(formatter.string(from: date))
    }
    // Длинный стиль
    mutating func appendInterpolation(long date: Date, _ locale: Locale) {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateStyle = .long
        appendLiteral(formatter.string(from: date))
    }
    // Стиль ISO8601
    mutating func appendInterpolation(iso8601 date: Date, _ locale: Locale) {
        let formatter = DateFormatter()
        formatter.locale = locale
        appendLiteral(formatter.string(from: date))
    }
}
