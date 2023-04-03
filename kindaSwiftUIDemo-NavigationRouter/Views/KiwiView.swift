//
//  KiwiView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct KiwiView: View {
    
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
                        Button("Pop the last 10") {
                            context.router.pop(.the(last: 10))
                        }
                        
                        Button("Pop to index -5") {
                            context.router.pop(.to(index: -5))
                        }
                        
                        Button("Pop to index 10") {
                            context.router.pop(.to(index: 10))
                        }
                        
                        Button("Pop the last 10 (one by one)") {
                            context.router.pop(.theLastWith(style: .oneByOne, last: 10))
                        }
                        
                        Button("Pop to index -5 (one by one)") {
                            context.router.pop(.toIndexWith(style: .oneByOne, index: -5))
                        }
                        
                        Button("Pop to index 10 (one by one)") {
                            context.router.pop(.toIndexWith(style: .oneByOne, index: 10))
                        }
                    } header: {
                        Text("Invalid or out of range pops")
                    }
                    
                }
                .navigationTitle("🥝")
                .toolbar(.hidden, for: .tabBar)
            }
        }
    }
}

