//
//  MeView.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 25/4/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI
import MessageUI

struct MeView: View {
    
//    let sendMail = SendMail()
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    
    @EnvironmentObject var session: SessionInfo
    @State var isPresetAlert = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Image("Profile-1").resizable().frame(width: 118, height: 118)
                    VStack(alignment: .leading) {
                        Text(session.user.apartmentName).font(.custom("palatino-Bold", size: 18)).foregroundColor(.white)
                        Text(session.user.email).font(.custom("palatino", size: 16)).foregroundColor(.white)
                    }
                    Spacer()
                }.padding(.top, 65).padding(.bottom, 35).background(LinearGradient(gradient: Gradient(colors: [Color(hex: "#17B3C1"), Color(hex: "#2794EB")]), startPoint: .top, endPoint: .bottom))
                List {
                    Text("Edit Profile")
                    Text("Help")
                    Text("Contact Us")
                    Button(action: {
                        self.isShowingMailView.toggle()
                    }) {
                        Text("Mail")
                    }
//                    Button(action: { self.sendMail.presentMailCompose() }) {
//                        Text("mail")
//                    }
                    Button(action: {
                        self.isPresetAlert = true
                    }) {
                        Text("Log Out")
                        }.actionSheet(isPresented: $isPresetAlert) {
                        ActionSheet(title: Text("Do you want to sign out?"),
                                    message: Text("If you want to sign out please push ok but don't please push cancel"),
                                    buttons: [.destructive(Text("Log Out"), action: {
                                        self.session.isUserAuthentication = .signOut
                                    }), .cancel()])
                    }
                    
                    }.environment(\.defaultMinListRowHeight, 50)
            }.edgesIgnoringSafeArea(.all)
            if (isShowingMailView) {
                mailView()
                .transition(.move(edge: .bottom))
                .animation(.default)
            }
        }
    }
    
    private func mailView() -> some View {
        MFMailComposeViewController.canSendMail() ?
            AnyView(MailView(isShowing: $isShowingMailView, result: $result)) :
            AnyView(Text("Can't send emails from this device"))
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView().environmentObject(SessionInfo())
    }
}
