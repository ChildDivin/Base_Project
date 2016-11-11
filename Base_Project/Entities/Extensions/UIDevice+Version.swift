//
//  UIDevice+iOSVersion.swift
//  OokbeeComics
//
//  Created by Wasupol on 10/7/2558 BE.
//  Copyright © 2558 Wasupol Tungsakultong. All rights reserved.
//

import UIKit

extension UIDevice {
    private class var osVersion: String {
        return UIDevice.currentDevice().systemVersion
    }
    
    class func systemVersionEqualTo(version: String) -> Bool {
        return osVersion.compare(version, options: NSStringCompareOptions.NumericSearch) == NSComparisonResult.OrderedSame
    }
    
    class func systemVersionGreaterThan(version: String) -> Bool {
        return osVersion.compare(version, options: NSStringCompareOptions.NumericSearch) == NSComparisonResult.OrderedDescending
    }
    
    class func systemVersionGreaterThanOrEqualTo(version: String) -> Bool {
        return osVersion.compare(version, options: NSStringCompareOptions.NumericSearch) != NSComparisonResult.OrderedAscending
    }
    
    class func systemVersionLessThan(version: String) -> Bool {
        return osVersion.compare(version, options: NSStringCompareOptions.NumericSearch) == NSComparisonResult.OrderedAscending
    }
    
    class func systemVersionLessThanOrEqualTo(version: String) -> Bool {
        return osVersion.compare(version, options: NSStringCompareOptions.NumericSearch) != NSComparisonResult.OrderedDescending
    }
}
