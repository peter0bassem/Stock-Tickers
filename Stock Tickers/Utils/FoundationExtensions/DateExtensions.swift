//
//  DateExtensions.swift
//  Driver
//
//  Created by Peter Bassem on 27/12/2020.
//  Copyright © 2020 Eslam Maged. All rights reserved.
//

import Foundation

extension Date {
    static func getIntervalWithSettingSeconds(interval: Int64) -> Int64 {
        var date = Date(milliseconds: interval)
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        date = Calendar.current.date(bySettingHour: components.hour ?? 0, minute: components.minute ?? 0, second: 0, of: date) ?? Date()
        return date.millisecondsSince1970
    }

    static func switchFormateOf(date: String?, fromFormate: String = DateFormates.dateTimeFormate.rawValue, toFormate: String) -> String {
        guard let date = date else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.pmSymbol = "pmLong".localized()
        dateFormatter.amSymbol = "amLong".localized()
        dateFormatter.dateFormat = fromFormate
        guard let convertedDate = dateFormatter.date(from: date) else { return "" }
        dateFormatter.dateFormat = toFormate

        let timeStamp = dateFormatter.string(from: convertedDate)
        return timeStamp
    }

    static func switchEnglishFormateOf(date: String?, fromFormate: String = DateFormates.dateTimeFormate.rawValue, toFormate: String) -> String {
        guard let date = date else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "EN")
        dateFormatter.pmSymbol = "pmLong".localized()
        dateFormatter.amSymbol = "amLong".localized()
        dateFormatter.dateFormat = fromFormate
        guard let convertedDate = dateFormatter.date(from: date) else { return "" }
        dateFormatter.dateFormat = toFormate

        let timeStamp = dateFormatter.string(from: convertedDate)
        return timeStamp
    }

    init?(from date: String?, fromFormate: String = DateFormates.dateTimeFormate.rawValue) {
        guard let date = date else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormate
        if let date = dateFormatter.date(from: date) {
            self = date
        } else {
            return nil
        }
    }

    func getDateString(formate: String, isUTC: Bool = false, isGMT: Bool = false) -> String {
        let formatter = DateFormatter()
        if isUTC {
            dateFormatter.timeZone = TimeZone(identifier: "UTC")
        }
        if isGMT {
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        }
        formatter.dateFormat = formate
        let dateString = formatter.string(from: self)
        return dateString
    }

    func isAm() -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "a"
        let dateString = formatter.string(from: self)
        return dateString.contains("amShort".localized())
    }

    func getDurationTill(date: Date?) -> String {
        guard let dateString = date else {
            return ""
        }
        var durationString = ""
        let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: self, to: dateString)
        if let years = components.year, years > 0 {
            durationString += "\(years) \("years".localized()) "
        }
        if let months = components.month, months > 0 {
            durationString += "\(months) \("months".localized()) "
        }
        if let days = components.day, days > 0 {
            durationString += "\(days) \("days".localized()) "
        }
        if let hours = components.hour, hours > 0 {
            durationString += "\(hours) \("hours".localized()) "
        }
        if let minutes = components.minute, minutes > 0 {
            durationString += "\(minutes) \("minutes".localized())"
        }
        return durationString
    }

    func getTime() -> String {
        let components = Calendar.current.dateComponents([.day], from: self, to: self)
        if let days = components.day, days > 0 {
            return self.getDateString(formate: DateFormates.dayMonthYear.rawValue)
        }
        return self.getDateString(formate: DateFormates.time.rawValue)
    }

    var millisecondsSince1970: Int64 {
        return Int64((timeIntervalSince1970 * 1000.0).rounded())
    }

    init(milliseconds: Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }

    func age(dateString: String?) -> String? {
        guard let dateString = dateString else {
            return nil
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormates.dateOfBirth.rawValue
        if let birthday = dateFormatter.date(from: dateString) {
            let components = Calendar.current.dateComponents([.year], from: birthday, to: self)
            if let age = components.year {
                return "\(age)"
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    func yearsBetweenDate(endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: self, to: endDate)
        return components.year!
    }

    init?(dateString: String?, formate: String = DateFormates.dateOfBirth.rawValue) {
        guard let date = dateString else {
            return nil
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate
        if let date = dateFormatter.date(from: date) {
            self = date
        } else {
            return nil
        }
    }
    
    func getCurrentMillis() -> Int64 {
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
    
    func formatDate(inputFormat: String, outputFormat: String, isUTC: Bool = false) -> Date? {
        let dateFormatter = DateFormatter()
        if isUTC {
            dateFormatter.timeZone = TimeZone(identifier: "UTC")
        }
        dateFormatter.dateFormat = inputFormat
        let dateString = dateFormatter.string(from: self)
        dateFormatter.dateFormat = outputFormat
        return dateFormatter.date(from: dateString)
    }
}

extension Date {
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}

extension Date {
    var minute: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm"
        return dateFormatter.string(from: self)
    }
    
    var hour: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H"
        return dateFormatter.string(from: self)
    }
    
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: self)
    }
    
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M"
        return dateFormatter.string(from: self)
    }
    
    var monthName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    var monthShortName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self)
    }

    var year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: self)
    }
    
    var dayName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
    
    var dayShortName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: self)
    }
    
    var time: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: self)
    }
    
    func getDaysInMonth() -> Int {
        let calendar = Calendar.current
        
        let dateComponents = DateComponents(year: calendar.component(.year, from: self), month: calendar.component(.month, from: self))
        let date = calendar.date(from: dateComponents)!
        
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        
        return numDays
    }
}

