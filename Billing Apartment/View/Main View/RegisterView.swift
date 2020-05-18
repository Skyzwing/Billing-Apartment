
//
//  RegisterView.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 25/4/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI
import Combine
import FirebaseFirestore

struct RegisterView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var registerViewModels = RegisterViewModel()
    
    @State var image: String = ""
    @State var isPresentPhotoLibrary: Bool = false
    @State var error: Bool = false
    @State var value: CGFloat = 0
    
    var body: some View {
        VStack {
            HStack {
                Text("")
                Spacer()
                Text("")
            }
            Spacer()
            Group {
                
                Button(action: {
                    self.isPresentPhotoLibrary = true
                }) {
                    ZStack {
                        if image != ""
                        {
                            PhotoCaptureView(imageURL: image)
                        } else {
                            Image("Profile-1").padding(.bottom, 21)
                        }
                        
                        Image("Plus").resizable().frame(width: 31, height: 31, alignment: .bottom).overlay(Circle().stroke(Color.white, lineWidth: 2)).padding(.top, 70).padding(.leading, 70)
                    }
                }.buttonStyle(PlainButtonStyle()).sheet(isPresented: $isPresentPhotoLibrary) {
                    ImagePicker(isShow: self.$isPresentPhotoLibrary, imageURL: self.$image)
                }
                VStack(alignment: .leading) {
                    TextField("Email", text: $registerViewModels.email).textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding([.leading, .trailing], 50).padding(.bottom, 41)
                VStack(alignment: .leading) {
                    TextField("Apartment name", text: $registerViewModels.apartmentName).textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding([.leading, .trailing], 50).padding(.bottom, 41)
                VStack(alignment: .leading) {
                    SecureField("Password", text: $registerViewModels.password).textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding([.leading, .trailing], 50).padding(.bottom, 41)
                VStack(alignment: .leading) {
                    SecureField("Confirm Password", text: $registerViewModels.confirmPassword).textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding([.leading, .trailing], 50).padding(.bottom, 41)
                VStack(alignment: .leading) {
                    TextField("Phone number", text: $registerViewModels.phoneNumber).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad)
                }.padding([.leading, .trailing], 50).padding(.bottom, 41)
            }
            
            Button(action: {
                if self.registerViewModels.email == "" {
                    self.error = true
                } else {
                    FBAuth.createUser(withEmail: self.registerViewModels.email, apartmentName: self.registerViewModels.apartmentName, password: self.registerViewModels.password, phoneNumber: self.registerViewModels.phoneNumber) { result in
                        switch result {
                        case .failure(let error):
                            self.registerViewModels.error = error.localizedDescription
                        case .success(_):
                            self.presentationMode.wrappedValue.dismiss()
                            print("Create an account success!")
                        }
                    }
                }
            }) {
                
                Text("Sign in").padding([.top, .bottom], 10).padding([.leading, .trailing], 78).background(Color(hex: "#2794EB")).foregroundColor(.white).font(.custom("palatino Bold", size: 24)).cornerRadius(10).padding(.top, 23)
            }.alert(isPresented: $error) {
                Alert(title: Text("Have a problem"), message: Text(registerViewModels.error), dismissButton: .default(Text("Okay")))
            }
            Spacer()
            }.background(Image("background-signup").resizable()).edgesIgnoringSafeArea(.all)
            .navigationBarItems(leading: btnBack).navigationBarBackButtonHidden(true).offset(y: -self.value).animation(.spring()).onAppear {
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: .main) { (noti) in
                    let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                    let height = value.height
                    self.value = height
                }
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                    self.value = 0
                }
        }
    }
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image("back").resizable().frame(width: 42, height: 42).foregroundColor(.white)
        }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView().environmentObject(RegisterViewModel())
    }
}
