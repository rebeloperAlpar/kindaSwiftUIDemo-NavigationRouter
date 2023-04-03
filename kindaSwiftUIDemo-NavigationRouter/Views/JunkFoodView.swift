//
//  JunkFoodView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct JunkFoodView: View {
    
    let title: String
    
    var body: some View {
        Page<Destination, Group> { context in
            Group {
                List {
                    Section {
                        Button("Pop") {
                            context.router.pop()
                        }
                        
                        Button("Pop the last 2") {
                            context.router.pop(.the(last: 2))
                        }
                    } header: {
                        Text("Pop")
                    }

                    Section {
                        Button("Push 🍫") {
                            context.router.push(.chocolateView)
                        }
                    } header: {
                        Text("Push")
                    }
                }
                .navigationTitle(title)
            }
        }
    }
}
