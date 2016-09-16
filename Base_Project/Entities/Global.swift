//  Global.swift
//  SwiftDemo
//
//  Created by TopsTech on 02/03/2015.
//  Copyright (c) 2015 tops. All rights reserved.


struct Global {
    
    //TODO: API BASE URL
    //static let g_APIBaseURL = "http://192.168.0.19/booking_system/trunk/ws/"
    static let g_APIBaseURL = "http://topsdemo.co.in/qa/booking_system/ws/"
    
    //TODO: GOOGLE MAPS API KYES  -"HERE PUT SOME STATIC 3RD PARTY KEYS"
    static let g_GoogleApiKey = "AIzaSyBpMTpURbOvDeoNRnqTThXCeuCaXKMUP04"
    
    
    //MARK: COMMON OBJECTS
    static let appdel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    static var navProfile:UINavigationController = UINavigationController()
    static var serverDate:NSDate!
    static var receipt1:NSData!
    static var arrMinutes:NSMutableArray = NSMutableArray() //["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"]
    static var arrMinutesForAll:NSMutableArray = NSMutableArray()
    
    
    //MARK: CUSTOM FONT NAMES "LIKE THIS"
    struct customFontName {
        static let FUTURA_BOOK_BT = "FuturaBT-Book"
        static let FUTURA_MEDIUM_BT = "FuturaBT-Medium"
        static let FUTURA_MEDIUM = "Futura-Medium"
        static let FUTURA_MEDIUM_Condensed = "Futura-CondensedMedium"
        static let FUTURA_MEDIUM_ITALIC = "Futura-MediumItalic"
        static let FUTURA_LIGHT_BT = "FuturaBT-Light"
        static let FUTURA_CONDENSEDEXTRA_BOLD = "Futura-CondensedExtraBold"        
    }
    
    //MARK: UNIQUE KEYS FOR USER DEFAULTS
    struct g_UserData {
        static let USERID                       = "id"
        static let FB_USERID                    = "FBid"
        static let LD_USERID                    = "LDid"
        static let IN_USERID                    = "INid"
        static let USERPASSWORD                 = "password"
        static let USEREMAIL                    = "EmailAddress"
        static let USERFIRSTNAME                = "FirstName"
        static let USERLASTNAME                 = "Surname"
        static let USERNAME                     = "Username"
        static let USERWEBSITEURL               = "WebsiteUrl"
        static let USER_DOB                     = "DOB"
        static let USER_IS_PROFILE_COMPETE      = "is_profile_complete"
        static let USER_MODE_OF_TRANSPOTATION   = "user_mode_of_transport"
        static let USERPROFILEIMAGEURL          = "ProfileImageUrl"
        static let USER_READYFORBOOKING         = "userReadyforBooking"
        static let USERPOSTCODE                 = "Postcode"
    }
    
    //MARK: COMMON KEYS FOR
    struct g_UserDefaultKey {
        static let latitude                     = "latitude"
        static let longitude                    = "longitude"
        static let DeviceToken                  = "DeviceToken"
        static let address                      = "address"
        static let IS_USERLOGIN                 = "USER_LOGIN"
        static let IS_Therapist                 = "USER_THERAPIST"
        static let city                         = "City"
    }
    
    //MARK: DOCUMENT DIRECTORY PATHS
    struct directoryPath {
        static let Documents = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        static let Tmp = NSTemporaryDirectory()
    }
    
    //MARK: DEVICE IDENTIFICATON CODE
    struct is_Device {
        static let _iPhone = (UIDevice.currentDevice().model as NSString).isEqualToString("iPhone") ? true : false
        static let _iPad = (UIDevice.currentDevice().model as NSString).isEqualToString("iPad") ? true : false
        static let _iPod = (UIDevice.currentDevice().model as NSString).isEqualToString("iPod touch") ? true : false
    }
    //MARK: IOS IDENTIFICATION CODE
    struct is_Ios {
        static let _10 = ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 10.0) ? true : false
        static let _9 = ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 9.0) ? true : false
        static let _8 = ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0 && (UIDevice.currentDevice().systemVersion as NSString).floatValue < 9.0) ? true : false
        static let _7 = ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 7.0 && (UIDevice.currentDevice().systemVersion as NSString).floatValue < 8.0) ? true : false
        static let _6 = ((UIDevice.currentDevice().systemVersion as NSString).floatValue <= 6.0 ) ? true : false
    }
    
    //MARK: IPHONE MODEL IDENTIFICATION CODE
    struct is_Iphone {
        static let _6p = (UIScreen.mainScreen().bounds.size.height >= 736.0 ) ? true : false
        static let _6 = (UIScreen.mainScreen().bounds.size.height <= 667.0 && UIScreen.mainScreen().bounds.size.height > 568.0) ? true : false
        static let _5 = (UIScreen.mainScreen().bounds.size.height <= 568.0 && UIScreen.mainScreen().bounds.size.height > 480.0) ? true : false
        static let _4 = (UIScreen.mainScreen().bounds.size.height <= 480.0) ? true : false
    }
    
    //MARK: SOME INAPP PURCHSAE IDS
    struct inApp {
        static let inapp2  = "com.lystiosapp.swipes7"
        static let inapp3  = "com.lystiosapp.waitlist7"
        static let inapp4  = "com.lystiosapp.messageReminder7"
        static let inapp5  = "com.lystiosapp.SearchLocation7"
        static let inapp6  = "com.lystiosapp.Alltheabove7"
    }
    
    //MARK: LOCAL PATH STRING
    struct local {
        static let LocalDocument = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
    }
    
}

