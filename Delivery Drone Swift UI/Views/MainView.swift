//
//  MainView.swift
//  Delivery Drone Swift UI
//
//  Created by Timi Owoturo on 2020-01-06.
//  Copyright © 2020 CEG4912. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            NavigationView {
                HomeView().navigationBarTitle("Categories")
            }.background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = .white;
                nc.navigationBar.isTranslucent = false;
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black]
                }).navigationBarItems(trailing:
                    HStack {
                        Text("Welcome").foregroundColor(Color.black)
                    }
                )
            .tabItem {
                Image("Products")
                Text("Categories")
            }
            NavigationView {
                CartView().navigationBarTitle("Cart")
            }
            .tabItem {
                Image("Cart")
                Text("Cart")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
