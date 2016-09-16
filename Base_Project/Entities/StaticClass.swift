//
//  StaticClass.swift
//  SwiftDemo
//
//  Created by TopsTech on 02/03/2015.
//  Copyright (c) 2015 tops. All rights reserved.
//

import UIKit
import AJNotificationView

class StaticClass {
    //MARK: STATIC VARIABLES
    var navProfileVC : UINavigationController!
    var strCTreatmentName : String = ""
    
    //MARK: SHAREDINSTANCE METHODS
    class var sharedInstance: StaticClass {
        struct Static {
            static var instance: StaticClass?
            static var navProfileVC: UINavigationController?
            static var token: dispatch_once_t = 0
        }
        dispatch_once(&Static.token) {
            Static.instance = StaticClass()
        }
        return Static.instance!
    }
    
    // MARK: - NSUSER DEFAULTS METHODS
    func saveToUserDefaults (value: AnyObject?, forKey key: NSString) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(value, forKey: key as String)
        defaults.synchronize()
    }
    func retriveFromUserDefaults (key: NSString) -> AnyObject? {
        let defaults = NSUserDefaults.standardUserDefaults()
        if(defaults.valueForKey(key as String) != nil){
            print(defaults.valueForKey(key as String))
        }else{
            return ""
        }
        return defaults.valueForKey(key as String)
    }
    
    // MARK: VALIDATION METHODS
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailText = NSPredicate(format:"SELF MATCHES [c]%@",emailRegex)
        return (emailText.evaluateWithObject(email))
    }
    
    //MARK: OTHER MARKDOWN METHODS
    func setNavigationFromProfile(sender:UINavigationController) {
        navProfileVC = sender
    }
    
    func notification(color:String,message:String){
        
        var type:AJNotificationType = AJNotificationTypeGreen
        if(color == "Red"){
            type = AJNotificationTypeRed
        }else if(color == "Green"){
            type = AJNotificationTypeGreen
        }
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        AJNotificationView.hideCurrentNotificationViewAndClearQueue()
        AJNotificationView.showNoticeInView(appDelegate.window, type: type, title: message, linedBackground: AJLinedBackgroundTypeStatic, hideAfter: 3, offset: 00, delay: 0.5) { () -> Void in
        }
    }
    
    func isBookingType(str: String) -> String {
        //booking_type 1 - Hotel 2 - Spa 3- Home 4- Office 5 - Private Event 6 - Wedding
        if str == "6" {
            return "Wedding"
        } else if str == "1" {
            return "Hotel"
        }
        else if str == "2" {
            return "Spa"
        }else if str == "3" {
            return "Home"
        }else if str == "4" {
            return "Office"
        }else if str == "5" {
            return "Private Event"
        }
        return ""
    }
    
  
    
    /*func removeTimeFromDate (date: NSDate) -> NSDate {
    let calendarObj: NSCalendar = NSCalendar.autoupdatingCurrentCalendar()
    
    let dateComponentsObj = calendarObj.components([.NSDayCalendarUnit, .NSMonthCalendarUnit, .NSYearCalendarUnit] , fromDate: date)
    dateComponentsObj.hour = 00
    dateComponentsObj.minute = 00
    dateComponentsObj.second = 00
    
    return calendarObj.dateFromComponents(dateComponentsObj)! as NSDate
    }
    
    func getMonthFromDate (date: NSDate) -> Int {
    let components = NSCalendar.currentCalendar().components([.Hour, .Minute, .Month, .Year, .Day], fromDate: date)
    return components.month as Int
    }
    
    func getYearFromDate (date: NSDate) -> NSInteger {
    let components = NSCalendar.currentCalendar().components([.Hour, .Minute, .Month, .Year, .Day], fromDate: date)
    return components.year as NSInteger
    }
    */
    
    // MARK: - General Methods
    func isconnectedToNetwork() -> Bool {
        /* let reachability = Reachability.reachabilityForInternetConnection()
        
        if !reachability.isReachable() {
        AlertView().showAlertWithOKButton(self.setLocalizeText("keyInternetConnectionError"), withType: AJNotificationTypeRed)
        }
        
        return reachability.isReachable()*/
        return true
    }
    
    //MARK: COLOR METHODS
    func getUIColorFromRBG (R rVal: CGFloat, G gVal: CGFloat, B bVal: CGFloat) -> UIColor {
        return UIColor(red: rVal/255.0, green: gVal/255.0, blue: bVal/255.0, alpha: 1.0)
    }
    
    func getUIColorFromRBGAlpha (R rVal: CGFloat, G gVal: CGFloat, B bVal: CGFloat, Alpha alpha: CGFloat) -> UIColor {
        return UIColor(red: rVal/255.0, green: gVal/255.0, blue: bVal/255.0, alpha: alpha)
    }
    
    func colorWithHexString (hex:String,alpha:CGFloat) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substringFromIndex(1)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.grayColor()
        }
        
        let rString = (cString as NSString).substringToIndex(2)
        let gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        let bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }

    //MARK: STRING METHODS
    func getSizeFromString (str: NSString, stringWidth width: CGFloat, fontname font: UIFont, minimumHeight minHeight: CGFloat) -> CGSize {
        
        let height: CGFloat = 100000
        let labelBounds: CGRect = str.boundingRectWithSize(CGSizeMake(width, height), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context: nil) as CGRect
        
        if(labelBounds.size.height < minHeight) {
            return CGSizeMake(CGFloat(ceilf(Float(labelBounds.size.width))), minHeight)
        }
        
        return CGSizeMake(CGFloat(ceilf(Float(labelBounds.size.width))), CGFloat(ceilf(Float(labelBounds.size.height))))
    }
    func removeNull (str:String) -> String {
        if (str == "<null>" || str == "(null)" || str == "N/A" || str == "n/a" || str.isEmpty) {
            return ""
        } else {
            return str
        }
    }
    func setPrefixHttp (str:NSString) -> NSString {
        if (str == "" || str .hasPrefix("http://") || str .hasPrefix("https://")) {
            return str
        } else {
            return "http://".stringByAppendingString(str as String)
        }
    }
    
    //MARK: NIB METHODS
    func loadFromNibNamed(nibNamed: String) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: NSBundle.mainBundle()
            ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
    
    //MARK: IMAGE LOAD METHDOS
    func loadImageFromPath(path: String) -> UIImage? {
        let image = UIImage(contentsOfFile: "\(Global.local.LocalDocument)/MyFolder/\(path)")
        if image == nil {
            print("missing image at: \(path)")
        }
        print("Loading image from path: \(path)") // this is just for you to see the path in case you want to go to the directory, using Finder.
        return image
    }
    
    //MARK : DATE FORMATER METHDOS
    func dateFormatter() -> NSDateFormatter {
        var dateFormatter: NSDateFormatter
        dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter
    }
    
    func dateFormatterForDisplay() -> NSDateFormatter {
        var dateFormatter: NSDateFormatter
        dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        return dateFormatter
    }
    func dateFormatterForCall() -> NSDateFormatter {
        var dateFormatter: NSDateFormatter
        dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }
    func dateFormatterForYearOnly() -> NSDateFormatter {
        var dateFormatter: NSDateFormatter
        dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter
    }
    func dateFormatterForMonthINNumberOnly() -> NSDateFormatter {
        var dateFormatter: NSDateFormatter
        dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM"
        return dateFormatter
    }
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    //MARK: STRING OPERATIONS 
    /**
    See sample usage:
    ### let str = "41111111111111111"
    
    let x = yourClassname.setStringAsCardNumberWithSartNumber(4, withString: str!, withStrLenght: 8)
    
    ### output:- 4111XXXXXXXX1111
    
    let x = yourClassname.setStringAsCardNumberWithSartNumber(0, withString: str!, withStrLenght: 12)
    
    ### output: - XXXXXXXXXXXX1111
    
    */
    func setStringAsCardNumberWithSartNumber(Number:Int,withString str:String ,withStrLenght len:Int ) -> String{
        let arr = str.characters
        var CrediteCard : String = ""
        if arr.count > (Number + len) {
            for (index, element ) in arr.enumerate(){
                if index >= Number && index < (Number + len) {
                    CrediteCard = CrediteCard + String("X")
                }else{
                    CrediteCard = CrediteCard + String(element)
                }
            }
          return CrediteCard
        }else{
                print("\(Number) plus \(len) are grether than strings chatarter \(arr.count)")
        }
        print("\(CrediteCard)")
        return str
    }
}


