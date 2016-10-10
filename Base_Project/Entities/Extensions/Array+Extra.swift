//
//  Array+Extra.swift
//  Booking_system
//
//  Created by Tops on 10/8/16.
//  Copyright © 2016 Tops. All rights reserved.
//
import Foundation

extension Array where Element: Equatable {
    
    mutating func removeElement(element: Element) -> Element? {
        if let index = indexOf(element) {
            return removeAtIndex(index)
        }
        return nil
    }
}
