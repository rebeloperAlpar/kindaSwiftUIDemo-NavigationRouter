//
//  CookieView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct CookieView: View {
    
    @EnvironmentObject private var router: Router<Destination>
    
    var body: some View {
        List {
            Section {
                Button("Pop") {
                    router.pop()
                }
                
                Button("Pop the last 4") {
                    router.pop(.the(last: 4))
                }
                
                Button("Pop to index 1") {
                    router.pop(.to(index: 1))
                }
                
                Button("Pop to root") {
                    router.pop(.toRoot)
                }
            } header: {
                Text("Pop")
            }

            Section {
                Button("Push 🍿") {
                    router.push(.popcornView)
                }
            } header: {
                Text("Push")
            }
        }
        .navigationTitle("🍪")
    }
}

