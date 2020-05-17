//
//  HomeView.swift
//  Delivery Drone Swift UI
//
//  Created by Timi Owoturo on 2020-01-03.
//  Copyright © 2020 CEG4912. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    let categories = Category.getCategories()
    var body: some View {
        ScrollView(.vertical, content : {
            VStack (spacing: 20) {
                ForEach(categories){ catalog in
                    NavigationLink(destination: CategoryView(categoryName: catalog.category)
                    ) {
                        CardFullImage(image: catalog.imageLink, category: catalog.category, title: catalog.title, subtitle: catalog.subtitle)
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }).navigationBarItems(trailing:
        Button(action: {
            do {
                try Auth.auth().signOut()
                print("Logout")
                Session.clearSession()
                ContentView()
            } catch let signOutError as NSError {
              print ("Error signing out: %@", signOutError)
            }
            
        }){
             Text("Logout").foregroundColor(.white)
        }.frame(width: 80, height: 30).background(Color.black).cornerRadius(20).padding())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
