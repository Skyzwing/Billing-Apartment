//
//  ChargeView.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 16/5/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct ChargeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }.navigationBarItems(trailing: Button(action: {
                print("a")
            }) {
                Text("S")
            })
        }
    }
}

struct ChargeView_Previews: PreviewProvider {
    static var previews: some View {
        ChargeView()
    }
}
