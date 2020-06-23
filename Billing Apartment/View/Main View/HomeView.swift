//
//  HomeView.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 24/4/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State var count = 1
    @State var showModal: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#EFEFEF").edgesIgnoringSafeArea(.bottom)
                VStack {
                    if self.count != 0 {
                        List {
                            ForEach(0 ..< self.count) { _ in
                                ItemRowView()
                            }
                        }
                    } else {
                        Text("Please register your room")
                    }
                }.navigationBarTitle("Billing Apartment")
                    .navigationBarItems(trailing:
                        Button(action: {
                            self.count += 1
                            self.showModal.toggle()
                            print(self.count)
                        }) {
                            Image(systemName: "plus")
                                .font(Font.system(.title)).foregroundColor(.blue)
                        }
                )
            }
        }.sheet(isPresented: $showModal) {
            AddRoomView(dismiss: self.$showModal)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
