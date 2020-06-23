//
//  ItemRowView.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 7/6/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct ItemRowView: View {
    var body: some View {
        NavigationLink(destination: ItemDetailView()) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Room 1").padding(.top, 20)
                    Text("Surachet Yaitammasan").font(.footnote).padding(.bottom, 5)
                }
                Spacer()
                Text("5123 Bath").font(.footnote)
            }
        }
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView()
    }
}
