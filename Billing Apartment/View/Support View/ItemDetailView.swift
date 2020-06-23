//
//  ItemDetailView.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 7/6/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct ItemDetailView: View {
    var body: some View {
        
        NavigationView {
            List {
                ForEach (0..<20) { _ in
                    Text("@")
                }
            }.navigationBarTitle("@")
        }
//        VStack {
//            HStack {
//                Text("Rental name").foregroundColor(.blue).bold()
//                Spacer()
//                Text("Surachet Yaitammasan")
//                }
//            HStack {
//                Text("Start Date").foregroundColor(.blue).bold()
//                Spacer()
//                Text("31/01/2020")
//            }
//            HStack {
//                Text("Exp").foregroundColor(.blue)
//                Spacer()
//                Text("31/01/2021")
//            }
//            Spacer()
//        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView()
    }
}