extension Date {
    static func dates(from fromDate: Date, to toDate: Date) -> [Date] {
        var dates: [Date] = []
        var date = fromDate
        
        while date <= toDate {
            dates.append(date)
            guard let newDate = Calendar.current.date(byAdding: .day, value: 1, to: date) else { break }
            date = newDate
        }
        return dates
    }
}

extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
    
    func weekNumberOfMonth() -> Int? {
        return Calendar.current.dateComponents([.weekOfMonth], from: self).weekday
    }
    
    func dayOfWeek() -> String? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            return dateFormatter.string(from: self).capitalized
            // or use capitalized(with: locale) if you want
        }
}

let dateFormatter = DateFormatter()
enum DateFormates: String {
    case parkingDateFormate = "dd.MM.yyyy / hh:mm a"
    case fullTime = "MMM dd yyyy, hh:mm a"
    case shortDayNameFullDate = "MMM, dd yyyy";
    case dateSlashTime = "dd.MM.yyyy / hh:mm"
    case dateTimeFormate = "yyyy-MM-dd'T'HH:mm:ss"
    case pickerDateTimeFormat = "yyyy-MM-dd HH:mm:ss"
    case monthYear = "MMM yyyy"
    case dayMonthYear = "dd MMM yyyy"
    case time = "hh:mm a"
    case day = "dd"
    case month = "MM"
    case year = "YYYY"
    case monthString = "MMM"
    case dateOfBirth = "yyyy/MM/dd"
    case monthSlashYear = "MM/yyyy"
    case daySlashMonthSlashYear = "dd/MM/yyyy"
    case daySlashMonthSlashShortYear = "dd/MM/yy"
    case dayDashMonthDashYear = "dd-MM-yyyy"
    case yearMonthDateShortFormat = "yyMMdd"
    case yearDashMonthDashDay = "yyyy-MM-dd"
    case longDate = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    case tweleveHourTime = "hh:mm:ss"
    case twentyFourHourTime = "HH:mm:ss"
    case dateTimeWithSeconds = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    case defaultDate = "yyyy-MM-dd HH:mm:ss Z"
    case fullMonthNameAndDay = "MMMM d"
}
