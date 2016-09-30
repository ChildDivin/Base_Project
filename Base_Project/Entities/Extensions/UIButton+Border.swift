//
//  UIButton+Border.swift
//  Booking_system
//
//  Created by Tops on 5/21/16.
//  Copyright © 2016 Tops. All rights reserved.
//

import UIKit

extension UIButton {
    
    func SetCustomBoarder(){
        self.layer.cornerRadius = 1.0
        self.layer.borderColor = StaticClass().colorWithHexString("E8E8E8", alpha: 1.0).CGColor
        self.layer.borderWidth = 1.0
    }
    
    func SetCustomBoarderWithHexColor(str:String){
        self.layer.cornerRadius = 1.0
        self.layer.borderColor = StaticClass().colorWithHexString(str, alpha: 1.0).CGColor
        self.layer.borderWidth = 1.0
    }
    
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(double: M_PI * 2)
        rotation.duration = 1
        rotation.cumulative = true
        rotation.repeatCount = FLT_MAX
        self.layer.addAnimation(rotation, forKey: "rotationAnimation")
    }
    
}
