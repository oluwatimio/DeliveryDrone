//
//  ProductDetail.swift
//  Delivery Drone Swift UI
//
//  Created by Timi Owoturo on 2020-01-03.
//  Copyright © 2020 CEG4912. All rights reserved.
//

import SwiftUI
import URLImage
import FirebaseFirestore
import Promise

struct ProductDetail: View {
    @State var numberOfItems: Int = 0
    var product: Product;
    @State private var showingAlert = false
    var body: some View {
        VStack {
//            Image("hyatt2").resizable().aspectRatio(contentMode: .fit)
            URLImage(URL(string: product.imageLink)!, delay: 0.25, placeholder: {
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
                .aspectRatio(contentMode: .fit)
            }
            HStack {
                Text(product.name).font(.system(size: 30))
                Spacer()
            }.padding([.leading, .trailing, .top])
            HStack {
                Text(product.price).font(.system(size: 20))
                Spacer()
                Stepper(value: $numberOfItems, in: 0...10, label: {Text("Quantity \(numberOfItems)").font(.system(size: 20))}).frame(width: 200)
            }.padding([.leading, .trailing, .top])
            HStack {
                VStack {
                    Text("Color").font(.system(size: 20))
                    Button(action: {}){
                        Rectangle().fill(Color.red).frame(width: 50, height: 50)
                        }
                }.layoutPriority(100.0)
                Spacer()
                Button(action: {
                    self.addToCart().then({ result in
                        if (result){
                            self.showingAlert = true
                        }
                    })
                }){
                    Text("Add to Cart")
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text("Added to cart"), message: Text("Added " + product.name + "to cart"), dismissButton: .default(Text("Got it!")))
                }
            }.padding([.leading, .trailing, .top])
            HStack {
                VStack(alignment: .leading, spacing: 10){
                    Text("Item Description").font(.system(size: 20)).fontWeight(.bold)
                    Text("Description can be very long and very huge but I have no idea why it is moving so stupidly")
                }
            }.padding()
            }.frame(maxHeight: .infinity, alignment: .topLeading)
    }
    
    func addToCart() -> Promise<Bool> {
        
        return Promise<Bool>(work: { fulfill, reject in
            let docRef = Firestore.firestore().collection("cart").document(Session.instance()!.uid)

            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    docRef.updateData([
                        "cartItems" : FieldValue.arrayUnion([
                            ["productId" : self.product.id,
                            "quantity" : self.numberOfItems]
                        ])
                    ])
                    fulfill(true)
                } else {
                    docRef.setData([
                        "cartItems" : [[
                            "productId" : self.product.id,
                            "quantity" : self.numberOfItems]
                        ]
                    ])
                    fulfill(true)
                }
            }
        })
    }
}
//struct ProductDetail_Previews: PreviewProvider {
//    static var previews: some View {
////        ProductDetail(product: nil)
//    }
//}
