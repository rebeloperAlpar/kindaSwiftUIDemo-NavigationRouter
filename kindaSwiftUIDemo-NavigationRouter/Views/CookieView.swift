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
        Page<Destination, Group> { context in
            Group {
                List {
                    Section {
                        Button("Pop") {
                            context.router.pop()
                        }
                        
                        Button("Pop the last 4") {
                            context.router.pop(.the(last: 4))
                        }
                        
                        Button("Pop to index 1") {
                            context.router.pop(.to(index: 1))
                        }
                        
                        Button("Pop to root") {
                            context.router.pop(.toRoot)
                        }
                    } header: {
                        Text("Pop")
                    }

                    Section {
                        Button("Push 🍿") {
                            context.router.push(.popcornView)
                        }
                    } header: {
                        Text("Push")
                    }
                }
                .navigationTitle("🍪")
            }
        }
    }
}

