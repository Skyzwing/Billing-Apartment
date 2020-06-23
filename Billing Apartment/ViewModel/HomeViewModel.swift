//
//  HomeViewModel.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 17/5/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import FirebaseFirestore
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var apartmentModel: [ApartmentModel] = []
    private var database = Firestore.firestore().collection("apartments")
    
    func addRoom() {
//        database.addDocument(data: )
    }

    
//    @Published var apartmentModel: [ApartmentModel] = []
//
//    var user: FBUser?
//
//    var cancelable = Set<AnyCancellable>()
//    let firestore = Firestore.firestore()
//
//    var amountRoom = 0
//
//    func createData(amount: Int) {
//        firestore.collection("apartments").document().setData([
//            "id": firestore.collection("apartments").document().documentID,
//            "apartment_name": "apartment name",
//            "user_id": user?.uid as Any,
//            "amount": amount
//        ]) { error in
//            if let error = error {
//                print(error.localizedDescription)
//            } else {
//                print("create success!")
//            }
//        }
//    }
}
