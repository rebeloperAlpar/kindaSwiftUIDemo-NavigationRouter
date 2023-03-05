//
//  JunkFoodView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct JunkFoodView: View {
    
    @EnvironmentObject private var router: Router<Destination>
    
    let title: String
    
    var body: some View {
        List {
            Section {
                Button("Pop") {
                    router.pop()
                }
                
                Button("Pop the last 2") {
                    router.pop(.the(last: 2))
                }
            } header: {
                Text("Pop")
            }

            Section {
                Button("Push 🍫") {
                    router.push(.chocolateView)
                }
            } header: {
                Text("Push")
            }
        }
        .navigationTitle(title)
    }
}
