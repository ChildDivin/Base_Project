//
//  UIView+Shadow.swift
//  Booking_system
//
//  Created by Tops on 5/14/16.
//  Copyright © 2016 Tops. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
    @brief This is the view shadow method
    @param no need paramer (it contain default parameter ) 
     * cornerRadius = 0.0 
     * shadow radius =1.0 and 
     * shadowOpacity = 0.5
    `````
        myview.shadow()
    `````
    @remark This is super easy methods
    
    */
    func shadow(){
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 0.0
        // if you like rounded corners
        self.layer.shadowOffset = CGSizeMake(0,1)
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 0.5
    }
    
    func viewTrnsformAnimation(){
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.3, 0.3)
        UIView.animateWithDuration(0.5) {
            self.transform = CGAffineTransformIdentity;
        }
    }
    
    func SetViewBoarder(){
        self.layer.cornerRadius = 1.0
        self.layer.borderColor = StaticClass().colorWithHexString("E8E8E8", alpha: 1.0).CGColor
        self.layer.borderWidth = 1.0
    }
}
