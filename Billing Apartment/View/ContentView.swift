//
//  ContentView.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 24/4/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var session: SessionInfo
    
    var body: some View {
        Group {
            if session.isUserAuthentication == .undefined {
                Text("Loading . . .")
            } else if session.isUserAuthentication == .signOut {
                SignInView()
            } else {
                AppView()
            }
        }.onAppear {
            self.session.ConfigurationStateDidChange()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionInfo())
    }
}
