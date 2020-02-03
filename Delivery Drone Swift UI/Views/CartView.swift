//
//  CartView.swift
//  Delivery Drone Swift UI
//
//  Created by Timi Owoturo on 2020-01-03.
//  Copyright © 2020 CEG4912. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import Promise

struct CartView: View {
    @State var cartItems: [ProductOrderPending] = []
    @State var itemDictionary: [NSDictionary] = []
    @State var cartId: String = "";
    @State private var showingAlert = false
    var body: some View {
        List {
            VStack (spacing: 20){
                ForEach (cartItems) { item in
                    CartProduct(imageLink: item.imageLink, productName: item.name, productId: item.id, price: item.price, numberOfItems: item.count)
                }
            }
        }.onAppear(perform: {self.getCardItemsForUser()}).navigationBarItems(trailing:
            Button(action: {
                self.purchaseProducts().then({ result in
                    if (result){
                        self.showingAlert = true
                    }
                })
            }){
                 Text("BUY").foregroundColor(.white)
                }.frame(width: 80, height: 30).background(Color.black).cornerRadius(20).padding()        .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Purhchase Complete"), message: Text("Products have been purchased."), dismissButton: .default(Text("Okay")))
                }
        )
    }
    
    func purchaseProducts() -> Promise<Bool> {
        return Promise<Bool> (work: {fulfill, reject in
            let db = Firestore.firestore();
            let productRef = db.collection("purchased").document();
            productRef.setData([
                "userId" : Session.instance()?.uid,
                "items" : self.itemDictionary,
                "delivered" : false
            ])
            Firestore.firestore().collection("cart").document(self.cartId).delete()
            fulfill(true)
        })
        
    }
    
    func getCardItemsForUser() {
        Firestore.firestore().collection("cart").document(Session.instance()!.uid).addSnapshotListener({
            documentSnapshot, error in
            guard let document = documentSnapshot else {
                    return
            }
            self.cartId = document.documentID;
            guard let data = document.data() else {
                self.cartItems = []
                return
            }
            let cartItemsFromFireStore = data["cartItems"] as! [Dictionary<String,Any>]
            
            
            for cartItem in cartItemsFromFireStore{
                Firestore.firestore().collection("products2").whereField("id", isEqualTo: cartItem["productId"] as! String).getDocuments(completion: {
                    productSnapshot, error in
                    guard let products = productSnapshot?.documents else {
                        print(error)
                            return
                    }
                    for product in products {
                        let qrCode = "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=" + (product.data()["id"] as! String);
                        let foundProduct = ProductOrderPending(name: product.data()["name"] as! String, id: product.data()["id"] as! String, imageLink: product.data()["imageLink"] as! String, price: product.data()["price"] as! String, category: product.data()["category"] as! String, count: cartItem["quantity"] as! Int, qrCode: qrCode)
                        let foundProductDictionary : NSDictionary = ["productId": product.data()["id"] as! String, "price": product.data()["price"] as! String, "count": cartItem["quantity"] as! Int, "qrCode": qrCode]
                        self.cartItems.append(foundProduct)
                        self.itemDictionary.append(foundProductDictionary)
                    }
                })
            }
        })
    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
