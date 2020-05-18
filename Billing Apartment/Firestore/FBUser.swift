//
//  FBUser.swift
//  Signin With Apple
//
//  Created by Stewart Lynch on 2020-03-18.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import Foundation

struct FBUser {
    let uid: String
    let apartmentName: String
    let email: String
    let phoneNumber: String
    
    // App Specific properties can be added here
    
    init(uid: String, apartmentName: String, email: String, phoneNumber: String) {
        self.uid = uid
        self.apartmentName = apartmentName
        self.email = email
        self.phoneNumber = phoneNumber
    }

}

extension FBUser {
    init?(documentData: [String : Any]) {
        let uid = documentData[FBKeys.User.uid] as? String ?? ""
        let apartmentName = documentData[FBKeys.User.apartmentName] as? String ?? ""
        let email = documentData[FBKeys.User.email] as? String ?? ""
        let phoneNumber = documentData[FBKeys.User.phoneNumber] as? String ?? ""
        
        // Make sure you also initialize any app specific properties if you have them

        
        self.init(uid: uid,
                  apartmentName: apartmentName,
                  email: email,
                  phoneNumber: phoneNumber
                  // Dont forget any app specific ones here too
        )
    }
    
    static func dataDict(uid: String, apartmentName: String, email: String, phoneNumber: String) -> [String: Any] {
        var data: [String: Any]
        
        // If name is not "" this must be a new entry so add all first time data
        if apartmentName != "" {
            data = [
                FBKeys.User.uid: uid,
                FBKeys.User.apartmentName: apartmentName,
                FBKeys.User.email: email,
                FBKeys.User.phoneNumber: phoneNumber
                // Again, include any app specific properties that you want stored on creation
            ]
        } else {
            // This is a subsequent entry so only merge uid and email so as not
            // to overrwrite any other data.
            data = [
                FBKeys.User.uid: uid,
                FBKeys.User.email: email
            ]
        }
        return data
    }
}
