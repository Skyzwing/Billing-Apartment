//
//  EnumBoolean.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 13/5/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import UIKit

enum BoolCheck {
    /// Bool have only we values, so declared on and off cases here.
    case on
    case off
    
    /// isOn and isOff varaibles for getting is on and off
    var isOn: Bool {
        self == .on
    }
    var isOff: Bool {
        self == .off
    }
    /// switchType method we can use to switch current value into another value
    mutating func switchType() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
    
    /// currentValue will give what is the current value.
    var currentValue : Bool {
        switch self {
        case .on:
            return true
        case .off:
            return false
        }
    }
}


/// Variable Declartion
//var isDataLoading : BoolEnum = .on
//
//
///// check is data loading on
//if isDataLoading.isOn {
//    print("Loading is on")
//}
//
///// check is data loading off
//if isDataLoading.isOff {
//    print("Loading is off")
//}
//
///// Switch varaible state
//isDataLoading.switchType()
//
///// Get current value of varaible
//isDataLoading.currentValue
//isDataLoading.switchType()
//isDataLoading.switchType()


