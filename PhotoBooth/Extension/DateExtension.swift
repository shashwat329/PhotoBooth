//
//  DateExtension.swift
//  PhotoBooth
//
//  Created by shashwat singh on 28/10/25.
//

import Foundation

extension String {
    func toReadableDate(inputFormat: String = "yyyy-MM-dd'T'HH:mm:ssZ",
                        outputFormat: String = "MMM d, yyyy h:mm a") -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        inputFormatter.dateFormat = inputFormat
        
        guard let date = inputFormatter.date(from: self) else { return self }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = outputFormat
        return outputFormatter.string(from: date)
    }
}
