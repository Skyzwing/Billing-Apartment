//
//  ApartmentModel.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 19/5/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct ApartmentModel: Identifiable {
    
    var id: String
    var userId: String
    var apartmentName: String
    var amount: Int
//    var Room: RoomModel
}

//extension ApartmentModel {
//    
//    init(_ document: DocumentSnapshot) {
//        self.id = document.documentID
//        self.userId = document.get("user_id") as! String
//        self.apartmentName = document.get("apartment_name") as! String
//        self.amount = document.get("amount") as? Int ?? 0
//    }
//    
//    var toJSONSnapshot: [String: Any] {
//        return [
//            "user_id": self.userId,
//            "apartment_name": self.apartmentName,
//            "amount": self.amount
//        ]
//    }
//}
