//
//  PopcornView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct PopcornView: View {
    
    var body: some View {
        Page<Destination, Group> { context in
            Group {
                List {
                    Section {
                        Button("Pop") {
                            context.router.pop()
                        }
                    }
                    
                    Section {
                        Button("Pop to nearest root") {
                            context.router.pop(.toNearestRoot)
                        }
                    } header: {
                        Text("Pop to nearest root")
                    }
                    
                    Section {
                        Button("Pop the last 2 (one by one)") {
                            context.router.pop(.theLastWith(style: .oneByOne, last: 2))
                        }
                        
                        Button("Pop the last 5 (one by one)") {
                            context.router.pop(.theLastWith(style: .oneByOne, last: 5))
                        }
                        
                        Button("Pop to index 1 (one by one)") {
                            context.router.pop(.toIndexWith(style: .oneByOne, index: 1))
                        }
                        
                        Button("Pop to root (one by one)") {
                            context.router.pop(.toRootWith(style: .oneByOne))
                        }
                        
                        Button("Pop to nearest root (one by one)") {
                            context.router.pop(.toNearestRootWith(style: .oneByOne))
                        }
                    } header: {
                        Text("Pop one by one")
                    }
                    
                }
                .navigationTitle("🍿")
            }
        }
    }
}

