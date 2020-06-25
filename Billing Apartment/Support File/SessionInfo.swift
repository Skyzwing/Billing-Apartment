//
//  SessionInfo.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 30/4/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import Foundation
import Firebase

class SessionInfo: ObservableObject {
    enum AuthenticationState {
        case undefined, signIn, signOut
    }
    
    var uuid = "."
    
    @Published var isUserAuthentication: AuthenticationState = .undefined
    @Published var user: FBUser = .init(uid: "", apartmentName: "", email: "", phoneNumber: "")
    
    var authenStateDidChangeListenerHandler: AuthStateDidChangeListenerHandle?
    func ConfigurationStateDidChange() {
        
        authenStateDidChangeListenerHandler = Auth.auth().addStateDidChangeListener( { (_, user) in
            guard let user = user else {
                self.isUserAuthentication = .signOut
                return
            }
            self.isUserAuthentication = .signIn
            FBFirestore. retrieveFBUser(uid: user.uid) { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let user):
                    self.uuid = user.uid
                    print(user.uid)
                    print(self.uuid)
                    self.user = user
                }
            }
        })
        self.isUserAuthentication = .signIn
        self.isUserAuthentication = .signOut
    }
}
