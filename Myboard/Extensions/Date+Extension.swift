//
//  Date+Extension.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import Foundation

extension String {

    func dateFormat() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .autoupdatingCurrent
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = dateFormatter.date(from: self) {
            let format = DateFormatter()
            format.dateFormat = "MM/dd"
            return format.string(from: date)
        }
        return ""
    }
}

extension Date {
    func toString(dateValue: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy/MM/dd a hh:mm"
        return dateFormatter.string(from: dateValue)
    }
}
