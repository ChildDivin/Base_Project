//
//  NSString+FirstCharacter.swift
//  Lyst
//
//  Created by Tops on 3/25/16.
//  Copyright © 2016 Tops. All rights reserved.
//

import UIKit

import Foundation
extension String {
    
    func firstcharacter(str:String)->String{
        if(str.characters.count >= 1){
            //"llo, playgroun"
            return str.substringWithRange(Range<String.Index>(start: str.startIndex.advancedBy(0), end: str.endIndex.advancedBy(1-str.characters.count))).capitalizedString
        }
        return str.capitalizedString
    }
    func toBool() -> Bool? {
        switch self {
        case "True", "true", "yes", "1":
            return true
        case "False", "false", "no", "0":
            return false
        default:
            return nil
        }
    }
    
    func convertTODate() -> NSDate{
        //dateString = "2014-07-15 14:52:53"
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.dateFromString(self)
        return date!
        
    }
    
    func convertTODateDDMMYYYY() -> NSDate{
        //dateString = "2014-07-15 14:52:53"
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let date = dateFormatter.dateFromString(self)
        return date!
    }
    
    func convertTODateUsingOnly() -> NSDate{
        //dateString = "2014-07-15"
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.dateFromString(self)
        return date!
        
    }
    
    func filter(pred: Character -> Bool) -> String {
        var res = String()
        for c in self.characters {
            if pred(c) {
                res.append(c)
            }
        }
        return res
    }
    func replace(string:String, replacement:String) -> String {
        return self.stringByReplacingOccurrencesOfString(string, withString: replacement, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    
    func removeWhitespace() -> String {
        return self.replace(" ", replacement: "")
    }
}
