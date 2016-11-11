//
//  UIDevice+Model.swift
//  OokbeeComics
//
//  Created by Wasupol on 9/24/2558 BE.
//  Copyright © 2558 Wasupol Tungsakultong. All rights reserved.
//

import UIKit

extension UIDevice {
    enum Model {
        case iPhone4
        case iPhone5 // iPhone 5,5s and SE
        case iPhone6
        case iPhone6Plus
        case iPad
        case iPadPro
        case Unknown // iPhone 7 or later etc.
    }
    
    class func model() -> Model {
        struct Static {
            static var onceToken:dispatch_once_t = 0
            static var model: Model = .Unknown
        }
        dispatch_once(&Static.onceToken) {
            let width = UIDevice.screenWidth()
            let height = UIDevice.screenHeight()
            switch (width, height) {
                case (320, 480):
                    Static.model = .iPhone4
                    break
                case (320, 568):
                    Static.model = .iPhone5
                    break
                case (375, 667):
                    Static.model = .iPhone6
                    break
                case (414, 736):
                    Static.model = .iPhone6Plus
                    break
                case (768, 1024):
                    Static.model = .iPad
                    break
                case (1024, 1366):
                    Static.model = .iPadPro
                    break
            	default:
                    Static.model = .Unknown
                    break
            }
        }
        return Static.model
    }
    
    // Portrait Size
    class func screenSize() -> CGSize {
        struct Static {
            static var onceToken:dispatch_once_t = 0
            static var size: CGSize = CGSizeZero
        }
        dispatch_once(&Static.onceToken) {
            let sz = UIScreen.mainScreen().bounds.size
            let width = min(sz.width, sz.height)
            let height = max(sz.width, sz.height)
            Static.size = CGSizeMake(width, height)
        }
        return Static.size
    }
    
    class func currentScreenSize() -> CGSize {
        let interfaceOrientation = UIApplication.sharedApplication().statusBarOrientation
        if UIInterfaceOrientationIsPortrait(interfaceOrientation) {
            return CGSizeMake(screenWidth(), screenHeight())
        } else {
            return CGSizeMake(screenHeight(), screenWidth())
        }
    }
    
    class func screenWidth() -> CGFloat {
        return UIDevice.screenSize().width
    }
    
    class func screenHeight() -> CGFloat {
        return UIDevice.screenSize().height
    }
    
    class func isPad() -> Bool {
        return UIDevice.currentDevice().userInterfaceIdiom == .Pad
    }
    
    class func isPadPro() -> Bool {
        return model() == .iPadPro
    }
    
    class func isPhone() -> Bool {
        return !UIDevice.isPad()
    }
    
    class func isPhone4() -> Bool {
        return model() == .iPhone4
    }
    
    class func isPhone5() -> Bool {
        return model() == .iPhone5
    }
    
    class func isPhone6() -> Bool {
        return model() == .iPhone6
    }
    
    class func isPhone6Plus() -> Bool {
        return model() == .iPhone6Plus
    }
    
    class func isLandscape() -> Bool {
        return UIApplication.sharedApplication().statusBarOrientation.isLandscape
    }
}