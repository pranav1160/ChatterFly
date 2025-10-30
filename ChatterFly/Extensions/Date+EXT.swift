//
//  Date+EXT.swift
//  ChatterFly
//
//  Created by Pranav on 29/10/25.
//
import Foundation

extension Date {
    func addingTimeInterval(minutes: Double = 0) -> Date {
        return self.addingTimeInterval(minutes * 60)
    }
    
    func addingTimeInterval(hours: Double = 0) -> Date {
        return self.addingTimeInterval(hours * 60 * 60)
    }
    
    func addingTimeInterval(days: Double = 0) -> Date {
        return self.addingTimeInterval(days * 24 * 60 * 60)
    }
}
