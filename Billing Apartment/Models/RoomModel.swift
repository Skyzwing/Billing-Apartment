//
//  RoomModel.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 20/5/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import Foundation

struct RoomModel: Identifiable {
    
    let id: String
    let userID: String
    let roomName: String
    let rentalName: String
    let startRent: String
    let endRent: String
    let electricUnit: String
    let waterUnit: String
    let price: Double
    
}
