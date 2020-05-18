//
//  UserModel.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 29/4/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import Foundation

struct UserModel {
    var id: String
    var email: String
    var apartmentName: String
    var phoneNumber: String
    
    init(id: String, email: String, apartmentName: String, phoneNumber: String) {
        self.id = id
        self.email = email
        self.apartmentName = apartmentName
        self.phoneNumber = phoneNumber
    }
}
