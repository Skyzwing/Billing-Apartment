//
//  RegisterViewModel.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 1/5/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import Foundation
//import Combine
import FirebaseFirestore
import SwiftUI

enum ValidateRegister {
    case userEmpty
    case passwordEmpty
    case confirmPasswordEmpty
    case apartmentNameEmpty
    case phoneEmpty
    case confirmPasswordNotEqual
    case passwordLess
}

class RegisterViewModel: ObservableObject {
    
    @Published var userModels: [UserModel] = []
    
    @EnvironmentObject var  sessionStore: SessionInfo
    
    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var apartmentName: String = ""
    var phoneNumber: String = ""
    var error: String = ""
    
    var isPresentAlert: Bool = false
    
    let databaseCollection = Firestore.firestore()
    
    //    MARK: - Validation checkins
    func isEmpty(field: String) -> Bool {
        return field.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func passwordMatching(confirmPassword: String) -> Bool {
        return confirmPassword == password
    }
    
    func isEmailValidation(email: String) -> Bool {
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailTest.evaluate(with: email)
    }
    
    func isPasswordValidation(password: String) -> Bool {
        //        password must be minimum eight characters, at least one letter and one number
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", "^(?=.*[a-z])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    
    var enableSignUpButton: Bool {
        if !isEmailValidation(email: email) ||
            isEmpty(field: apartmentName) ||
            !isPasswordValidation(password: password) ||
            !passwordMatching(confirmPassword: confirmPassword){
            return false
        } else {
            return true
        }
    }
    
    var enableLoginButton: Bool {
        if isEmpty(field: email) ||
            isEmpty(field: password) {
            return false
        } else {
            return true
        }
    }
    
//    MARK: - Validate text error
    var validApartmentNameText: String {
        if !isEmpty(field: apartmentName) {
            return ""
        } else {
            return "Enter valid apartment name"
        }
    }
    
    var validEmailText: String {
        if isEmailValidation(email: email) {
            return ""
        } else {
            return "Email must valid"
        }
    }
    
    var validPasswordText: String {
        if isPasswordValidation(password: password) {
            return ""
        } else {
            return "Password must be minimum eight characters, at least one letter and one number"
        }
    }
    
    var validConfirmPasswordText: String {
        if passwordMatching(confirmPassword: confirmPassword) {
            return ""
        } else {
            return "Password and confirm password not matching"
        }
    }
    
//    func signUp() {
//        if email == "" || apartmentName == "" || password == "" || phoneNumber == "" {
//            isPresentAlert = true
//        }
//        else {
//            sessionStore.signUp(email: email, password: password) { (result, error) in
//                if let error = error {
//                    self.error = error.localizedDescription
//                } else {
//                    self.databaseCollection.collection("users").addDocument(data: [
//                        "email": self.email,
//                        "apartmentName": self.apartmentName,
//                        "password": self.password,
//                        "phone": self.phoneNumber
//                    ]) { error in
//                        if let error = error {
//                            print(error.localizedDescription)
//                        } else {
//                            print("Document add success")
//                        }
//                    }
//                }
//            }
//        }
//    }
    
}
