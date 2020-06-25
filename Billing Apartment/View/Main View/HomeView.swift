//
//  HomeView.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 24/4/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State var items: [RoomModel] = []
    @State var count = 0
    @State var showModal: Bool = false
    var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#EFEFEF").edgesIgnoringSafeArea(.bottom)
                VStack {
                    if self.count != 0 {
                        List {
                            ForEach(items) { _ in
                                ItemRowView()
                            }
                        }
                    } else {
                        Text("Please register your room")
                    }
                }.navigationBarTitle("Billing Apartment")
                    .navigationBarItems(trailing: addRoomButton)
            }
        }.sheet(isPresented: $showModal) {
            AddRoomView(dismiss: self.$showModal)
        }
    }
    
    var addRoomButton: some View {
        AnyView(Button(action: onAdd) {
            Image(systemName: "plus")
                .font(Font.system(.title)).foregroundColor(.blue)
        })
    }
    
    func onAdd() {
        homeViewModel.getUID()
        self.count += 1
        items.append(RoomModel(id: "o", userID: "123", roomName: "12313", rentalName: "ssss", startRent: "2", endRent: "3", electricUnit: "4", waterUnit: "1", price: 12.00))
        print(items)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
