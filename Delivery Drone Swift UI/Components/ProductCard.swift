//
//  ProductCard.swift
//  Delivery Drone Swift UI
//
//  Created by Timi Owoturo on 2020-01-04.
//  Copyright © 2020 CEG4912. All rights reserved.
//

import SwiftUI
import URLImage

struct ProductCard: View {
    var product: Product;
    var width: Int;
    var height: Int;
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading){
                    Text(product.category)
                               .font(.headline)
                            .foregroundColor(Color.white)
                    Text(product.name)
                               .font(.system(size: 27))
                            .foregroundColor(Color.white)
                    Text(product.price)
                               .font(.headline)
                            .foregroundColor(Color.pink)
                }.layoutPriority(100.0)
                Spacer()
            }.padding()
        }.frame(width: CGFloat(width), height: CGFloat(height)).background(URLImage(URL(string: product.imageLink)!, delay: 0.25, placeholder: {
            ProgressView($0) { progress in
                ZStack {
                    if progress > 0.0 {
                        CircleProgressView(progress).stroke(lineWidth: 8.0)
                    }
                    else {
                        CircleActivityView().stroke(lineWidth: 50.0)
                    }
                }
            }.frame(width: 50.0, height: 50.0)
        }){ proxy in
            proxy.image
            .resizable()
            .aspectRatio(contentMode: .fill)
        }).shadow(radius: 5).cornerRadius(15.0).padding([.top])
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: Product(name: "Lige Watch", id: "gfxXtjsKuvTUDro1SEqT", imageLink: "https://contestimg.wish.com/api/webimage/5c348d31c401dd28c548bafd-large.jpg?cache_buster=89e79ff84013ad8378f6b43f37dd87d6", price: "$200", category: "Women\'s Accessories"), width: 180, height: 230)
    }
}
