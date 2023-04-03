//
//  DoughnutView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct DoughnutView: View {
    
    var body: some View {
        Page<Destination, Group> { context in
            Group {
                List {
                    Section {
                        Button("Pop") {
                            context.router.pop()
                        }
                    } header: {
                        Text("Pop")
                    }

                    Section {
                        Button("Push 🌭") {
                            context.router.push(.junkFoodView(dependency: "🌭"))
                        }
                    } header: {
                        Text("Push")
                    }
                    
                }
                .navigationTitle("🍩")
            }
        }
    }
}

