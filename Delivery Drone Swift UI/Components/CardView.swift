//
//  CardView.swift
//  Delivery Drone Swift UI
//
//  Created by Timi Owoturo on 2020-01-03.
//  Copyright © 2020 CEG4912. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var image: String;
    var category: String;
    var title: String;
    var subtitle: String;
    var body: some View {
        VStack{
        Image(image).resizable().aspectRatio(contentMode: .fit)
            HStack{
                VStack(alignment: .leading){
                        Text(category)
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text(title)
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                        Text(subtitle)
                            .font(.headline)
                            .foregroundColor(.secondary)
                }.layoutPriority(100.0)
                Spacer()
            }.padding()
            
            }.cornerRadius(15.0).overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
            ).padding([.top, .horizontal]).shadow( radius: 1)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: "hyatt2", category: "Architecture", title: "Take a look at the future", subtitle: "Oluwatimi Owoturo")
    }
}
