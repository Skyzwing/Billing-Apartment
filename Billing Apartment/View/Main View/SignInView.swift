//
//  SignInView.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 27/4/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var isPresentAlert: Bool = false
    @State var authError: EmailAuthError?
    @EnvironmentObject var session: SessionInfo
    
    var body: some View {
        
        NavigationView {
            VStack {
                Group {
                    Text("Billing\nApartments")
                        .multilineTextAlignment(.trailing).foregroundColor(Color(hex: "#17B3C1")).font(.custom("Palatino Bold", size: 46))
                    Text("Welcome to Billing Apartment. This \napplication calculate billing Apartment").multilineTextAlignment(.center).font(.custom("palatino", size: 14)).foregroundColor(Color(hex: "#313131"))
                }.padding([.leading, .trailing], 20)
                Group {
                    TextField("Email / Phone number", text: $email).padding(.top, 50).padding([.leading, .trailing], 50).textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $password).padding(.top, 5).padding([.leading, .trailing], 50).textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Button(action: {
                    FBAuth.authenticate(withEmail: self.email, password: self.password) { result in
                        switch result {
                        case .failure(let error):
                            self.authError = error
                        case .success(_):
                            print("Signin success!")
                        }
                    }
                }) {
                    Text("Sign in").padding([.top, .bottom], 10).padding([.leading, .trailing], 78).background(Color(hex: "#2794EB")).foregroundColor(.white).font(.custom("palatino Bold", size: 24)).cornerRadius(10).padding(.top, 23)
                }.alert(isPresented: $isPresentAlert) {
                    Alert(title: Text("Sign in Error!"), message: Text(self.authError?.localizedDescription ?? "Unknown error"), dismissButton: .default(Text("Okay")) {
                        if self.authError == .incorrectPassword {
                            self.password  = ""
                        } else {
                            self.email = ""
                            self.password = ""
                        }
                        })
                }
                NavigationLink(destination: ForgotPasswordView()) {
                    Text("Forgot password?").foregroundColor(Color(hex: "#2794EB"))
                }.padding(.top, 30)
                HStack {
                    Text("Don't have an account? ")
                    NavigationLink(destination: RegisterView()) {
                        Text("Sign up").font(.custom("Palatino Bold", size: 16)).foregroundColor(Color(hex: "#17B3C1"))
                    }
                }.padding(.top, 50).padding(Edge.Set.bottom, 50)
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView().environmentObject(SessionInfo())
    }
}
