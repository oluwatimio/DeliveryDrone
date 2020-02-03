//
//  HomeView.swift
//  Delivery Drone Swift UI
//
//  Created by Timi Owoturo on 2020-01-03.
//  Copyright © 2020 CEG4912. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    let categories = Category.getCategories()
    var body: some View {
        ScrollView(.vertical, content : {
            VStack (spacing: 20) {
                ForEach(categories){ catalog in
                    NavigationLink(destination: CategoryView(categoryName: catalog.category)
                    ) {
                        CardFullImage(image: catalog.imageLink, category: catalog.category, title: catalog.title, subtitle: catalog.subtitle)
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
