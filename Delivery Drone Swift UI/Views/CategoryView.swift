//
//  CategoryView.swift
//  Delivery Drone Swift UI
//
//  Created by Timi Owoturo on 2020-01-04.
//  Copyright © 2020 CEG4912. All rights reserved.
//

import SwiftUI
import QGrid
import FirebaseFirestore
import Grid
struct CategoryView: View {
    var categoryName: String;
    @State var productsForCategory: [Product] = []
    @State private var show_modal: Bool = false
    @State var currentProductClicked: Product? = nil;
    var body: some View {
        VStack {
            Grid(self.productsForCategory) { product in
                Button(action: {
                    self.currentProductClicked = product
                    self.show_modal.toggle()
                }
                ) {
                    return ProductCard(product: product, width: 180, height: 220)
                }.sheet(isPresented: self.$show_modal, content: {ProductDetail(product: self.currentProductClicked!)}).buttonStyle(PlainButtonStyle())
            }.gridStyle(
                    ModularGridStyle(columns: .min(180), rows: .min(220)) // Width -> columns, height -> rows
            ).navigationBarTitle(Text(self.categoryName), displayMode: .inline).onAppear(perform: {self.getProductsForCategory(category: self.categoryName)})
        }
    }
    
    func getProductsForCategory(category: String) {
        let db = Firestore.firestore()
        db.collection("products2").whereField("category", isEqualTo: category).addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print(error)
                    return
            }
            for document in documents {
                let product = Product(name: document.data()["name"] as! String, id: document.data()["id"] as! String, imageLink: document.data()["imageLink"] as! String, price: document.data()["price"] as! String, category: document.data()["category"] as! String)
                print(product)
                self.productsForCategory.append(product)
            }
                
        }
    }
}

//struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
////        CategoryView(categoryName: "MENs Accessories", currentProductClicked: <#Product#>)
//    }
//}
