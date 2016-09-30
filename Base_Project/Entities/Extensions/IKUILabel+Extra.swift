//
//  IKUILabel+Extra.swift
//  Booking_system
//
//  Created by Tops on 6/20/16.
//  Copyright © 2016 Tops. All rights reserved.
//

import UIKit

extension UILabel {
    func blink() {
        self.alpha = 0.0;
        UIView.animateWithDuration(0.8, //Time duration you want,
            delay: 0.0,
            options: [.CurveEaseInOut, .Autoreverse, .Repeat],
            animations: { [weak self] in self?.alpha = 1.0 },
            completion: { [weak self] _ in self?.alpha = 0.0 })
    }
    
    func blinkStop()
    {
        self.alpha = 1.0;
    }
}