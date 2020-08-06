//
//  ChargeView.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 16/5/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct ChargeView: View {
    @State var elec = ""
    @State var but = false
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search room", text: $elec).padding(10).padding(5).textFieldStyle(RoundedBorderTextFieldStyle())
                Divider()
                HStack {
                    Text("ห้องที่ 1").font(.custom("palatino Bold", size: 26)).padding([.bottom], 10)
                    Spacer()
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text("Electric")
                        TextField("Please input unit", text: $elec).textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text("Water")
                        TextField("Please input unit", text: $elec).textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
//                Button(action: <#T##() -> Void#>) {
//                    Text("Save and next room").padding([.top, .bottom], 10).padding([.leading, .trailing], 78).background(Color(hex: "#2794EB")).foregroundColor(.white).font(.custom("palatino Bold", size: 24)).cornerRadius(10).padding(.top, 23)
//                }
                Spacer()
            }.padding([.leading, .trailing], 10).navigationBarTitle(Text("Calculation Charge")).navigationBarItems(trailing: Text("Save").foregroundColor(.blue))
        }
    }
}

struct ChargeView_Previews: PreviewProvider {
    static var previews: some View {
        ChargeView()
    }
}
