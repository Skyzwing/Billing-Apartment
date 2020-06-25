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

class HomeViewModel {
    
    private var database = Firestore.firestore().collection("apartments")
    let db = Firestore.firestore()
    
    var session: SessionInfo = .init()
    
    func getUID() {
        print(session.uuid)
    }
}
