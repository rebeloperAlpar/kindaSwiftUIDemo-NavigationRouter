//
//  DoughnutView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct DoughnutView: View {
    
    @EnvironmentObject private var router: Router<Destination>
    
    var body: some View {
        List {
            Section {
                Button("Pop") {
                    router.pop()
                }
            } header: {
                Text("Pop")
            }

            Section {
                Button("Push 🌭") {
                    router.push(.junkFoodView(dependency: "🌭"))
                }
            } header: {
                Text("Push")
            }
            
        }
        .navigationTitle("🍩")
    }
}

