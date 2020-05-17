//
//  AuthView.swift
//  Delivery Drone Swift UI
//
//  Created by Timi Owoturo on 2020-01-04.
//  Copyright © 2020 CEG4912. All rights reserved.
//

import SwiftUI

struct AuthView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var loggedInSession: Session?;
    @State var fullName: String = "";
    @State var email: String = "";
    @State var password: String = "";
    @State var confirmPassword: String = "";
    @State var login: Bool = false;
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

    var body: some View {
        ZStack {
//            LinearGradient(gradient: Gradient(colors: [.pink, .white]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            VStack (spacing: 20) {
                HStack (spacing: 100){
                    if (!login){
                        Button(action: {self.login = false}){
                            Text("Sign Up").foregroundColor(.white)
                        }.frame(width: 100, height: 50).background(Color.black).cornerRadius(20)
                    } else {
                        Button(action: {self.login = false}){
                            Text("Sign Up").foregroundColor(.black)
                        }.frame(width: 100, height: 50).background(lightGreyColor).cornerRadius(20)
                    }
                    if (login){
                        Button(action: {self.login = true}){
                            Text("Login").foregroundColor(.white)
                        }.frame(width: 100, height: 50).background(Color.black).cornerRadius(20)
                    } else {
                        Button(action: {self.login = true}){
                            Text("Login").foregroundColor(.black)
                        }.frame(width: 100, height: 50).background(lightGreyColor).cornerRadius(20)
                    }
                }
                Text(!login ? "Create an Account" : "Login to Account").font(.largeTitle).fontWeight(.bold)
                VStack (spacing: 10) {
                    if (!login){
                        TextField("Full Name", text: $fullName).padding().background(lightGreyColor).cornerRadius(20).font(.title).padding()
                    }
                    TextField("Email", text: $email).padding().background(lightGreyColor).cornerRadius(20).font(.title).padding().keyboardType(.emailAddress)
                    SecureField("Password", text: $password).padding().background(lightGreyColor).cornerRadius(20).font(.title).padding()
                    if (!login){
                        SecureField("Confirm Password", text: $confirmPassword).padding().background(lightGreyColor).cornerRadius(20).font(.title).padding()
                    }
                }.padding()
                
                Button(action: {
                    if (self.login){
                        FirebaseUtils.login(email: self.email, password: self.password).then({ result in
                            if (result) {
                                self.loggedInSession = Session.instance()
                                self.presentationMode.wrappedValue.dismiss()
                            } else {
                                
                            }
                        })
                    } else {
                        FirebaseUtils.createAccount(email: self.email, password: self.password, displayName: self.fullName).then({ result in
                            if (result) {
                                self.loggedInSession = Session.instance()
                                self.presentationMode.wrappedValue.dismiss()
                            } else {
                                
                            }
                        })
                    }
                }){
                    Text("DONE").foregroundColor(.white)
                }.frame(width: 100, height: 50).background(Color.black).cornerRadius(20).padding([.bottom])
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    @State static var loggedInSession: Session? = Session.instance();
    static var previews: some View {
        AuthView(loggedInSession: $loggedInSession)
    }
}
