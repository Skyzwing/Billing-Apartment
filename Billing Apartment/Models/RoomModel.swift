//
//  RoomModel.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 20/5/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import Foundation

struct RoomModel: Identifiable {
    
    var id: String
    var roomName: String
    var rentalName: String
    var startRent: Data
    var endRent: Date
    var electricUnit: ElectricModel
    var waterUnit: WaterModel
    var price: Double
    
}
