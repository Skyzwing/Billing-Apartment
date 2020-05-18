//
//  AppView.swift
//  Billing ApartmentTests
//
//  Created by Surachat Yaitammasan on 25/4/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                Image(systemName: "house.fill")
                Text("Home").font(.title)
            }
            ChargeView().tabItem {
                Image(systemName: "creditcard.fill")
                Text("Charge")
            }
            MeView().tabItem {
                Image(systemName: "person.fill")
                Text("Me")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
