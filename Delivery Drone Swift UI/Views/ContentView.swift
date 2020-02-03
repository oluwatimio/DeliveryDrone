//
//  ContentView.swift
//  Delivery Drone Swift UI
//
//  Created by Timi Owoturo on 2020-01-03.
//  Copyright © 2020 CEG4912. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var loggedInSession : Session? = Session.instance();
    @ViewBuilder
    var body: some View {
        if (loggedInSession != nil) {
            MainView()
        } else {
            AuthView(loggedInSession: $loggedInSession)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
