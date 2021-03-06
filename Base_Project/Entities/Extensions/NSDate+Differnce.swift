//
//  NSDate+Differnce.swift
//  Lyst
//
//  Created by Tops on 4/18/16.
//  Copyright © 2016 Tops. All rights reserved.
//

import Foundation

extension NSDate {
    func yearsFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Year, fromDate: date, toDate: self, options: []).year
    }
    func monthsFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Month, fromDate: date, toDate: self, options: []).month
    }
    func weeksFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.WeekOfYear, fromDate: date, toDate: self, options: []).weekOfYear
    }
    func daysFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Day, fromDate: date, toDate: self, options: []).day
    }
    func hoursFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Hour, fromDate: date, toDate: self, options: []).hour
    }
    func minutesFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Minute, fromDate: date, toDate: self, options: []).minute
    }
    func secondsFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(.Second, fromDate: date, toDate: self, options: []).second
    }
    func offsetFrom(date:NSDate) -> String {
        if yearsFrom(date)   > 0 { return "\(yearsFrom(date))y"   }
        if monthsFrom(date)  > 0 { return "\(monthsFrom(date))M"  }
        if weeksFrom(date)   > 0 { return "\(weeksFrom(date))w"   }
        if daysFrom(date)    > 0 { return "\(daysFrom(date))d"    }
        if hoursFrom(date)   > 0 { return "\(hoursFrom(date))h"   }
        if minutesFrom(date) > 0 { return "\(minutesFrom(date))m" }
        if secondsFrom(date) > 0 { return "\(secondsFrom(date))s" }
        return ""
    }
    
    func isOnThisMonth(dateToCompare: NSDate) -> Bool {
        let calendar: NSCalendar = NSCalendar.currentCalendar()
        let today: NSDate = NSDate()
        let todaysWeek: Int = calendar.components(NSCalendarUnit.Month, fromDate: today).month
        let dateToCompareWeek: Int = calendar.components(.Month, fromDate: dateToCompare).month
        let todaysYear: Int = calendar.components(NSCalendarUnit.Year, fromDate: today).year
        let dateToCompareYear: Int = calendar.components(NSCalendarUnit.Year, fromDate: dateToCompare).year
        if todaysWeek == dateToCompareWeek && todaysYear == dateToCompareYear {
            return true
        }
        return false
    }
    
    func isOnThisWeek(dateToCompare: NSDate) -> Bool {
        let calendar: NSCalendar = NSCalendar.currentCalendar()
        let today: NSDate = NSDate()
        let todaysWeek: Int = calendar.components(NSCalendarUnit.Weekday, fromDate: today).weekday
        let dateToCompareWeek: Int = calendar.components(.Weekday, fromDate: dateToCompare).weekday
        let todaysYear: Int = calendar.components(NSCalendarUnit.Year, fromDate: today).year
        let dateToCompareYear: Int = calendar.components(NSCalendarUnit.Year, fromDate: dateToCompare).year
        if todaysWeek == dateToCompareWeek && todaysYear == dateToCompareYear {
            return true
        }
        return false
    }
    
    func dateStringWithFormat(format: String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.stringFromDate(self)
    }
    
    func DateAddDays(days:Int) -> NSDate {
        let dayComponenet = NSDateComponents()
        dayComponenet.day = days
        let theCalendar = NSCalendar.currentCalendar()
        return theCalendar.dateByAddingComponents(dayComponenet, toDate: self, options: NSCalendarOptions(rawValue: UInt(0)))!
    }
}
