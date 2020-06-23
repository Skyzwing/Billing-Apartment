//
//  AddRoomView.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 6/6/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct AddRoomView: View {
    
    @State var name = ""
    @Binding var dismiss: Bool
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    Text("Rental name")
                    TextField("ex.Surachet Yaitammasan", text: $name).textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
                Button(action: {
                    print("push")
                    self.dismiss = false
                }) {
                    Text("Add new room").padding([.top, .bottom], 10).padding([.leading, .trailing], 20).background(Color(hex: "#2794EB")).foregroundColor(.white).font(.custom("palatino Bold", size: 18)).cornerRadius(10).padding(.top, 23)
                }
                Spacer()
            }.navigationBarTitle(Text("Notifications"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                print("Dismissing sheet view...")
                self.dismiss = false
            }) {
                Text("Close").foregroundColor(.blue)
            })
        }
    }
}
