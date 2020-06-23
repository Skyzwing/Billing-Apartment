//
//  ForgotPasswordView.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 25/4/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image("back-forgot").resizable().frame(width: 42, height: 42).foregroundColor(Color(hex: "#17b3c1"))
        }
        }
    }
    
    @State var email:String = ""
    @State var isAlert: Bool = false
    @State var errorMessage: String? = nil
    
    var body: some View {
        VStack {
            Image("forgot-password").resizable().frame(width: 200, height: 200).padding(.bottom, 40)
            Group {
                Text("Forgot Password?")
                    .multilineTextAlignment(.trailing).foregroundColor(Color(hex: "#17B3C1")).font(.custom("Palatino Bold", size: 32)).padding(.bottom, 20)
                Text("Please enter your email address or phone number \nwe will get back to the reset password link.").multilineTextAlignment(.center).font(.custom("palatino", size: 12)).foregroundColor(Color(hex: "#313131"))
            }
            Group {
                TextField("Email / Phone number", text: $email).padding(.top, 30).padding([.leading, .trailing], 50).textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    FBAuth.resetPassword(email: self.email) { result in
                        switch result {
                        case .failure(let error):
                            self.errorMessage = error.localizedDescription
                        case .success(_):
                            break
                        }
                        self.isAlert = true
                    }
                }) {
                    Text("Reset Password").padding([.top, .bottom], 10).padding([.leading, .trailing], 30).background(Color(hex: "#2794EB")).foregroundColor(.white).font(.custom("palatino-Bold", size: 20)).cornerRadius(10).padding(.top, 30)
                }
            }
        }.navigationBarItems(leading: btnBack).navigationBarBackButtonHidden(true).alert(isPresented: $isAlert) {
            Alert(title: Text("Password Reset"),
                  message: Text(self.errorMessage ?? "Reset password was sent to your email, please check your mail"), dismissButton: .default(Text("OK")) {
                    if self.errorMessage == nil {
                        self.presentationMode.wrappedValue.dismiss()
                    } else {
                        self.email = ""
                    }
                })
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
