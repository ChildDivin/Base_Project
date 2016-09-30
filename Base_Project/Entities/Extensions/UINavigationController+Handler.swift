//
//  UINavigationController+Handler.swift
//  Booking_system
//
//  Created by Tops on 8/2/16.
//  Copyright © 2016 Tops. All rights reserved.
//

import UIKit

extension UINavigationController {
    func popViewControllerWithHandler(completion: ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popViewControllerAnimated(true)
        CATransaction.commit()
    }
    
    func popToRootViewControllerWithHandler(completion: ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popToRootViewControllerAnimated(true)
        CATransaction.commit()
    }
    
    func pushViewController(viewController: UIViewController, completion: ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.pushViewController(viewController, animated: true)
        CATransaction.commit()
    }
    
    func popToViewController(viewController:UIViewController, completion:()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popToViewController(viewController, animated: false)
        CATransaction.commit()
    }
}
