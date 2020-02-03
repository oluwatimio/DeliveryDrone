//
//  CardFullImage.swift
//  Delivery Drone Swift UI
//
//  Created by Timi Owoturo on 2020-01-03.
//  Copyright © 2020 CEG4912. All rights reserved.
//

import SwiftUI

struct CardFullImage: View {
   var image: String;
   var category: String;
   var title: String;
   var subtitle: String;
   var body: some View {
    VStack (alignment: .center){
           HStack{
               VStack(alignment: .center){
                       Text(category)
                           .font(.headline)
                        .foregroundColor(Color.white)
                       Text(title)
                           .font(.system(size: 50))
                        .foregroundColor(Color.white)
                       Text(subtitle)
                           .font(.headline)
                        .foregroundColor(Color.black)
               }
           }
    }.frame(width: 350, height: 500).padding([.top, .horizontal, .vertical
    ]).background(Image(image).resizable().aspectRatio(contentMode: .fill)).shadow(radius: 5).cornerRadius(15.0).padding([.top])
   }
}

struct CardFullImage_Previews: PreviewProvider {
    static var previews: some View {
        CardFullImage(image: "man", category: "Ages 16+", title: "MAN", subtitle: "")
    }
}
