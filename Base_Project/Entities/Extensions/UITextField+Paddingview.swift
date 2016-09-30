//
//  UITextField+Paddingview.swift
//  Lyst
//
//  Created by Tops on 3/16/16.
//  Copyright © 2016 Tops. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    /**
     @brief This is normal padding methods
     @param no need paramer (it's contain default parameter )
     * UITextField = textfield which you want to set left padding
     * padding = 0.5
     `````
     txtEmail.paddingview(txtEmail)
     `````
     @remark This is super easy methods
     
     */
    func paddingview(txtfield:UITextField)-> UITextField{
        let l3 = UIView(frame: CGRectMake(0, 0, 5, txtfield.frame.height))
        txtfield.leftView = l3
        txtfield.leftViewMode = UITextFieldViewMode.Always
        return txtfield
    }
    
    /**
     @brief This is large padding methods
     @param no need paramer (it's contain default parameter )
     * UITextField = textfield which you want to set left padding
     * padding = 40
     `````
     txtEmail.paddingviewLarge(txtEmail)
     `````
     @remark This is super easy methods
     
     */
    func paddingviewLarge(txtfield:UITextField)-> UITextField{
        let l3 = UIView(frame: CGRectMake(0, 0,40, txtfield.frame.height))
        txtfield.leftView = l3
        txtfield.leftViewMode = UITextFieldViewMode.Always
        return txtfield
    }
    func paddingviewMedium(txtfield:UITextField)-> UITextField{
        let l3 = UIView(frame: CGRectMake(0, 0,20, txtfield.frame.height))
        txtfield.leftView = l3
        txtfield.leftViewMode = UITextFieldViewMode.Always
        return txtfield
    }
    func paddingviewWithCustomValue(value:CGFloat,txtfield:UITextField)-> UITextField{
        let l3 = UIView(frame: CGRectMake(0, 0,value, txtfield.frame.height))
        txtfield.leftView = l3
        txtfield.leftViewMode = UITextFieldViewMode.Always
        return txtfield
    }
}