//
//  SplashScreen.swift
//  Delivery Drone Swift UI
//
//  Created by Timi Owoturo on 2020-01-06.
//  Copyright © 2020 CEG4912. All rights reserved.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color.black
            Text("Delivery Drone").foregroundColor(Color.white).bold().font(.largeTitle)
        }.edgesIgnoringSafeArea(.all)
    };
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
