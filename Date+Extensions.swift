//
//  Date+Extensions.swift
//  My App
//
//  Created by Kailey Liou on 10/29/25.
//

import Foundation

extension Date {
    func isTodayOrLater() -> Bool {
        let calendar = Calendar.current
        return calendar.startOfDay(for: self) >= calendar.startOfDay(for: Date())
    }
}
