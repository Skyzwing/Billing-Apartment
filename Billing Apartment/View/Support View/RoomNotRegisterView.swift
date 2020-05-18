//
//  RoomNotRegisterView.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 16/5/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct RoomNotRegisterView: View {
    var body: some View {
        ZStack {
            Color(hex: "#f2f2f7").edgesIgnoringSafeArea(.all)
            Text("You're not registed room").foregroundColor(Color(hex: "#313131")) 
        }
    }
}

struct RoomNotRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RoomNotRegisterView()
    }
}
