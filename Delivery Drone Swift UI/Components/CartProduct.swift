//
//  CartProduct.swift
//  Delivery Drone Swift UI
//
//  Created by Timi Owoturo on 2020-01-03.
//  Copyright © 2020 CEG4912. All rights reserved.
//

import SwiftUI
import URLImage
struct CartProduct: View {
    var imageLink: String;
    var productName: String;
    var productId: String;
    var price: String;
    @State var numberOfItems: Int;
    var body: some View {
        HStack (spacing: 25) {
            URLImage(URL(string: imageLink)!) { proxy in
                proxy.image
                .resizable()
            }
                .frame(width: 150, height: 150)
                .aspectRatio(contentMode: .fit)
                .clipped()
                .cornerRadius(20)
            VStack (alignment: .leading, spacing: 20) {
                Text(productName).font(.headline)
                Text(productId)
                Text(price)
                Text("Quantity: \(numberOfItems)")
            }.frame(height: 150)
        }.padding().shadow(color: Color.gray, radius: 12).overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 4))
    }
}

struct CartProduct_Previews: PreviewProvider {
    static var previews: some View {
        CartProduct(imageLink: "https://i.etsystatic.com/13521217/r/il/eba16b/1859385831/il_570xN.1859385831_3e77.jpg", productName: "Product Example", productId: "YT45KJ98", price: "$1000", numberOfItems: 1)
    }
}
